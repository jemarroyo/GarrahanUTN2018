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

import p2018.backend.entities.ConfigElement;
import p2018.backend.repository.ConfigElementRepository;

@RestController
@RequestMapping("/api")
public class ConfigElementController {
	
	@Autowired
	private ConfigElementRepository configElementRepository;
	
	@GetMapping("/config")
	public List<ConfigElement> getConfigElements(){
		return configElementRepository.findAll();
	}
	
	@GetMapping("/config/{name}")
	public ConfigElement getConfigElement(@PathVariable String name){
		return configElementRepository.getOne(name);
	}
	
	@DeleteMapping("/config/{name}")
	public boolean deleteConfigElement(@PathVariable String name){
		configElementRepository.deleteById(name);
		return true;
	}
	
	@PostMapping("/config")
	public ConfigElement createConfigElement(@RequestBody ConfigElement configElemen){
		return configElementRepository.save(configElemen);
	}
	
	@PutMapping("/config")
	public ConfigElement updateConfigElement(@RequestBody ConfigElement configElemen){
		return configElementRepository.save(configElemen);
	}

}
