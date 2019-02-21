package p2018.backend.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Version;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "Unit")
public class Unit extends AuditableEntity implements Serializable {


	private static final long serialVersionUID = 501355697639267150L;
	
	private String code;
	private Boolean irradiated;
	private Long irradiationId;
	private Long irradiatorUserId;
	private Long unitTypeId;
	
	@Version
	private Integer version;
	
	@Column(name = "orderId")
	private Long orderId;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "unitTypeId", insertable = false, updatable = false)
	private UnitType type;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "irradiatorUserId", insertable = false, updatable = false)
	private User irradiatorUser;
	
	@ManyToOne
    @JoinColumn(name="irradiationId", insertable = false, updatable = false)
	@JsonIgnore
	private Irradiation irradiation;
	
	@ManyToOne
    @JoinColumn(name="orderId", insertable = false, updatable = false)
	@JsonIgnore
	private OrderInfo orderInfo;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Boolean getIrradiated() {
		return irradiated;
	}

	public void setIrradiated(Boolean irradiated) {
		this.irradiated = irradiated;
	}

	public UnitType getType() {
		return type;
	}

	public void setType(UnitType type) {
		this.type = type;
	}

	public User getIrradiatorUser() {
		return irradiatorUser;
	}

	public void setIrradiatorUser(User irradiatorUser) {
		this.irradiatorUser = irradiatorUser;
	}

	public Irradiation getIrradiation() {
		return irradiation;
	}

	public void setIrradiation(Irradiation irradiation) {
		this.irradiation = irradiation;
	}
	
	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public Long getIrradiationId() {
		return irradiationId;
	}

	public void setIrradiationId(Long irradiationId) {
		this.irradiationId = irradiationId;
	}

	public Long getIrradiatorUserId() {
		return irradiatorUserId;
	}

	public void setIrradiatorUserId(Long irradiatorUserId) {
		this.irradiatorUserId = irradiatorUserId;
	}
	
	public OrderInfo getOrderInfo() {
		return orderInfo;
	}

	public void setOrderInfo(OrderInfo orderInfo) {
		this.orderInfo = orderInfo;
	}
	
	public Long getUnitTypeId() {
		return unitTypeId;
	}

	public void setUnitTypeId(Long unitTypeId) {
		this.unitTypeId = unitTypeId;
	}

	public Unit(String code, UnitType type, User irradiatorUser) {
	
		this.code = code;
		this.type = type;
		this.irradiatorUser = irradiatorUser;
	}

	public Unit() {
		
	}

	@Override
	public String toString() {
		return "Unit [code=" + code + ", irradiated=" + irradiated + "]";
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

}
