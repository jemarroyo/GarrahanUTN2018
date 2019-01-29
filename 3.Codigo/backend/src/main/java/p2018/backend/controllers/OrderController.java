package p2018.backend.controllers;

import static org.springframework.http.ResponseEntity.ok;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import p2018.backend.entities.OrderInfo;
import p2018.backend.repository.OrderRepository;
import p2018.backend.repository.UnitRepository;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins="http://localhost:4200", allowedHeaders="*")
public class OrderController {

	@Autowired
	private OrderRepository orderrepository;
	
	@Autowired
	private UnitRepository unitRepository;
	
	@GetMapping("/orders")
	public List<OrderInfo> getOrders(){
		return orderrepository.findAll();
	}
	
	@SuppressWarnings("rawtypes")
	@GetMapping("/orders/page")
	public ResponseEntity getPagedOrders(@RequestParam("filter") String query, Pageable pageable){
		
		List<OrderInfo> orders = orderrepository.findAll();
		Integer listCount = orders.size();
		
		Map<Object, Object> model = new HashMap<>();
        model.put("count", listCount);
        model.put("items", orders);
        return ok(model);
        
	}
	
	@GetMapping("/orders/{id}")
	public OrderInfo getOrder(@PathVariable Long id){
		return orderrepository.getOne(id);
	}
	
	@DeleteMapping("/orders/{id}")
	public boolean deleteOrder(@PathVariable Long id){
		orderrepository.deleteById(id);
		return true;
	}
	
	@PostMapping("/orders")
	public OrderInfo createUnit(@RequestBody OrderInfo order){
		return orderrepository.save(order);
	}
	
	@PutMapping("/orders")
	public OrderInfo updateUnit(@RequestBody OrderInfo order){
		return orderrepository.save(order);
	}
	
	@GetMapping("/orders/{id}/units/count")
	public  Integer getOrderUnitsCount(@PathVariable Long orderId){
		return unitRepository.findUnitsCountByOrderId(orderId).intValue();
	}
	
	@RequestMapping(value = "/orders/{id}", method = RequestMethod.PATCH, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> partialUpdateGeneric(
	  @RequestBody Map<String, Object> updates,
	  @PathVariable("id") String id) {
	     
		orderrepository.save(updates, id);
	    return ResponseEntity.ok("resource updated");
	}
	
}
