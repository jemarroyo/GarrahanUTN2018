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

import p2018.backend.entities.UnitType;
import p2018.backend.repository.UnitTypeRepository;

@RestController
@RequestMapping("/api")
@CrossOrigin
public class UnitTypeContoller {
	
	@Autowired
	private UnitTypeRepository unitTypeRepository;

	@GetMapping("/unit-types")
	public List<UnitType> getUnitTypes(){
		return unitTypeRepository.findAll();
	}
	
	@GetMapping("/unit-types/{id}")
	public UnitType getUnitType(@PathVariable Long id){
		return unitTypeRepository.getOne(id);
	}
	
	@PostMapping("/unit-types")
	public UnitType createUnitType(@RequestBody UnitType unitType){
		return unitTypeRepository.save(unitType);
	}
	
	@PutMapping("/unit-types/{id}")
	public UnitType updateUnitType(@RequestBody UnitType unitType, @PathVariable Long id){
		UnitType unit = unitTypeRepository.getOne(id);
		unit.setName(unitType.getName());
		return unitTypeRepository.save(unit);
	}
	
}
