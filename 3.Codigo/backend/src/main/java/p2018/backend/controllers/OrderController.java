package p2018.backend.controllers;

import static org.springframework.http.ResponseEntity.ok;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import p2018.backend.entities.CommentDTO;
import p2018.backend.entities.GeneralComment;
import p2018.backend.entities.Institution;
import p2018.backend.entities.InstitutionType;
import p2018.backend.entities.OrderInfo;
import p2018.backend.entities.OrderInfoDTO;
import p2018.backend.entities.OrderTransition;
import p2018.backend.entities.Unit;
import p2018.backend.entities.UnitDTO;
import p2018.backend.entities.UnitType;
import p2018.backend.entities.UnitTypeMappings;
import p2018.backend.entities.UpdatedOrderDTO;
import p2018.backend.entities.User;
import p2018.backend.exceptions.GarrahanAPIException;
import p2018.backend.repository.GeneralCommentRepository;
import p2018.backend.repository.InstitutionRepository;
import p2018.backend.repository.InstitutionTypeRepository;
import p2018.backend.repository.OrderInfoDTORepository;
import p2018.backend.repository.OrderRepository;
import p2018.backend.repository.OrderTransitionRepository;
import p2018.backend.repository.UnitRepository;
import p2018.backend.repository.UnitTypeMappingsRepository;
import p2018.backend.repository.UnitTypeRepository;
import p2018.backend.repository.UserRepository;
import p2018.backend.utils.Constants;
import p2018.backend.utils.JwtTokenUtil;
import p2018.backend.utils.RequestFilterParser;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins="http://localhost:4200", allowedHeaders="*")
public class OrderController {
	
	@Autowired
	private OrderRepository orderrepository;
	
	@Autowired
	private OrderInfoDTORepository orderInfoDTORepository;
	
	@Autowired
	private OrderTransitionRepository orderTransitionRepository;
	
	@Autowired
	private UnitRepository unitRepository;
	
	@Autowired
	private RequestFilterParser requestFilterParser;
	
	@Autowired
	private InstitutionTypeRepository institutionTypeRepository;
	
	@Autowired
	private InstitutionRepository  institutionRepository;
	
	@Autowired
	private UnitTypeRepository unitTypeRepository;
	
	@Autowired
	private UnitTypeMappingsRepository unitTypeMappingsRepository;
	
	@Autowired
	private GeneralCommentRepository generalCommentRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private JwtTokenUtil tokenUtil;
	
	@GetMapping("/orders")
	public List<OrderInfo> getOrders(){
		return orderrepository.findAll();
	}
	
	@SuppressWarnings("rawtypes")
	@GetMapping("/orders/page")
	public ResponseEntity getPagedOrders(@RequestParam("filter") String query, Pageable pageable){
		
		Pageable pageRequest = requestFilterParser.createPageRequest(query);
		
		Specification orderSpec = requestFilterParser.crateOrderSpecification(query);
        
		Page<OrderInfo> orders =  orderrepository.findAll(orderSpec, pageRequest);
		Long listCount = orders.getTotalElements();
		List<OrderInfo> orderPage = orders.getContent();
		
		Map<Object, Object> model = new HashMap<>();
        model.put("count", listCount);
        model.put("items", orderPage);
        return ok(model);
        
	}
	
	@GetMapping("/orders/{id}")
	public OrderInfo getOrder(@PathVariable Long id, @RequestHeader("Authorization") String token){
		
		String message = null;
		String workingToken = token.replace(Constants.TOKEN_BEARER_PREFIX, "");
		String username = tokenUtil.getUsernameFromToken(workingToken);
		User user;
		
		if(workingToken != null || username != null) {
			
			OrderInfo order = orderrepository.getOne(id);
			user = userRepository.findByUsername(username);
			
			if(user.getIsInternal() || order.getInstitutionId() == user.getInstitutionId()) {
				message = "ok";
			}else {
				message = "No tiene permisos para acceder a la order: " + id;
				Exception e = new Exception("Error de acceso");
				throw new GarrahanAPIException(message, e);
			}	
		}
		
		return orderrepository.getOne(id);
	}
	
	@DeleteMapping("/orders/{id}")
	public boolean deleteOrder(@PathVariable Long id){
		orderrepository.deleteById(id);
		return true;
	}
	
	@PostMapping("/orders")
	@Transactional
	public OrderInfo createOrder(@RequestBody OrderInfoDTO order){
		
		OrderInfoDTO orderDTO = null;
		String message = null;
		
		try {
			
			Institution intitution = institutionRepository.getOne(order.getInstitutionId());
			Collection<UnitDTO> units = order.getUnits();
			
			order.setUnitCount(units.size());
			orderDTO =  orderInfoDTORepository.save(order);
			
			for (UnitDTO unitDTO : units) {
				
				Unit unit = new Unit();
				unit.setCode(unitDTO.getCode());
				unit.setOrderId(orderDTO.getId());
				unit.setUnitTypeId(unitDTO.getUnitTypeId());
				
				unitRepository.save(unit);
			}
			
			List<UnitType> unitTypes = unitTypeRepository.findAll();
			
			for (Iterator<UnitType> iterator = unitTypes.iterator(); iterator.hasNext();) {
				
				UnitType unitType = (UnitType) iterator.next();
				UnitTypeMappings unitTypeMaping = new UnitTypeMappings();
				unitTypeMaping.setOrderId(orderDTO.getId());
				unitTypeMaping.setUnitTypeId(unitType.getId());
				int count = 0;
				
				
				for (UnitDTO unitDTO : units) {
					if(unitDTO.getUnitTypeId().equals(unitType.getId())) {
						count++;
					}
				}
				
				unitTypeMaping.setCount(count);
				unitTypeMappingsRepository.save(unitTypeMaping);
			}
			
			intitution.setOrderCount(intitution.getOrderCount() + 1);
			institutionRepository.save(intitution);
			
		} catch (Exception e) {
			message = "Error actualizando Order.";
			throw new GarrahanAPIException(message, e);
		}
		
		return orderrepository.getOne(orderDTO.getId());
	}
	
	@PutMapping("/orders/update/{id}")
	@Transactional
	public OrderInfo confirmOrderEdition(@RequestBody UpdatedOrderDTO order, @PathVariable Long id){
		
		OrderInfo savedOrder = null;
		String message = null;
		
		try {
			savedOrder = orderrepository.getOne(id);
			
			savedOrder.setCarrier(order.getCarrier());
			savedOrder.setCode(order.getCode());
			savedOrder.setPriorityId(order.getPriorityId());
			savedOrder.setStatusId(order.getStatusId());
			savedOrder.setOwnerId(order.getOwnerId());
			savedOrder.setInstitutionId(order.getInstitutionId());
			savedOrder.setUnitCount(order.getUnits().size());
			
			savedOrder = orderrepository.save(savedOrder);	
			
			if(order.getRemovedUnitIds().size() > 0) {
				for (Long unitId : order.getRemovedUnitIds()) {
					unitRepository.deleteById(unitId);
				}
			}
			
			List<UnitDTO> units = order.getUnits();
			
			for (UnitDTO unitDTO : units) {
				
				if(unitDTO.getId() != null) {
					
					Unit unitWithId = unitRepository.getOne(unitDTO.getId());
					unitWithId.setCode(unitDTO.getCode());
					unitWithId.setCreationDate(unitDTO.getCreationDate());
					unitWithId.setOrderId(savedOrder.getId());
					unitWithId.setUnitTypeId(unitDTO.getUnitTypeId());
					
					unitRepository.save(unitWithId);
					
				}else {
					
					Unit unitWithoutId = new Unit();
					unitWithoutId.setCode(unitDTO.getCode());
					unitWithoutId.setCreationDate(unitDTO.getCreationDate());
					unitWithoutId.setOrderId(savedOrder.getId());
					unitWithoutId.setUnitTypeId(unitDTO.getUnitTypeId());
					
					unitRepository.save(unitWithoutId);
				}
			}
			
			
			for (UnitTypeMappings unitTypeMap : unitTypeMappingsRepository.getAllByOrderId(id)) {
				unitTypeMappingsRepository.delete(unitTypeMap);
			}
			
			List<UnitType> unitTypes = unitTypeRepository.findAll();
			
			for (Iterator<UnitType> iterator = unitTypes.iterator(); iterator.hasNext();) {
				
				UnitType unitType = (UnitType) iterator.next();
				UnitTypeMappings unitTypeMaping = new UnitTypeMappings();
				unitTypeMaping.setOrderId(id);
				unitTypeMaping.setUnitTypeId(unitType.getId());
				int count = 0;
				
				
				for (UnitDTO unitDTO : units) {
					if(unitDTO.getUnitTypeId().equals(unitType.getId())) {
						count++;
					}
				}
				
				unitTypeMaping.setCount(count);
				unitTypeMappingsRepository.save(unitTypeMaping);
				
			}
			
		}catch (Exception e) {
			message = "Error actualizando Order.";
			throw new GarrahanAPIException(message, e);
		}
		
		return savedOrder;
	}
	
	@GetMapping("/orders/{id}/units/count")
	public  Integer getOrderUnitsCount(@PathVariable Long orderId){
		return unitRepository.findUnitsCountByOrderId(orderId).intValue();
	}
	
	@PatchMapping("/orders/{id}")
	public ResponseEntity<OrderInfo> partialUpdateName(@RequestBody OrderTransition partialUpdate, @PathVariable("id") String id) {
	    
		partialUpdate.setId(new Long(id));
		orderTransitionRepository.save(partialUpdate);
		OrderInfo order = orderrepository.getOne(new Long(id));
		
	    return ResponseEntity.ok(order);
	}
	
	@GetMapping("/orders/monthlyReport")
	public ResponseEntity<?> getOrderMomthlyReport(@RequestParam("date") String date){
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.000'Z'");
		Date startDate;
		Calendar cal = Calendar.getInstance();
		
		List<OrderInfo> orders = new ArrayList<OrderInfo>();
		List<InstitutionType> institutionTypes = new ArrayList<InstitutionType>();
		List<Institution> institutions = new ArrayList<Institution>();
		List<UnitType> unitTypes = new ArrayList<UnitType>();
		
		try {
			startDate = dateFormat.parse(date);
			cal.setTime(startDate);
			cal.add(Calendar.MONTH, 1);
			Date endDate = cal.getTime();
		
			orders = orderrepository.getMonthlyReport(startDate, endDate);
			institutionTypes = institutionTypeRepository.findAll();
			institutions = institutionRepository.findAll();
			unitTypes = unitTypeRepository.findAll();
			
		} catch (ParseException e) {
			e.printStackTrace();
			throw new GarrahanAPIException("Error parsing filter parameter from request", e);
		}
		
		Map<Object, Object> model = new HashMap<>();
		model.put("institutionTypes", institutionTypes);
		model.put("institutions", institutions);
		model.put("orders", orders);
		model.put("startOfMonth", date);
		model.put("unitTypes", unitTypes);

        return ok(model);
	}
	
	@GetMapping("/orders/dailyReport")
	public ResponseEntity<?> getOrderDaylyReport(@RequestParam("date") String date){
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.000'Z'");
		Date selectedDate;
		
		List<OrderInfo> orders = new ArrayList<OrderInfo>();
		List<InstitutionType> institutionTypes = new ArrayList<InstitutionType>();
		
		try {
			selectedDate = dateFormat.parse(date);
			Date endDate = new Date(selectedDate.getTime() - 2);
		
			orders = orderrepository.getMonthlyReport(selectedDate, endDate);
			institutionTypes = institutionTypeRepository.findAll();
			
		} catch (ParseException e) {
			throw new GarrahanAPIException("Error parsing filter parameter from request", e);
		}
		
		Map<Object, Object> model = new HashMap<>();
		
		model.put("date", selectedDate);
		model.put("institutionTypes", institutionTypes);
		model.put("orders", orders);
		model.put("total", orders.size());
		
		return ok(model);
	}
	
	@PostMapping("orders/{id}/comments")
	public ResponseEntity<?> createComment(@RequestBody CommentDTO commentDto, @PathVariable Long id, @RequestHeader("Authorization") String token){
		
		Map<Object, Object> model = new HashMap<>();
		String message = null;
		String workingToken = token.replace(Constants.TOKEN_BEARER_PREFIX, "");
		String username = tokenUtil.getUsernameFromToken(workingToken);
		User user;
		
		try {
			if (username != null) {
				
				user = userRepository.findByUsername(username);
				
				GeneralComment comment = new GeneralComment();
				comment.setOperatorId(user.getId());
				comment.setOrderId(id);
				comment.setDate((new Timestamp((new Date()).getTime())));
				comment.setText(commentDto.getText());
		
				generalCommentRepository.save(comment);
				message = "Comentario agregado con éxito";
			}else {
				message = "No se pudo obtener el usuario";
			}
		} catch (Exception e) {
			throw new GarrahanAPIException(message, e);
		}
		
		model.put("message", message);
		return ok(model);
		
	}
	
	@GetMapping("/orders/{id}/comments")
	public  ResponseEntity getOrderGeneralComments(@PathVariable Long orderId){
		
		Map<Object, Object> model = new HashMap<>();
		List<GeneralComment> comments = generalCommentRepository.findCommentByOrderId(orderId);
		
		model.put("comments", comments);
		return ok(model);
	}
	
}
