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

import p2018.backend.entities.UnitType;
import p2018.backend.repository.UnitTypeRepository;

@RestController
@RequestMapping("/api")
public class UnitTypeContoller {
	
	@Autowired
	private UnitTypeRepository unitTypeRepository;

	@GetMapping("/unit-types")
	public List<UnitType> getUnitTypes(){
		return unitTypeRepository.findAll();
	}
	
	@GetMapping("/unit-type/{id}")
	public UnitType getUnitType(@PathVariable Long id){
		return unitTypeRepository.getOne(id);
	}
	
	@DeleteMapping("/unit-type/{id}")
	public boolean deleteUnitType(@PathVariable Long id){
		unitTypeRepository.deleteById(id);
		return true;
	}
	
	@PostMapping("/unit-type")
	public UnitType createUnitType(@RequestBody UnitType unitType){
		return unitTypeRepository.save(unitType);
	}
	
	@PutMapping("/unit-type")
	public UnitType updateUnitType(@RequestBody UnitType unitType){
		return unitTypeRepository.save(unitType);
	}
	
}
