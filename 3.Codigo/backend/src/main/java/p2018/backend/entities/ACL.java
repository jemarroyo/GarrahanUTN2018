package p2018.backend.entities;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "XACL")
public class ACL extends AuditableEntity implements Serializable {

	private static final long serialVersionUID = -4879603356266542634L;
	
	private String accessType;
	private String model;
	private String permission;
	private String principalId;
	private String pricipalType;
	private String property;
	
	public String getAccessType() {
		return accessType;
	}
	public void setAccessType(String accessType) {
		this.accessType = accessType;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public String getPrincipalId() {
		return principalId;
	}
	public void setPrincipalId(String principalId) {
		this.principalId = principalId;
	}
	public String getPricipalType() {
		return pricipalType;
	}
	public void setPricipalType(String pricipalType) {
		this.pricipalType = pricipalType;
	}
	public String getProperty() {
		return property;
	}
	public void setProperty(String property) {
		this.property = property;
	}
	public ACL(String accessType, String model, String permission, String principalId, String pricipalType,
			String property) {
		super();
		this.accessType = accessType;
		this.model = model;
		this.permission = permission;
		this.principalId = principalId;
		this.pricipalType = pricipalType;
		this.property = property;
	}
	public ACL() {
		super();
	}
	@Override
	public String toString() {
		return "ACL [accessType=" + accessType + ", model=" + model + ", permission=" + permission + ", principalId="
				+ principalId + ", pricipalType=" + pricipalType + ", property=" + property + "]";
	}
	
	
}
