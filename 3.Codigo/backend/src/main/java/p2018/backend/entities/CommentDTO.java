package p2018.backend.entities;

import java.io.Serializable;

public class CommentDTO implements Serializable {
	
	private static final long serialVersionUID = 8111546557661999970L;
	
	private String text;

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	
}
