package p2018.backend.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class InstitutionDTO implements Serializable {

	private static final long serialVersionUID = 8758924562889561549L;
	
	private Long id;
	private Date creationDate;
	private String name;
	private String cuit;
	private String address;
	private String email;
	private Integer userCount;
	private Integer orderCount;
	private String invalidCharCount;
	private InstitutionType type;
	private List<User> users = new ArrayList<User>();
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCuit() {
		return cuit;
	}
	public void setCuit(String cuit) {
		this.cuit = cuit;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getUserCount() {
		return userCount;
	}
	public void setUserCount(Integer userCount) {
		this.userCount = userCount;
	}
	public Integer getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(Integer orderCount) {
		this.orderCount = orderCount;
	}
	public String getInvalidCharCount() {
		return invalidCharCount;
	}
	public void setInvalidCharCount(String invalidCharCount) {
		this.invalidCharCount = invalidCharCount;
	}
	public InstitutionType getType() {
		return type;
	}
	public void setType(InstitutionType type) {
		this.type = type;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	
}
