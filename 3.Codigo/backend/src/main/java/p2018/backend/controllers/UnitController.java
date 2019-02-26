package p2018.backend.controllers;

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

import p2018.backend.entities.Unit;
import p2018.backend.repository.UnitRepository;

@RestController
@RequestMapping("/api")
@CrossOrigin
public class UnitController {
	
	@Autowired
	private UnitRepository unitRepository;
	
	@GetMapping("/units")
	public List<Unit> getUnits(){
		return unitRepository.findAll();
	}
	
	@GetMapping("/unit/{id}")
	public Unit getUnit(@PathVariable Long id){
		return unitRepository.getOne(id);
	}
	
	@PostMapping("/unit")
	public Unit createUnit(@RequestBody Unit unit){
		return unitRepository.save(unit);
	}
	
	@PutMapping("/unit")
	public Unit updateUnit(@RequestBody Unit unit){
		return unitRepository.save(unit);
	}
}
