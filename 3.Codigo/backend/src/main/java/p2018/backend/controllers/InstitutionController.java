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

import p2018.backend.entities.Institution;
import p2018.backend.entities.InstitutionDTO;
import p2018.backend.entities.InstitutionType;
import p2018.backend.entities.User;
import p2018.backend.repository.InstitutionRepository;
import p2018.backend.repository.InstitutionTypeRepository;
import p2018.backend.repository.OrderRepository;
import p2018.backend.repository.UserRepository;

@RestController
@RequestMapping("/api")
@CrossOrigin
public class InstitutionController {
	
	@Autowired
	private InstitutionRepository institutionRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private OrderRepository orderRepository;
	
	@Autowired
	private InstitutionTypeRepository institutionTypeRepo;
	
	@GetMapping("/institutions")
	public List<Institution> getInstitutions(){
		return institutionRepository.findAll();
	}
	
	
	@GetMapping("/institutions/{id}")
	public InstitutionDTO getInstitution(@PathVariable Long id){
		
		Institution institution = institutionRepository.getOne(id);
		InstitutionDTO dto = new InstitutionDTO();
		
		dto.setAddress(institution.getAddress());
		dto.setCreationDate(institution.getCreationDate());
		dto.setCuit(institution.getCuit());
		dto.setEmail(institution.getEmail());
		dto.setId(institution.getId());
		dto.setInvalidCharCount(institution.getInvalidCharCount());
		dto.setName(institution.getName());
		dto.setOrderCount(institution.getOrderCount());
		dto.setType(institution.getType());
		dto.setUserCount(institution.getUserCount());
		
		List<User> users = userRepository.findUserListByInstitutionId(id);
		dto.setUsers(users);
		
		return dto;
	}
	
	@PostMapping("/institutions")
	public Institution createInstitution(@RequestBody Institution institution){
		return institutionRepository.save(institution);
	}
	
	@PutMapping("/institutions/{id}")
	public Institution updateInstitution(@RequestBody Institution institution, @PathVariable Long id){
		
		Long userCount = userRepository.findUserCountByInstitytionId(institution.getId());
		Institution savedInstiturion = institutionRepository.getOne(id);
		
		institution.setUserCount(userCount.intValue());
		return institutionRepository.save(institution);
	}
	
	@GetMapping("/institutions/{id}/users/count")
	public  Integer getInstitutionUsersCount(@PathVariable Long institutionId){
		return userRepository.findUserCountByInstitytionId(institutionId).intValue();
	}
	
	@GetMapping("/institutions/{id}/orders/count")
	public  Integer getInstitutionOrdersCount(@PathVariable Long institutionId){
		return orderRepository.findOrderCountByInstitytionId(institutionId).intValue();
	}
	
	@GetMapping("/institutionTypes")
	public List<InstitutionType> getInstitutionTypes(){
		return institutionTypeRepo.findAll();
	}
}
