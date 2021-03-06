package p2018.backend.controllers;

import static org.springframework.http.ResponseEntity.ok;

import java.net.URI;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JsonNode;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import p2018.backend.entities.Institution;
import p2018.backend.entities.Role;
import p2018.backend.entities.User;
import p2018.backend.exceptions.GarrahanAPIException;
import p2018.backend.repository.InstitutionRepository;
import p2018.backend.repository.OrderRepository;
import p2018.backend.repository.RoleRepository;
import p2018.backend.repository.UserRepository;
import p2018.backend.service.EmailSenderService;
import p2018.backend.utils.ActivationUserMessage;
import p2018.backend.utils.AuthenticationRequest;
import p2018.backend.utils.ConfigUtility;
import p2018.backend.utils.JwtTokenProvider;
import p2018.backend.utils.RequestFilterParser;


@RestController
@RequestMapping("/api")
@CrossOrigin
public class UserController {
	
	@Autowired
	ConfigUtility configUtility;
	
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
	
	@Autowired
	private RequestFilterParser requestFilterParser;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private JwtTokenProvider tokenProvider; 
	
	
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
	
	@GetMapping("/xusers/clients")
	public List<User> getClients(){
		return userRepository.findClients();
	}
	
	@Transactional
	@PostMapping("/xusers/operators")
	public User createOperator(@RequestBody String request){
		
		String message = null;
		JsonNode jsonRequest = requestFilterParser.parseGenericBodyRequest(request);
		User user = null;
		
		try {
			
			String username = jsonRequest.get("username").toString().replace("\"", "");
			String email = jsonRequest.get("email").toString().replace("\"", "");
			String dni = jsonRequest.get("dni").toString().replace("\"", "");
			String firstname = jsonRequest.get("firstname").toString().replace("\"", "");
			String lastname = jsonRequest.get("lastname").toString().replace("\"", "");
			Boolean isInternal = true;
			Boolean accountConfirmed = false;
			Boolean active = false;
			String encryptPassword = BCrypt.hashpw("garrahan", BCrypt.gensalt());
			Boolean emailVerified = false;
			Boolean isAdmin = jsonRequest.get("isAdmin").asBoolean();
			
			Integer count = userRepository.checkExistentUser(email, username, dni);
			
			if(count > 0) {
				message = "Error. Ya existe otro usuario con los datos ingresados";
				Exception e = new Exception(message);
				throw new GarrahanAPIException(message, e);
			}
			
			user = new User(firstname, lastname, dni, isInternal, accountConfirmed, active, 0,
					username, encryptPassword, emailVerified, null, email);
			
			Role clientRole = roleRepository.findRoleByName("operator");
			user.getRoles().add(clientRole);
			
			Role adminRole = roleRepository.findRoleByName("admin");
			
			if(isAdmin) {
				user.getRoles().add(adminRole);
			}
			
			List<String> roleList = new ArrayList<String>();
			
			for (Iterator iterator = user.getRoles().iterator(); iterator.hasNext();) {
				Role rol = (Role) iterator.next();
				roleList.add(rol.getName());
			}
			
			String token = tokenProvider.createToken(username, roleList);
			user.setVerificationToken(token);
			
			user = userRepository.save(user);
			
			ActivationUserMessage util = new ActivationUserMessage(user, emailSenderService.getJavaMailSender(), configUtility);
			emailSenderService.sendEmail(util.getMessage());
			
		}catch (Exception e) {
			throw new GarrahanAPIException("Error al crear Operador", e);
		}
		
		return user;
	}
	
	@Transactional
	@PostMapping("/xusers/clients")
	public User createClient(@RequestBody String request){
		
		String message = null;
		JsonNode jsonRequest = requestFilterParser.parseGenericBodyRequest(request);
		User user = null;
		try {
			
			String username = jsonRequest.get("username").toString().replace("\"", "");
			String email = jsonRequest.get("email").toString().replace("\"", "");
			String dni = jsonRequest.get("dni").toString().replace("\"", "");
			String firstname = jsonRequest.get("firstname").toString().replace("\"", "");
			String lastname = jsonRequest.get("lastname").toString().replace("\"", "");
			Boolean isInternal = false;
			Boolean accountConfirmed = false;
			Boolean active = false;
			String encryptPassword = BCrypt.hashpw("garrahan", BCrypt.gensalt());
			Boolean emailVerified = false;
			Long institutionId = new Long(jsonRequest.get("institutionId").toString().replace("\"", ""));
			
			Institution institution = institutionRepository.getOne(institutionId);
			
			if(institution == null) {
				message = "Error. La institución para la cual se desea crear el usuario no existe";
				Exception e = new Exception(message);
				throw new GarrahanAPIException(message, e);
			}
			
			Integer count = userRepository.checkExistentUser(email, username, dni);
			
			if(count > 0) {
				message = "Error. Ya existe otro usuario con los datos ingresados";
				Exception e = new Exception(message);
				throw new GarrahanAPIException(message, e);
			}
			
			user = new User(firstname, lastname, dni, isInternal, accountConfirmed, active, 0,
					username, encryptPassword, emailVerified, institution, email);
			
			Role clientRole = roleRepository.findRoleByName("client");
			user.getRoles().add(clientRole);
			
			List<String> roleList = new ArrayList<String>();
			
			for (Iterator iterator = user.getRoles().iterator(); iterator.hasNext();) {
				Role rol = (Role) iterator.next();
				roleList.add(rol.getName());
			}
			
			String token = tokenProvider.createToken(username, roleList);
			user.setVerificationToken(token);
			
			user = userRepository.save(user);
			
			ActivationUserMessage util = new ActivationUserMessage(user, emailSenderService.getJavaMailSender(), configUtility);
			emailSenderService.sendEmail(util.getMessage());
			
			
		} catch (Exception e) {
			throw new GarrahanAPIException(message, e);
		}

		return user;
	}
	
	@Transactional
	@PostMapping("/account-confirm")
	public void confirmUserAccount(@RequestBody String request) {
		
		JsonNode jsonRequest = requestFilterParser.parseGenericBodyRequest(request);
		User user = null;
		String message = null;
		HttpHeaders httpHeaders = null;
		
		try {
			
			String token = jsonRequest.get("token").toString().replace("\"", "");
			String password = jsonRequest.get("password").toString().replace("\"", "");
			user = userRepository.findUserByVerificationToken(token);
			
			if(user == null) {
				message = "El usuario especificado no existe";
				Exception e = new Exception(message);
				throw new GarrahanAPIException(message, e);
			}
			
			if(!user.getActive()) {
				message = "Error. La cuenta se encuentra deshabilitada";
				Exception e = new Exception(message);
				throw new GarrahanAPIException(message, e);
			}
			
			if(user.getAccountConfirmed()) {
				message = "Error. La cuenta ya está activada.";
				Exception e = new Exception(message);
				throw new GarrahanAPIException(message, e);
			}
			
			if(user != null && tokenProvider.validateToken(token)) {
				
				user.setEmailVerified(true);
				user.setAccountConfirmed(true);
				user.setPassword(password);
				userRepository.save(user);
			
			}else {
				
				message = "Token Inválido.";
				Exception e = new Exception(message);
				throw new GarrahanAPIException(message, e);
			}
					    
		} catch (Exception e) {
			throw new GarrahanAPIException(message, e);
		}
		
	}
	
	@Transactional
	@PostMapping("/password-reset-requests")
	public void passwordResetRequest(@RequestBody String request){
		
		JsonNode jsonRequest = requestFilterParser.parseGenericBodyRequest(request);
		User user = null;
		String message = null;
		HttpHeaders httpHeaders = null;
		
		try {
			String email = jsonRequest.get("email").toString().replace("\"", "");
			user = userRepository.findUserByEmail(email);
			
			if(user == null) {
				message = "El usuario especificado no existe.";
				Exception e = new Exception(message);
				throw new GarrahanAPIException(message, e);
			}
			
			if(!user.getActive()) {
				message = "Error. La cuenta se encuentra deshabilitada";
				Exception e = new Exception(message);
				throw new GarrahanAPIException(message, e);
			}
			
			if(!user.getAccountConfirmed()) {
				message = "No se puede resetear la contraseña. La cuenta no fue confirmada.";
				Exception e = new Exception(message);
				throw new GarrahanAPIException(message, e);
			}
			
			
			ActivationUserMessage util = new ActivationUserMessage(user, emailSenderService.getJavaMailSender(), configUtility);
			emailSenderService.sendEmail(util.getMessage());
			
		} catch (Exception e) {
			throw new GarrahanAPIException(message, e);
		}
	}
	
	@Transactional
	@PostMapping("/password-reset")
	public ResponseEntity passwordReset(@RequestBody String request){
		
		JsonNode jsonRequest = requestFilterParser.parseGenericBodyRequest(request);
		User user = null;
		String message = null;
		HttpHeaders httpHeaders = null;
		
		try {
			
			String token = jsonRequest.get("token").toString().replace("\"", "");
			String username = tokenProvider.getUsername(token);
			String password = jsonRequest.get("password").toString().replace("\"", "");
			
			user = userRepository.findByUsername(username);
			
			if(user == null) {
				message = "El usuario especificado no existe";
				Exception e = new Exception(message);
				throw new GarrahanAPIException(message, e);
			}
			
			user.setPassword(password);
			user = userRepository.save(user);
			
			URI url = new URI(configUtility.getProperty("garrahan.client.host"));
			httpHeaders = new HttpHeaders();
		    httpHeaders.setLocation(url);
			
			
		} catch (Exception e) {
			throw new GarrahanAPIException("Error al resetar password", e);
		}
		
		return new ResponseEntity<>(httpHeaders, HttpStatus.SEE_OTHER);
	}
	
	@PutMapping("/xusers/{id}")
	public User updateUser(@RequestBody String request, @PathVariable Long id){
		
		JsonNode jsonRequest = requestFilterParser.parseGenericBodyRequest(request);
		User persistedUser = userRepository.getOne(id);
		String message = null;
		
		if(persistedUser == null) {
			message = "No existen usuarios con id:" + id;
			Exception e = new Exception(message);
			throw new GarrahanAPIException(message, e);
		}
		
		try {
			
			persistedUser.setEmail(jsonRequest.get("email").toString().replace("\"", ""));
			persistedUser.setFirstname(jsonRequest.get("firstname").toString().replace("\"", ""));
			persistedUser.setLastname(jsonRequest.get("lastname").toString().replace("\"", ""));
			persistedUser.setDni(jsonRequest.get("dni").toString().replace("\"", ""));
			
			persistedUser = userRepository.save(persistedUser);
			
		}catch (Exception e) {
			throw new GarrahanAPIException("Error al actualizar usuario", e);
		}
			
		return persistedUser;
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
	
	@PutMapping("/xusers/operators/{id}/admin")
	public void setAdmin(@RequestBody String request, @PathVariable Long id){
		
		JsonNode jsonRequest = requestFilterParser.parseGenericBodyRequest(request);
		User user = null;
		String message = null;
		
		try {
			
			boolean isAdmin = jsonRequest.get("isAdmin").asBoolean();
			
			user = userRepository.getOne(id);
			
			if(user == null) {
				message = "No existen usuarios con id:" + id;
				Exception e = new Exception(message);
				throw new GarrahanAPIException(message, e);
			}
			
			Role adminRole = roleRepository.findRoleByName("admin");
			
			if(isAdmin) {
				user.setIsInternal(true);
				user.getRoles().add(adminRole);
			}else {
				user.setIsInternal(false);
				user.getRoles().remove(adminRole);
			}
			
			userRepository.save(user);
			
		}catch (Exception e) {
			message = "Error al modificar usuario";
			throw new GarrahanAPIException(message, e);
		}
		
	}
	
	
	@SuppressWarnings("rawtypes")
	@PostMapping("/xusers/login")
	public ResponseEntity login(@RequestBody AuthenticationRequest data) {
		
		try {
            String username = data.getUsername();
            User user = userRepository.findByUsername(username);
            Authentication auth = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, data.getPassword()));

            String token = Jwts.builder().setIssuedAt(new Date()).setIssuer(configUtility.getProperty("jwt.issuer.info"))
    				.setSubject(username)
    				.setExpiration(new Date(System.currentTimeMillis() + new Long(configUtility.getProperty("jwt.token.expiration.time"))))
    				.signWith(SignatureAlgorithm.HS512, configUtility.getProperty("jwt.super.secret.key")).compact();
            
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
