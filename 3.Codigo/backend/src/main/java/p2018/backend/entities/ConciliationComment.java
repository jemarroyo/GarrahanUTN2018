package p2018.backend.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "ConciliationComment")
public class ConciliationComment extends AuditableEntity implements Serializable {


	private static final long serialVersionUID = 5809634052179758257L;
	
	private String comment;
	private Date date;
	private Long orderId;
	@Transient
	private String text;
	
	@Column(name = "operatorId")
	private Long operatorId;
	
	@ManyToOne
    @JoinColumn(name="orderId", insertable = false, updatable = false)
	@JsonIgnore
	private OrderInfo orderInfo;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "operatorId", insertable = false, updatable = false)
	private User operator;

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Long getOperatorId() {
		return operatorId;
	}

	public void setOperatorId(Long operatorId) {
		this.operatorId = operatorId;
	}

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
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

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public ConciliationComment(String comment, Date date, Long operatorId, Long orderId) {
		this.comment = comment;
		this.date = date;
		this.operatorId = operatorId;
		this.orderId = orderId;
	}

	public ConciliationComment() {
		
	}

	@Override
	public String toString() {
		return "ConcilliationComment [comment=" + comment + ", date=" + date + ", operator=" + operatorId + "]";
	}
	
	

}
