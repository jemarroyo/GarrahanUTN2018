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

import p2018.backend.entities.OrderStatus;
import p2018.backend.repository.OrderStatusRepository;

@RestController
@RequestMapping("/api")
@CrossOrigin
public class OrderStatusController {

	@Autowired
	private OrderStatusRepository orderStatusRepository;
	
	@GetMapping("/orderstatus")
	public List<OrderStatus> getOrderStatuses(){
		return orderStatusRepository.findAll();
	}
	
	@GetMapping("/order-status/{name}")
	public OrderStatus getOrderStatus(@PathVariable String name){
		return orderStatusRepository.getOne(name);
	}
	
	@PostMapping("/order-status")
	public OrderStatus createOrderStatus(@RequestBody OrderStatus orderStatus){
		return orderStatusRepository.save(orderStatus);
	}
	
	@PutMapping("/order-status")
	public OrderStatus updateeOrderStatus(@RequestBody OrderStatus orderStatus){
		return orderStatusRepository.save(orderStatus);
	}
}
