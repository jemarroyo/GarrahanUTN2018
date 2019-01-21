package p2018.backend.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.PrePersist;

@Entity
public class Institution implements Serializable{
	
	
	private static final long serialVersionUID = 5228559901415652071L;
	
	@Id
	@GeneratedValue
	private Long id;
	private String name;
	private String cuit;
	private String address;
	private String email;
	private Date creation_date;
	
	@Enumerated(EnumType.STRING)
	private InstitutionType type;

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
	
	
	public Institution() {
		
	}

	public Institution(String name, String cuit, String address, String email, InstitutionType type) {
		this.name = name;
		this.cuit = cuit;
		this.address = address;
		this.email = email;
		this.type = type;
	}
	

	@Override
	public String toString() {
		return "Institution [id=" + id + ", name=" + name + ", cuit=" + cuit + ", address=" + address + ", email="
				+ email + ", institutionType=" + type + "]";
	}
	
	@PrePersist
	protected void onCreate() {
		creation_date = new Date();
	}

	public Date getCreation_date() {
		return creation_date;
	}

	public void setCreation_date(Date creation_date) {
		this.creation_date = creation_date;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public InstitutionType getType() {
		return type;
	}

	public void setType(InstitutionType type) {
		this.type = type;
	}

}
