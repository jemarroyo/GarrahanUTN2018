package p2018.backend.entities;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "XRole")
public class Role extends AuditableEntity implements Serializable {


	private static final long serialVersionUID = -258009969500297081L;
	
	private String description;
	private String name;
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Role(String description, String name) {
		super();
		this.description = description;
		this.name = name;
	}
	public Role() {
		super();
	}
	
	@Override
	public String toString() {
		return "Role [description=" + description + ", name=" + name + ", getId()=" + getId() + "]";
	}
}
