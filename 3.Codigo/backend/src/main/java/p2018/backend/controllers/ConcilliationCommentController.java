package p2018.backend.controllers;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import p2018.backend.entities.ConciliationComment;
import p2018.backend.repository.ConcilliationCommentRepository;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins="http://localhost:4200", allowedHeaders="*")
public class ConcilliationCommentController {

	@Autowired
	private ConcilliationCommentRepository concilliationCommentRepository;
	
	@GetMapping("/comments")
	public List<ConciliationComment> getComments(){
		return concilliationCommentRepository.findAll();
	}
	
	@GetMapping("/comments/{id}")
	public ConciliationComment getComment(@PathVariable Long id){
		return concilliationCommentRepository.getOne(id);
	}
	
	@DeleteMapping("/comments/{id}")
	public boolean deleteComment(@PathVariable Long id){
		concilliationCommentRepository.deleteById(id);
		return true;
	}
	
	@PostMapping("orders/{id}/conciliationComments")
	public ConciliationComment createComment(@RequestBody ConciliationComment comment, @PathVariable Long id){
		comment.setOrderId(id);
		comment.setDate(new Timestamp((new Date()).getTime()));
		return concilliationCommentRepository.save(comment);
	}
	
	@PutMapping("/comments")
	public ConciliationComment updateComment(@RequestBody ConciliationComment comment){
		return concilliationCommentRepository.save(comment);
	}
}
