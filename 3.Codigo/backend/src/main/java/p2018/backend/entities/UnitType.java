package p2018.backend.entities;

import java.io.Serializable;

import javax.persistence.Entity;

@Entity
public class UnitType extends AuditableEntity implements Serializable {

	private static final long serialVersionUID = -4379121002074571796L;
	
	private String code;
	private String name;
	private boolean enabled;
	private Integer billingDivider;

	public UnitType(String code, String description, Integer billingDivider) {
		this.code = code;
		this.name = description;
		this.enabled = true;
		this.billingDivider = billingDivider;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}


	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getBillingDivider() {
		return billingDivider;
	}

	public void setBillingDivider(Integer billingDivider) {
		this.billingDivider = billingDivider;
	}

	public UnitType() {
		super();
	}

	@Override
	public String toString() {
		return "UnitType [code=" + code + ", name=" + name + ", enabled=" + enabled + ", billingDivider="
				+ billingDivider + "]";
	}
	
}
