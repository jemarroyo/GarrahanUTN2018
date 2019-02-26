package p2018.backend.controllers;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import p2018.backend.entities.Irradiation;
import p2018.backend.entities.IrradiationDTO;
import p2018.backend.entities.OrderInfoDTO;
import p2018.backend.entities.Unit;
import p2018.backend.repository.IrradiationDTORepository;
import p2018.backend.repository.IrradiationRepository;
import p2018.backend.repository.OrderInfoDTORepository;
import p2018.backend.repository.UnitRepository;

@RestController
@RequestMapping("/api")
@CrossOrigin
public class IrradiationController {
	
	@Autowired
	private IrradiationRepository irradiationRepository;
	
	@Autowired
	private IrradiationDTORepository irradiationDTORepository;
	
	@Autowired
	private UnitRepository unitRepository;
	
	@Autowired
	private OrderInfoDTORepository orderInfoDTORepository;
	
	@GetMapping("/irradiations")
	public List<Irradiation> getIrradiations(){
		return irradiationRepository.findAll();
	}
	
	@GetMapping("/irradiations/{id}")
	public Irradiation getIrradiation(@PathVariable Long id){
		return irradiationRepository.getOne(id);
	}
	
	@PutMapping("/irradiations")
	public Irradiation updateIrradiation(@RequestBody Irradiation rradiation){
		return irradiationRepository.save(rradiation);
	}
	
	@PostMapping("/orders/{id}/irradiations")
	public Irradiation createIrradiation(@RequestBody IrradiationDTO irradiation, @PathVariable long id){
		
		irradiation.setOrderId(id);
		irradiation.setUnitCount(irradiation.getUnits().size());
		Iterator<Long> iterator = irradiation.getUnits().iterator();
		List<Unit> units = new ArrayList<Unit>();
	    
	    IrradiationDTO saveIrradiation =  irradiationDTORepository.save(irradiation);
	    
	    while(iterator.hasNext()) {
	    	Unit unitTemp = unitRepository.getOne(iterator.next());
	        unitTemp.setIrradiated(true);
	        unitTemp.setIrradiationId(saveIrradiation.getId());
	        unitTemp.setIrradiatorUserId(saveIrradiation.getIrradiatorId());
	        units.add(unitTemp);
	    }
	    
	    unitRepository.saveAll(units);
	    Irradiation returnValue = irradiationRepository.getOne(saveIrradiation.getId());
	    Long pendingUnits = unitRepository.findPendingUnits(id, false);
	    
	    if(pendingUnits == 0) {
	    	
	    	OrderInfoDTO order = orderInfoDTORepository.getOne(id);
	    	order.setStatusId(OrderInfoDTO.FINAL_STATUS);
	    	order.setCompletionDate(new Timestamp((new Date()).getTime()));
	    	orderInfoDTORepository.save(order);
	    }
	    
	    return returnValue;
	}

}
