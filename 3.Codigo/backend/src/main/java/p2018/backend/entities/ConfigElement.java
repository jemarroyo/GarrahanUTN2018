package p2018.backend.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ConfigElement implements Serializable {


	private static final long serialVersionUID = 7418998033905047367L;
	
	@Id
	private String name;
	private String value;
	private String description;
	private String max;
	private String min;
	private Boolean isInteger;
	private Date lastUpdated;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getMax() {
		return max;
	}
	public void setMax(String max) {
		this.max = max;
	}
	public String getMin() {
		return min;
	}
	public void setMin(String min) {
		this.min = min;
	}
	public Boolean getIsInteger() {
		return isInteger;
	}
	public void setIsInteger(Boolean isInteger) {
		this.isInteger = isInteger;
	}
	public Date getLastUpdated() {
		return lastUpdated;
	}
	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdated = lastUpdate;
	}
	public ConfigElement(String name, String value, String description, String max, String min, Boolean isInteger) {
		
		this.name = name;
		this.value = value;
		this.description = description;
		this.max = max;
		this.min = min;
		this.isInteger = isInteger;
		
	}
	
	public ConfigElement() {
		
	}
	@Override
	public String toString() {
		return "ConfigElement [name=" + name + ", value=" + value + ", description=" + description + ", max=" + max
				+ ", min=" + min + ", isInteger=" + isInteger + "]";
	}
	
	

}

