import { Component, OnInit, OnDestroy, HostListener } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { OrderService, Order } from '../order.service';
import { FormControl, Validators, FormGroup } from '@angular/forms';
import { interval, GroupedObservable, Observable, from as fromPromise, timer, throwError, from } from 'rxjs';
import { map, flatMap, tap, take, catchError } from 'rxjs/operators';
import { NgbModal, NgbModalRef } from '@ng-bootstrap/ng-bootstrap';
import { ConfirmModalComponent } from '../confirm-modal/confirm-modal.component';
import { SessionService } from '../session.service';

import moment from "moment-es6"

import { MessageService, MessageType } from '../message.service';
import { CancelConfirmationModalComponent } from '../cancel-confirmation-modal/cancel-confirmation-modal.component';
import { ModalReloginComponent } from '../modal-relogin/modal-relogin.component';
import { SelectUnitModalComponent } from '../select-unit-modal/select-unit-modal.component';
import { ConfigService } from '../config.service';
import { isInteger } from '@ng-bootstrap/ng-bootstrap/util/util';
import { ConfirmActionModalComponent } from '../confirm-action-modal/confirm-action-modal.component';
import { CanComponentDeactivate } from '../can-component-deactivate';
import { AppMessagesService } from '../app-messages.service';
import { OperatorUsbConfigComponent } from '../operator-usb-config/operator-usb-config.component';

@Component({
    selector: 'app-order-irradiation',
    templateUrl: './order-irradiation.component.html',
    styleUrls: ['./order-irradiation.component.css']
})
export class OrderIrradiationComponent implements OnInit, OnDestroy, CanComponentDeactivate {

    irradiations: any[];

    cargaManual: FormControl = new FormControl(false);

    unitCodeDoesNotExist: boolean = false;
    order: Order

    commentForm: FormGroup = new FormGroup({
        text: new FormControl("", [Validators.required])
    })

    irradiationForm: FormGroup = new FormGroup({
        date: new FormControl(null, [Validators.required]),
        start: new FormControl(null, [Validators.required]),
        end: new FormControl(null, [Validators.required])
    })

    intervalSubscription

    usbReaderEnabled: FormControl = new FormControl(true);

    lastErrorCode: string

    isLoading = false;

    startTime: Date
    stopTime: Date

    elapsedTime: string

    tagCodeInvalidCharCount: number = 0
    unitCodeInvalidCharCount: number = 0

    invalidCharCount: number

    canStop: boolean = false;

    currentUser

    minTimeOfIrradiation: number;

    comment: FormControl = new FormControl("");

    isWaitingForTag: {} = { should: true }
    isWaitingForUnit: {} = { should: false }

    hasUnitCodeError: boolean = false;
    hasTagError: boolean = false;

    isIrradiationInProcess: boolean = false;

    pendingUnits: any[] = []
    completedUnits: any[] = []
    selectedUnits: any[] = []

    selectedTag: FormControl = new FormControl("", Validators.required);
    selectedUnitCode: FormControl = new FormControl("", Validators.required);

    private orderIncludes = [
        { irradiations: [{ units: { type: true } }, { irradiator: true }] },
        { priority: true },
        { orderAcceptor: true },
        { status: true },
        { owner: { institution: true } },
        { conciliationComments: { operator: true } },
        { unitTypeMappings: { unitType: true } },
        { units: { type: true } },
        { comments: { operator: true } }
    ];

    constructor(
        private route: ActivatedRoute,
        private router: Router,
        private appMessagesService: AppMessagesService,
        private messageService: MessageService,
        private sessionService: SessionService,
        private configService: ConfigService,
        private modalService: NgbModal,
        private orderService: OrderService) {

        this.sessionService.events
            .subscribe(s => {
                this.currentUser = s.user
            })

        this.irradiationForm.valueChanges.subscribe(data => console.log(data))

    }

    ngOnInit() {

        this.route.params
            .pipe(
                map((params) => params.id),
                tap(() => this.isLoading = true),
                flatMap((id) => this.orderService.findById(id, { include: this.orderIncludes })),
                tap(
                    () => this.isLoading = false,
                    () => this.isLoading = false
                )
            )
            .subscribe(
                (order) => this.prepare(order),
                (err) => this.handleErr(err)
            )


        this.configService.findAll()
            .subscribe((config) => {

                this.tagCodeInvalidCharCount = +((config.filter(d => (d as any).name === "tagCodeInvalidCharCount")[0] as any).value)
                this.minTimeOfIrradiation =
                    +((config.filter(d => (d as any).name === "minTimeOfIrradiationInMinutes")[0] as any).value) * 60 * 1000;

            }, (err) => {
                this.handleErr(err)
            })


    }

    ngOnDestroy() { }

    prepare(order: any) {

        [this.selectedTag, this.selectedUnitCode].forEach(d => d.reset())
        this.commentForm.reset()

        order.comments.sort((c1, c2) => c1.date > c2.date ? -1 : 1)

        this.order = order;

        this.unitCodeInvalidCharCount = +order.owner.institution.invalidCharCount

        this.irradiations = order.irradiations.sort((a, b) => a.irradiationStart > b.irradiationStart ? -1 : 1)

        this.selectedUnits = [];

        this.pendingUnits =
            order.units.filter(u => !u.irradiated);

        this.completedUnits =
            order.units
                .filter(u => u.irradiated)
                .map((u) => ({
                    ...u,
                    irradiationTime:
                        Math.ceil((new Date(u.irradiationEnd).getTime() - new Date(u.irradiationStart).getTime()) / (1000 * 60))
                }))


    }

    handleErr(err) {

        this.messageService.sendMessage({
            type: MessageType.DANGER,
            persist: false,
            text: err.message
        })

    }

    get canIrradiate() {

        return !!this.order && this.order.units.some(u => !u.irradiated)

    }

    onTagConfirmed() {

        if (this.usbEnabled())
            this.selectedTag.setValue(this.selectedTag.value.substr(this.tagCodeInvalidCharCount), { emitEvent: false })

        if (this.selectedTag.invalid) {
            this.hasTagError = true;
            return;
        }

        this.hasTagError = false;

        this.isWaitingForUnit = { should: true }

    }

    selectManually(unit) {

        let item = this.pendingUnits.splice(this.pendingUnits.findIndex(u => u === unit), 1)[0];

        item.irradiationTag = this.selectedTag.value;

        this.selectedUnits.unshift(item);

        this.isWaitingForUnit = { should: 1 }

        this.unitCodeDoesNotExist = false;

        this.hasUnitCodeError = false;

        this.sortSelectedUnits()

    }

    private sortSelectedUnits() {

        this.selectedUnits = this.selectedUnits.sort((u1, u2) => u1.type.code < u2.type.code ? -1 : 1);


    }

    private usbEnabled(): boolean {

        return this.usbReaderEnabled.value;

    }

    selectUnit() {

        if (!this.selectedTag.value) {
            this.hasTagError = true;
            return
        }

        if (this.usbEnabled())
            this.selectedUnitCode.setValue(this.selectedUnitCode.value.substr(this.unitCodeInvalidCharCount), { emitEvent: false })

        if (this.selectedUnitCode.invalid) {

            this.hasUnitCodeError = true;
            return;

        }

        this.hasUnitCodeError = false;

        let i = this.pendingUnits.filter(u => u.code === this.selectedUnitCode.value)

        if (i.length === 0) {

            this.unitCodeDoesNotExist = true;
            this.lastErrorCode = this.selectedUnitCode.value;
            this.selectedUnitCode.reset()
            return;

        }

        this.unitCodeDoesNotExist = false;

        if (i.length === 1) {

            let item = this.pendingUnits.splice(this.pendingUnits.findIndex(u => u === i[0]), 1)[0];

            item.irradiationTag = this.selectedTag.value;

            this.selectedUnits.unshift(item);

            this.selectedUnitCode.reset();

            this.isWaitingForUnit = { should: true }

            this.sortSelectedUnits()


        } else {

            let d: NgbModalRef = this.modalService.open(SelectUnitModalComponent, {
                size: "lg",
                backdrop: "static",
                centered: true,
                keyboard: false
            })

            d.componentInstance.units = i;

            from(d.result)
                .subscribe(selectedUnit => {

                    let item = this.pendingUnits.splice(this.pendingUnits.findIndex(u => u === selectedUnit), 1)[0];

                    item.irradiationTag = this.selectedTag.value;

                    this.selectedUnits.unshift(item);

                    this.selectedUnitCode.reset();

                    this.isWaitingForUnit = { should: true }

                    this.sortSelectedUnits()

                }, () => { })


        }


    }


    startIrradiation() {

        this.startTime = new Date();

        this.canStop = false;
        timer(this.minTimeOfIrradiation)
            .subscribe(() => {
                this.canStop = true
            })

        this.elapsedTime = "00:00:00"
        this.intervalSubscription = interval(1000)
            .pipe(map(d => {
                let s = moment(this.startTime.toISOString())
                let e = moment(new Date().toISOString())

                let diff = e.diff(s);

                this.elapsedTime = moment.utc(diff).format("HH:mm:ss");

            }))
            .subscribe();


        this.selectedTag.disable();
        this.selectedUnitCode.disable();

        this.isIrradiationInProcess = true;
        this.appMessagesService.irradiationStarted();

    }

    stopIrradiation() {

        this.stopTime = new Date();

        this.showConfirmationModal()
            .subscribe(() => {

                this.intervalSubscription.unsubscribe();

                this.showReloginModal()
                    .subscribe(() => {

                        this.selectedTag.enable();
                        this.selectedUnitCode.enable();

                        this.isIrradiationInProcess = false;

                        let irradiation = {
                            units: this.selectedUnits.map(u => u.id),
                            irradiationStart: this.startTime,
                            irradiationEnd: this.stopTime,
                            irradiationTag: this.selectedTag.value,
                            irradiationTime: Math.ceil((this.stopTime.getTime() - this.startTime.getTime()) / 1000 / 60),
                            irradiatorId: this.currentUser.id
                        }

                        this.orderService.addIrradiation(this.order.id, irradiation)
                            .pipe(
                                catchError(err => throwError(new Error(`Error al intentar registro de irradiación. ${err.message}`))),
                                flatMap(() => this.orderService.findById(this.order.id, { include: this.orderIncludes })),
                                catchError(err => throwError(new Error(`Error. ${err.message}`))),
                        )
                            .subscribe(
                                (d) => this.handleEndOfIrradiation(d),
                                (err) => this.handleFailingEndOfIrradiation(err)
                            );



                    }, () => {

                        console.log(`Login modal closed or dismissed`)

                    })


            }, () => {

                console.log(`Confirm modal closed`);

            })




    }

    createIrradiation() {

        const [year, month, day] = this.irradiationForm.controls.date.value.split("-");

        const [startHour, startMinute] = this.irradiationForm.controls.start.value.split(":")
        const [endHour, endMinute] = this.irradiationForm.controls.end.value.split(":")

        this.startTime = new Date(new Date(year, month - 1, day, startHour, startMinute).toISOString())
        this.stopTime = new Date(new Date(year, month - 1, day, endHour, endMinute).toISOString())

        this.showReloginModal()
            .subscribe(() => {

                this.selectedTag.enable();
                this.selectedUnitCode.enable();

                this.isIrradiationInProcess = false;

                let irradiation = {
                    units: this.selectedUnits.map(u => u.id),
                    irradiationStart: this.startTime,
                    irradiationEnd: this.stopTime,
                    irradiationTag: this.selectedTag.value,
                    irradiationTime: Math.ceil((this.stopTime.getTime() - this.startTime.getTime()) / 1000 / 60),
                    irradiatorId: this.currentUser.id
                }

                this.orderService.addIrradiation(this.order.id, irradiation)
                    .pipe(
                        catchError(err => throwError(new Error(`Error al intentar registro de irradiación. ${err.message}`))),
                        flatMap(() => this.orderService.findById(this.order.id, { include: this.orderIncludes })),
                        catchError(err => throwError(new Error(`Error. ${err.message}`))),
                )
                    .subscribe(
                        (d) => this.handleEndOfIrradiation(d),
                        (err) => this.handleFailingEndOfIrradiation(err)
                    );



            }, () => {

                console.log(`Login modal closed or dismissed`)

            })



    }

    private showConfirmationModal() {

        let d: NgbModalRef =
            this.modalService.open(ConfirmActionModalComponent, { backdrop: "static", keyboard: true, size: "lg" })

        d.componentInstance.title = "Confirmar fin de irradiación"
        d.componentInstance.message = "Está seguro de que desea terminar el proceso de irradiación ?"

        return fromPromise(d.result);

    }

    private showCommentModal() {

        let d: NgbModalRef =
            this.modalService.open(CancelConfirmationModalComponent, { backdrop: "static", keyboard: false, size: "lg" })

        return fromPromise(d.result);


    }

    private showReloginModal() {

        return fromPromise(
            this.modalService.open(ModalReloginComponent, { backdrop: "static", keyboard: false, size: "lg" }).result);

    }



    removeUnit(unit) {

        let removed = this.selectedUnits.splice(this.selectedUnits.indexOf(unit), 1)[0];
        this.pendingUnits.unshift(removed);

    }

    handleEndOfIrradiation(order: any) {

        let message = "La irradiación de los componentes se registró correctamente. "
        let add = order.status.name === "IRRADIADA" ? "La orden se ha completado en su totalidad." : "";

        let m = [message, add].join("");

        this.messageService.sendMessage({
            persist: true,
            type: MessageType.SUCCESS,
            text: m
        })

        this.appMessagesService.irradiationEnded()

        this.ngOnInit()

    }

    handleFailingEndOfIrradiation(err: any) {

        this.messageService.error(err.message)

        this.appMessagesService.irradiationEnded()

    }

    get hasTag() {

        return this.selectedTag.value && (this.isWaitingForUnit as any).should

    }


    get canStart() {

        return this.selectedUnits.length > 0

    }

    get isCargaManual() {

        return this.cargaManual.value

    }

    @HostListener('window:beforeunload', ['$event'])
    preventPageRefresh(event) {

        if (this.isIrradiationInProcess)
            event.returnValue = "Está seguro que desea salir ?"

    }


    canDeactivate() {

        return !this.isIrradiationInProcess

    }

    postComment() {


        this.orderService.addComment(this.order.id, { ...this.commentForm.value })
            .subscribe((comment) => this.ngOnInit(), err => this.handleErr(err))


    }

    configUsb() {

        let m = this.modalService.open(OperatorUsbConfigComponent, { size: "lg", centered: true, backdrop: "static" });

        (m.componentInstance as any).form.setValue({
            tagInvalidCharCount: +this.tagCodeInvalidCharCount,
            unitInvalidCharCount: +this.unitCodeInvalidCharCount
        })

        from(m.result)
            .subscribe((invalidChars: any) => {

                console.log(invalidChars)

                this.tagCodeInvalidCharCount = +invalidChars.tagInvalidCharCount
                this.unitCodeInvalidCharCount = +invalidChars.unitInvalidCharCount

            }, () => { })


    }

}
