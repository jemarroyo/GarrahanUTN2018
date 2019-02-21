package p2018.backend.entities;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Version;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
public class Institution extends AuditableEntity implements Serializable{
	
	
	private static final long serialVersionUID = 5228559901415652071L;
	
	private String name;
	private String cuit;
	private String address;
	private String email;
	private Integer userCount;
	private Integer orderCount;
	private String invalidCharCount;
	
	@Version
	private Integer version;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "type")
	private InstitutionType type;
	
	@OneToMany(mappedBy = "institution")
	@JsonBackReference
	private Set<User> users;

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

	public InstitutionType getType() {
		return type;
	}

	public void setType(InstitutionType type) {
		this.type = type;
	}
	
	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}
	
	public String getInvalidCharCount() {
		return invalidCharCount;
	}

	public void setInvalidCharCount(String invalidCharCount) {
		this.invalidCharCount = invalidCharCount;
	}

	public Institution(String name, String cuit, String address, String email, Integer userCount, Integer orderCount,
			InstitutionType type) {
		this.name = name;
		this.cuit = cuit;
		this.address = address;
		this.email = email;
		this.userCount = userCount;
		this.orderCount = orderCount;
		this.type = type;
	}

	public Institution() {
	
	}

	@Override
	public String toString() {
		return "Institution [name=" + name + ", cuit=" + cuit + ", address=" + address + ", email=" + email
				+ ", userCount=" + userCount + ", orderCount=" + orderCount + ", type=" + type + "]";
	}
	
	public void addOrderCount() {
		this.setOrderCount(this.getOrderCount() + 1);
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}
}
