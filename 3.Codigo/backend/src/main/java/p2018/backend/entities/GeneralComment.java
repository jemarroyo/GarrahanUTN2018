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
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "Comment")
public class GeneralComment implements Serializable {
	

	private static final long serialVersionUID = 8827929199713853170L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	private String text;
	private Long orderId;
	
	private Long operatorId;
	
	@Column(name = "creationDate")
	private Date date;
	
	@ManyToOne
    @JoinColumn(name="orderId", insertable = false, updatable = false)
	@JsonBackReference
	private OrderInfo orderInfo;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "operatorId", insertable = false, updatable = false)
	@JsonManagedReference
	private User operator;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public Long getOperatorId() {
		return operatorId;
	}

	public void setOperatorId(Long operatorId) {
		this.operatorId = operatorId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public OrderInfo getOrderInfo() {
		return orderInfo;
	}

	public void setOrderInfo(OrderInfo orderInfo) {
		this.orderInfo = orderInfo;
	}

	public User getOperator() {
		return operator;
	}

	public void setOperator(User operator) {
		this.operator = operator;
	}

	public GeneralComment(Long id, String text, Long orderId, Long operatorId, Date date) {
		
		this.id = id;
		this.text = text;
		this.orderId = orderId;
		this.date = date;
		this.operatorId = operatorId;
	}
	
	public GeneralComment() {
		
	}
	
}
