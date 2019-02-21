package p2018.backend.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.Version;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "Irradiation")
public class IrradiationDTO implements Serializable {

	private static final long serialVersionUID = 2083148371987532538L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	private Date irradiationStart;
	private Date irradiationEnd;
	private String irradiationTag;
	private Integer irradiationTime;
	private Long orderId;
	private String comments;
	private Long irradiatorId;
	private Integer unitCount;
	
	@Version
	private Integer version;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "irradiatorId", insertable = false, updatable = false)
	@JsonIgnore
	private User irradiator;
	
	@ManyToOne
    @JoinColumn(name="orderId", insertable = false, updatable = false)
	@JsonIgnore
	private OrderInfo orderInfo;
	
	@Transient
	private Set<Long> units;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getIrradiationStart() {
		return irradiationStart;
	}

	public void setIrradiationStart(Date irradiationStart) {
		this.irradiationStart = irradiationStart;
	}

	public Date getIrradiationEnd() {
		return irradiationEnd;
	}

	public void setIrradiationEnd(Date irradiationEnd) {
		this.irradiationEnd = irradiationEnd;
	}

	public String getIrradiationTag() {
		return irradiationTag;
	}

	public void setIrradiationTag(String irradiationTag) {
		this.irradiationTag = irradiationTag;
	}

	public Integer getIrradiationTime() {
		return irradiationTime;
	}

	public void setIrradiationTime(Integer irradiationTime) {
		this.irradiationTime = irradiationTime;
	}

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Long getIrradiatorId() {
		return irradiatorId;
	}

	public void setIrradiatorId(Long irradiatorId) {
		this.irradiatorId = irradiatorId;
	}

	public Integer getUnitCount() {
		return unitCount;
	}

	public void setUnitCount(Integer unitCount) {
		this.unitCount = unitCount;
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

	public User getIrradiator() {
		return irradiator;
	}

	public void setIrradiator(User irradiator) {
		this.irradiator = irradiator;
	}

	public OrderInfo getOrderInfo() {
		return orderInfo;
	}

	public void setOrderInfo(OrderInfo orderInfo) {
		this.orderInfo = orderInfo;
	}

	public Set<Long> getUnits() {
		return units;
	}

	public void setUnits(Set<Long> units) {
		this.units = units;
	}

	public IrradiationDTO(Long id, Date irradiationStart, Date irradiationEnd, String irradiationTag,
			Integer irradiationTime, Long irradiatorId, String comments) {
		this.id = id;
		this.irradiationStart = irradiationStart;
		this.irradiationEnd = irradiationEnd;
		this.irradiationTag = irradiationTag;
		this.irradiationTime = irradiationTime;
		this.irradiatorId = irradiatorId;
		this.comments = comments;
	}

	public IrradiationDTO() {
	
	}

	@Override
	public String toString() {
		return "Irradiation [id=" + id + ", irradiationStart=" + irradiationStart + ", irradiationEnd=" + irradiationEnd
				+ ", irradiationTag=" + irradiationTag + ", irradiationTime=" + irradiationTime + ", irradiator="
				+ irradiator + "]";
	}
	
}
