package p2018.backend.entities;

import java.io.Serializable;

public class ConcilliationCommentDTO implements Serializable {


	private static final long serialVersionUID = -539384889746393486L;
	
	private String comment;
	private Long operatorId;
	
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Long getOperatorId() {
		return operatorId;
	}
	public void setOperatorId(Long operatorId) {
		this.operatorId = operatorId;
	}
	public ConcilliationCommentDTO(String comment, Long operatorId) {
		this.comment = comment;
		this.operatorId = operatorId;
	}
	public ConcilliationCommentDTO() {

	}	

}
