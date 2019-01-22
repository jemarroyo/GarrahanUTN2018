package p2018.backend.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Irradiation")
public class Irradiation implements Serializable {

	private static final long serialVersionUID = 2083148371987532538L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	private Date irradiationStart;
	private Date irradiationEnd;
	private String irradiationTag;
	private Integer irradiationTime;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "irradiatorId")
	private User irradiator;

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

	public User getIrradiator() {
		return irradiator;
	}

	public void setIrradiator(User irradiator) {
		this.irradiator = irradiator;
	}

	public Irradiation(Long id, Date irradiationStart, Date irradiationEnd, String irradiationTag,
			Integer irradiationTime, User irradiator) {
		this.id = id;
		this.irradiationStart = irradiationStart;
		this.irradiationEnd = irradiationEnd;
		this.irradiationTag = irradiationTag;
		this.irradiationTime = irradiationTime;
		this.irradiator = irradiator;
	}

	public Irradiation() {
		super();
	}

	@Override
	public String toString() {
		return "Irradiation [id=" + id + ", irradiationStart=" + irradiationStart + ", irradiationEnd=" + irradiationEnd
				+ ", irradiationTag=" + irradiationTag + ", irradiationTime=" + irradiationTime + ", irradiator="
				+ irradiator + "]";
	}
	
}
