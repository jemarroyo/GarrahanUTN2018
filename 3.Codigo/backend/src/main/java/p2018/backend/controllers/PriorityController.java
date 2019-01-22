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

import p2018.backend.entities.Priority;
import p2018.backend.repository.PriorityRepository;

@RestController
@RequestMapping("/api")
public class PriorityController {
	
	@Autowired
	private PriorityRepository priorityReposotory;
	
	@GetMapping("/priorities")
	public List<Priority> getPriorities(){
		return priorityReposotory.findAll();
	}
	
	@GetMapping("/priority/{id}")
	public Priority getPriority(@PathVariable Long id){
		return priorityReposotory.getOne(id);
	}
	
	@DeleteMapping("/priority/{id}")
	public boolean deletePriority(@PathVariable Long id){
		priorityReposotory.deleteById(id);
		return true;
	}
	
	@PostMapping("/priority")
	public Priority createUnit(@RequestBody Priority priority){
		return priorityReposotory.save(priority);
	}
	
	@PutMapping("/priority")
	public Priority updateUnit(@RequestBody Priority priority){
		return priorityReposotory.save(priority);
	}
}
