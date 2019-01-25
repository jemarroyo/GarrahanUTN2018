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

import p2018.backend.entities.User;
import p2018.backend.repository.UserRepository;

@RestController
@RequestMapping("/api")
public class UserController {

	@Autowired
	private UserRepository userRepository;
	
	@GetMapping("/xusers")
	public List<User> getUsers(){
		return userRepository.findAll();
	}
	
	@GetMapping("/xuser/{id}")
	public User getUser(@PathVariable Long id){
		return userRepository.getOne(id);
	}
	
	@DeleteMapping("/xuser/{id}")
	public boolean deleteUser(@PathVariable Long id){
		 userRepository.deleteById(id);
		 return true;
	}
	
	@PostMapping("/xuser")
	public User createUser(@RequestBody User user){
		return userRepository.save(user);
	}
	
	@PutMapping("/xuser")
	public User updateUser(@RequestBody User user){
		return userRepository.save(user);
	}
}
