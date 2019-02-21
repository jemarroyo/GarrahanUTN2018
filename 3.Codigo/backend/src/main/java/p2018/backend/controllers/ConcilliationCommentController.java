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
import p2018.backend.entities.ConcilliationCommentDTO;
import p2018.backend.entities.OrderInfo;
import p2018.backend.exceptions.GarrahanAPIException;
import p2018.backend.repository.ConcilliationCommentRepository;
import p2018.backend.repository.OrderRepository;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins="http://localhost:4200", allowedHeaders="*")
public class ConcilliationCommentController {

	@Autowired
	private ConcilliationCommentRepository concilliationCommentRepository;
	
	@Autowired
	private OrderRepository orderRepository;
	
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
	public ConciliationComment createComment(@RequestBody ConcilliationCommentDTO comment, @PathVariable Long id){
		
		OrderInfo order = null;
		String message = null;
		ConciliationComment conciliationComment = new ConciliationComment();
		
		try {
			order = orderRepository.getOne(id);
			
			if(order.equals(null)) {
				message = "No hay órdenes con id: " + id;
				throw new Exception(message);
			}
			
			conciliationComment.setComment(comment.getComment());
			conciliationComment.setOrderId(id);
			conciliationComment.setDate(new Timestamp((new Date()).getTime()));
			conciliationComment.setOperatorId(comment.getOperatorId());
			
			conciliationComment = concilliationCommentRepository.save(conciliationComment);
			
		} catch (Exception e) {
			throw new GarrahanAPIException(message, e);
		}
		
		return conciliationComment;
	}
	
	@PutMapping("/comments")
	public ConciliationComment updateComment(@RequestBody ConciliationComment comment){
		return concilliationCommentRepository.save(comment);
	}
}
