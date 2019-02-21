package p2018.backend.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class UpdatedOrderDTO implements Serializable {

	private static final long serialVersionUID = 5641300772576612627L;
	
	private Long id;
	private String carrier;
	private String code;
	private Date creationDate;
	private Long institutionId;
	private Long ownerId;
	private Long priorityId;
	private List<Long> removedUnitIds;
	private String statusId;
	private List<UnitDTO> units;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCarrier() {
		return carrier;
	}
	public void setCarrier(String carrier) {
		this.carrier = carrier;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	public Long getInstitutionId() {
		return institutionId;
	}
	public void setInstitutionId(Long institutionId) {
		this.institutionId = institutionId;
	}
	public Long getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(Long ownerId) {
		this.ownerId = ownerId;
	}
	public Long getPriorityId() {
		return priorityId;
	}
	public void setPriorityId(Long priorityId) {
		this.priorityId = priorityId;
	}
	public List<Long> getRemovedUnitIds() {
		return removedUnitIds;
	}
	public void setRemovedUnitIds(List<Long> removedUnitIds) {
		this.removedUnitIds = removedUnitIds;
	}
	public String getStatusId() {
		return statusId;
	}
	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}
	public List<UnitDTO> getUnits() {
		return units;
	}
	public void setUnits(List<UnitDTO> units) {
		this.units = units;
	}
	
}
