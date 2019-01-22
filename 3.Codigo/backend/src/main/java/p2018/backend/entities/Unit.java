package p2018.backend.entities;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Unit")
public class Unit extends AuditableEntity implements Serializable {


	private static final long serialVersionUID = 501355697639267150L;
	
	private String code;
	private Boolean irradiated;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "unitTypeId")
	private UnitType unitType;
	
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

	public UnitType getUnitType() {
		return unitType;
	}

	public void setUnitType(UnitType unitType) {
		this.unitType = unitType;
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

	public Unit(String code, UnitType unitType, User irradiatorUser) {
		super();
		this.code = code;
		this.unitType = unitType;
		this.irradiatorUser = irradiatorUser;
	}

	public Unit() {
		super();
	}

	@Override
	public String toString() {
		return "Unit [code=" + code + ", irradiated=" + irradiated + "]";
	}
	

}
