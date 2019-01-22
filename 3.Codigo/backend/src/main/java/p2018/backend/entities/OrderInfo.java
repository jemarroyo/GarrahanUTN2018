package p2018.backend.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;


@Entity
public class OrderInfo extends AuditableEntity implements Serializable {

	private static final long serialVersionUID = -1822331454767706045L;

	private String code;
	private String carrier;
	private Date acceptedOn;
	private Date completionDate;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "statusId")
	private OrderStatus status;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "priorityId")
	private Priority priority;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "institutionId")
	private Institution institution;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "operatorId")
	private User operator;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ownerId")
	private User owner;
	

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCarrier() {
		return carrier;
	}

	public void setCarrier(String carrier) {
		this.carrier = carrier;
	}

	public Date getAcceptedOn() {
		return acceptedOn;
	}

	public void setAcceptedOn(Date aceptedOn) {
		this.acceptedOn = aceptedOn;
	}

	public Date getCompletionDate() {
		return completionDate;
	}

	public void setCompletionDate(Date completionDate) {
		this.completionDate = completionDate;
	}

	public Priority getPriority() {
		return priority;
	}

	public void setPriority(Priority priority) {
		this.priority = priority;
	}

	public Institution getInstitution() {
		return institution;
	}

	public void setInstitution(Institution institution) {
		this.institution = institution;
	}

	public User getOperator() {
		return operator;
	}

	public void setOperator(User operator) {
		this.operator = operator;
	}

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}

	public OrderStatus getStatus() {
		return status;
	}

	public void setStatus(OrderStatus status) {
		this.status = status;
	}

	public OrderInfo(String code, String carrier, Date acceptedOn, OrderStatus status, Priority priority) {
		this.code = code;
		this.carrier = carrier;
		this.acceptedOn = acceptedOn;
		this.status = status;
		this.priority = priority;
	}

	public OrderInfo() {

	}

	@Override
	public String toString() {
		return "Order [code=" + code + ", carrier=" + carrier + ", acceptedOn=" + acceptedOn + ", completionDate="
				+ completionDate + ", status=" + status + ", priority=" + priority + "]";
	}
	
	
	
}
