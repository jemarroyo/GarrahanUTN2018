package p2018.backend.entities;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class OrderStatus implements Serializable {
	
	private static final long serialVersionUID = -352649161875836297L;
	
	@Id
	private String name;
	private String description;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public OrderStatus(String name, String description) {
		
		this.name = name;
		this.description = description;
	}
	public OrderStatus() {
		
	}
	@Override
	public String toString() {
		return "OrderStatus [name=" + name + ", description=" + description + "]";
	}
}
