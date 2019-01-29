package p2018.backend.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Version;

@Entity
@Table(name = "Unit")
public class Unit extends AuditableEntity implements Serializable {


	private static final long serialVersionUID = 501355697639267150L;
	
	private String code;
	private Boolean irradiated;
	
	@Version
	private Integer version;
	
	@Column(name = "orderId", insertable = false, updatable = false)
	private Long orderId;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "unitTypeId")
	private UnitType type;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "irradiatorUserId")
	private User irradiatorUser;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "irradiationid")
	private Irradiation irradiation;

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

	public Unit(String code, UnitType type, User irradiatorUser) {
		super();
		this.code = code;
		this.type = type;
		this.irradiatorUser = irradiatorUser;
	}

	public Unit() {
		super();
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
