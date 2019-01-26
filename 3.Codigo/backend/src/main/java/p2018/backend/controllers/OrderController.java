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

import p2018.backend.entities.OrderInfo;
import p2018.backend.repository.OrderRepository;
import p2018.backend.repository.UnitRepository;

@RestController
@RequestMapping("/api")
public class OrderController {

	@Autowired
	private OrderRepository orderrepository;
	
	@Autowired
	private UnitRepository unitRepository;
	
	@GetMapping("/orders")
	public List<OrderInfo> getOrders(){
		return orderrepository.findAll();
	}
	
	@GetMapping("/order/{id}")
	public OrderInfo getOrder(@PathVariable Long id){
		return orderrepository.getOne(id);
	}
	
	@DeleteMapping("/order/{id}")
	public boolean deleteOrder(@PathVariable Long id){
		orderrepository.deleteById(id);
		return true;
	}
	
	@PostMapping("/order")
	public OrderInfo createUnit(@RequestBody OrderInfo order){
		return orderrepository.save(order);
	}
	
	@PutMapping("/order")
	public OrderInfo updateUnit(@RequestBody OrderInfo order){
		return orderrepository.save(order);
	}
	
	@GetMapping("/order/{id}/units/count")
	public  Integer getOrderUnitsCount(@PathVariable Long orderId){
		return unitRepository.findUnitsCountByOrderId(orderId).intValue();
	}
	
}
