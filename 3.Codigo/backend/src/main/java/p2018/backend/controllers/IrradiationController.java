package p2018.backend.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import p2018.backend.entities.Irradiation;
import p2018.backend.repository.IrradiationRepository;

@RestController
@RequestMapping("/api")
public class IrradiationController {
	
	@Autowired
	private IrradiationRepository irradiationRepository;
	
	@GetMapping("/irradiations")
	public List<Irradiation> getIrradiations(){
		return irradiationRepository.findAll();
	}
	
	@GetMapping("/irradiation/{id}")
	public Irradiation getIrradiation(@PathVariable Long id){
		return irradiationRepository.getOne(id);
	}
	
	@DeleteMapping("/irradiation/{id}")
	public boolean deleteIrradiation(@PathVariable Long id){
		irradiationRepository.deleteById(id);
		return true;
	}
	
	@PutMapping("/irradiation")
	public Irradiation updateIrradiation(@RequestBody Irradiation rradiation){
		return irradiationRepository.save(rradiation);
	}
	
	@PostMapping("/orders/{id}/irradiation")
	public Irradiation createIrradiation(@RequestBody Irradiation irradiation, @PathVariable long id){
		irradiation.setOrderId(id);
		return irradiationRepository.save(irradiation);
	}

}
