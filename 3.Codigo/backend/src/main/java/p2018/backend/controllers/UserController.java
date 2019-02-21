package p2018.backend.controllers;

import static org.springframework.http.ResponseEntity.ok;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import p2018.backend.entities.Institution;
import p2018.backend.entities.User;
import p2018.backend.repository.InstitutionRepository;
import p2018.backend.repository.OrderRepository;
import p2018.backend.repository.UserRepository;
import p2018.backend.service.EmailSenderService;
import p2018.backend.utils.ActivationUserMessage;
import p2018.backend.utils.AuthenticationRequest;
import p2018.backend.utils.Constants;


@RestController
@RequestMapping("/api")
@CrossOrigin(origins="http://localhost:4200", allowedHeaders="*")
public class UserController {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private OrderRepository orderRepository;
	
	@Autowired
    private AuthenticationManager authenticationManager;
	
	@Autowired
	private EmailSenderService emailSenderService;
	
	@Autowired
	private InstitutionRepository institutionRepository;
	
	@GetMapping("/xusers")
	public List<User> getUsers(){
		return userRepository.findAll();
	}
	
	@GetMapping("/xusers/operators")
	public List<User> getOperators(){
		return userRepository.findAll();
	}
	
	@GetMapping("/xusers/{id}")
	public User getUser(@PathVariable Long id){
		return userRepository.getOne(id);
	}
	
	@DeleteMapping("/xuser/{id}")
	public boolean deleteUser(@PathVariable Long id){
		 userRepository.deleteById(id);
		 return true;
	}
	
	@Transactional
	@PostMapping("/xusers/operators")
	public User createUser(@RequestBody User user){
		
		String encryptPassword = BCrypt.hashpw("garrahan", BCrypt.gensalt());
		
		Institution institution = institutionRepository.getOne(new Long(1));
		user.setInstitution(institution);
		
		user.setActive(false);
		user.setAccountConfirmed(false);
		user.setEmailVerified(false);
		user.setIsInternal(false);
		user.setOrderCount(0);
		user.setPassword(encryptPassword);
		
		User savedUser = userRepository.save(user); 
		ActivationUserMessage util = new ActivationUserMessage(savedUser.getEmail(), savedUser.getVerificationToken());
		emailSenderService.sendEmail(util.getMessage());
		return savedUser;
	}
	
	@GetMapping("/confirm-account")
	public ResponseEntity confirmUserAccount(@RequestParam("verificationToken") String verificationToken) {
		
		User user = userRepository.findUserByVerificationToken(verificationToken);
		if(user != null && !user.getAccountConfirmed()) {
			user.setActive(true);
			user.setEmailVerified(true);
			user.setAccountConfirmed(true);
			userRepository.save(user);
		}
		
		URI url;
		HttpHeaders httpHeaders = null;
		
		try {
			url = new URI("http://localhost:4200");
			httpHeaders = new HttpHeaders();
		    httpHeaders.setLocation(url);
		    
		} catch (URISyntaxException e) {
			throw new BadCredentialsException("Invalid data supplied");
		}
	    
	    return new ResponseEntity<>(httpHeaders, HttpStatus.SEE_OTHER);
		
		
	}
	
	@PutMapping("/xusers/{id}")
	public User updateUser(@RequestBody User user, @PathVariable Long id){
		User persistedUser = userRepository.getOne(id);
		persistedUser.setEmail(user.getEmail());
		persistedUser.setFirstname(user.getFirstname());
		persistedUser.setLastname(user.getLastname());
		persistedUser.setDni(user.getDni());
		return userRepository.save(persistedUser);
	}
	
	@GetMapping("/xusers/{id}/orders/count")
	public Integer getUserOrdersCount(@PathVariable Long id){
		return orderRepository.findOrderCountByUserId(id).intValue();
	}
	
	@PutMapping("/xusers/{id}/disable")
	public void disableUser(@PathVariable Long id){
		User user = userRepository.getOne(id);
		user.setActive(false);
		userRepository.save(user);
	}
	
	@PutMapping("/xusers/{id}/enable")
	public void enableUser(@PathVariable Long id){
		User user = userRepository.getOne(id);
		user.setActive(true);
		userRepository.save(user);
	}
	
	@SuppressWarnings("rawtypes")
	@PostMapping("/xusers/login")
	public ResponseEntity login(@RequestBody AuthenticationRequest data) {
		
		try {
            String username = data.getUsername();
            User user = userRepository.findByUsername(username);
            Authentication auth = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, data.getPassword()));

            String token = Jwts.builder().setIssuedAt(new Date()).setIssuer(Constants.ISSUER_INFO)
    				.setSubject(username)
    				.setExpiration(new Date(System.currentTimeMillis() + Constants.TOKEN_EXPIRATION_TIME))
    				.signWith(SignatureAlgorithm.HS512, Constants.SUPER_SECRET_KEY).compact();
            
            Map<Object, Object> model = new HashMap<>();
            model.put("token", token);
            model.put("user", user);
            return ok(model);
            
        } catch (AuthenticationException e) {
            throw new BadCredentialsException("Invalid username/password supplied");
        }
	}	
	
	@PostMapping("/xusers/verifyCredentials")
	public User verifyCredentials(@RequestBody AuthenticationRequest data) {
		
		String encryptPassword = BCrypt.hashpw(data.getPassword(), BCrypt.gensalt());
		return userRepository.findByUserNameAndPass(data.getUsername(), encryptPassword);
		
	}
	
	
}
