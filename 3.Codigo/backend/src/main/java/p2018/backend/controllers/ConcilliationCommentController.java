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
import p2018.backend.entities.ConcilliationComment;
import p2018.backend.repository.ConcilliationCommentRepository;

@RestController
@RequestMapping("/api")
public class ConcilliationCommentController {

	@Autowired
	private ConcilliationCommentRepository concilliationCommentRepository;
	
	@GetMapping("/ConcilliationComments")
	public List<ConcilliationComment> getComments(){
		return concilliationCommentRepository.findAll();
	}
	
	@GetMapping("/ConcilliationComments/{id}")
	public ConcilliationComment getComment(@PathVariable Long id){
		return concilliationCommentRepository.getOne(id);
	}
	
	@DeleteMapping("/ConcilliationComments/{id}")
	public boolean deleteComment(@PathVariable Long id){
		concilliationCommentRepository.deleteById(id);
		return true;
	}
	
	@PostMapping("/ConcilliationComments")
	public ConcilliationComment createComment(@RequestBody ConcilliationComment comment){
		return concilliationCommentRepository.save(comment);
	}
	
	@PutMapping("/ConcilliationComments")
	public ConcilliationComment updateComment(@RequestBody ConcilliationComment comment){
		return concilliationCommentRepository.save(comment);
	}
}
