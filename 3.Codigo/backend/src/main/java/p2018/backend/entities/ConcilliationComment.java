package p2018.backend.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class ConcilliationComment extends AuditableEntity implements Serializable {


	private static final long serialVersionUID = 5809634052179758257L;
	
	private String comment;
	private Date date;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "operatorId")
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

	public User getOperator() {
		return operator;
	}

	public void setOperator(User operator) {
		this.operator = operator;
	}

	public ConcilliationComment(String comment, Date date, User operator) {
		super();
		this.comment = comment;
		this.date = date;
		this.operator = operator;
	}

	public ConcilliationComment() {
		super();
	}

	@Override
	public String toString() {
		return "ConcilliationComment [comment=" + comment + ", date=" + date + ", operator=" + operator + "]";
	}
	
	

}
