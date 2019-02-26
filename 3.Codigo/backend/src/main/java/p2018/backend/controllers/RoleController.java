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

import p2018.backend.entities.Role;
import p2018.backend.repository.RoleRepository;

@RestController
@RequestMapping("/api")
@CrossOrigin
public class RoleController {
	
	@Autowired
	private RoleRepository roleRepository;
	
	@GetMapping("/roles")
	public List<Role> getRoles(){
		return roleRepository.findAll();
	}
	
	@GetMapping("/role/{id}")
	public Role getRole(@PathVariable Long id){
		return roleRepository.getOne(id);
	}
	
	@PostMapping("/role")
	public Role createRole(@RequestBody Role role){
		return roleRepository.save(role);
	}
	
	@PutMapping("/role")
	public Role updateRole(@RequestBody Role role){
		return roleRepository.save(role);
	}
	
}
