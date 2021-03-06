package p2018.backend.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "OrderInfo")
public class OrderTransition implements Serializable {


	private static final long serialVersionUID = 7154948144917725443L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
	private Date acceptedOn;
	
	private String statusId;
	
	private Long operatorId;

	public Date getAcceptedOn() {
		return acceptedOn;
	}

	public void setAcceptedOn(Date acceptedOn) {
		this.acceptedOn = acceptedOn;
	}

	public String getStatusId() {
		return statusId;
	}

	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}

	public Long getOperatorId() {
		return operatorId;
	}

	public void setOperatorId(Long operatorId) {
		this.operatorId = operatorId;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public OrderTransition(Long id, Date acceptedOn, String status, Long operatorId) {
		this.id = id;
		this.acceptedOn = acceptedOn;
		this.statusId = status;
		this.operatorId = operatorId;
	}

	public OrderTransition() {

	}

	@Override
	public String toString() {
		return "OrderTransition [id=" + id + ", acceptedOn=" + acceptedOn + ", statusId=" + statusId + ", operatorId="
				+ operatorId + "]";
	}

}
