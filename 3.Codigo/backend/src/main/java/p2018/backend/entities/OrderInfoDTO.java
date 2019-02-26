package p2018.backend.entities;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;

@Entity
@Table(name = "OrderInfo")
public class OrderInfoDTO extends AuditableEntity implements Serializable {

	private static final long serialVersionUID = -1724711655558804770L;
	
	public static final String INITIAL_STATUS = "PENDIENTE";
	public static final String FINAL_STATUS = "IRRADIADA";
	
	private String carrier;
	private String code;
	private Long institutionId;
	private Long ownerId;
	private Long priorityId;
	private Integer unitCount;
	private String statusId;
	private Date lastModified;
	private Date completionDate;
	
	@OneToMany(mappedBy = "orderInfo")
	private Set<UnitDTO> units;

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

	public Set<UnitDTO> getUnits() {
		return units;
	}

	public void setUnits(Set<UnitDTO> units) {
		this.units = units;
	}
	
	public Integer getUnitCount() {
		return unitCount;
	}

	public void setUnitCount(Integer unitCount) {
		this.unitCount = unitCount;
	}
	
	public String getStatusId() {
		return statusId;
	}

	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}
	
	public Date getLastModified() {
		return lastModified;
	}

	public void setLastModified(Date lastModified) {
		this.lastModified = lastModified;
	}
	
	public Date getCompletionDate() {
		return completionDate;
	}

	public void setCompletionDate(Date completionDate) {
		this.completionDate = completionDate;
	}

	public OrderInfoDTO(String carrier, String code, Long institutionId, Long ownerId, Long priorityId,
			Integer unitCount, String statusId, Set<UnitDTO> units) {
		this.carrier = carrier;
		this.code = code;
		this.institutionId = institutionId;
		this.ownerId = ownerId;
		this.priorityId = priorityId;
		this.unitCount = unitCount;
		this.statusId = statusId;
		this.units = units;
		this.statusId = INITIAL_STATUS;
	}

	public OrderInfoDTO() {
		
	}

	@Override
	public String toString() {
		return "OrderInfoDTO [carrier=" + carrier + ", code=" + code + ", institutionId=" + institutionId + ", ownerId="
				+ ownerId + ", priorityId=" + priorityId + "]";
	}
	
	@Override
	@PrePersist
	protected void onCreate() {
		this.setLastModified(new Timestamp((new Date()).getTime()));
		this.setCreationDate(new Timestamp((new Date()).getTime()));
		this.setStatusId(INITIAL_STATUS);
	}

}
