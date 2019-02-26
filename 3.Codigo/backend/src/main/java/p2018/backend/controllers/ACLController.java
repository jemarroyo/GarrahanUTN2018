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

import p2018.backend.entities.ACL;
import p2018.backend.repository.ACLRepository;

@RestController
@RequestMapping("/api")
@CrossOrigin
public class ACLController {
	
	@Autowired
	private ACLRepository aCLRepository;
	
	@GetMapping("/acls")
	public List<ACL> getACLs(){
		return aCLRepository.findAll();
	}
	
	@GetMapping("/acl/{id}")
	public ACL getACL(@PathVariable Long id){
		return aCLRepository.getOne(id);
	}
	
	@PostMapping("/acl")
	public ACL createACL(@RequestBody ACL acl){
		return aCLRepository.save(acl);
	}
	
	@PutMapping("/acl")
	public ACL updateACL(@RequestBody ACL acl){
		return aCLRepository.save(acl);
	}
}
