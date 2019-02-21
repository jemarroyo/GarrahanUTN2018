package p2018.backend.utils;

import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;

import org.springframework.mail.SimpleMailMessage;

public class ActivationUserMessage {
	
	private SimpleMailMessage message;
	
	private String messageFromEmail = "arradiaciones@garrahan.com.ar";
	private String messageText;
	private String messageSubject = "Activación de Usuario Garrahan";
	
	public ActivationUserMessage(String messageTo, String confirmationToken) {
		
		try {
			
			this.message = new  SimpleMailMessage();
			this.message.setFrom(messageFromEmail);
			this.message.setTo(messageTo);
			this.message.setSubject(messageSubject);		
			
			DatagramSocket socket = new DatagramSocket();
			socket.connect(InetAddress.getByName("8.8.8.8"), 10002);
			String ip = socket.getLocalAddress().getHostAddress();
			String text = "Para confirmar el registro de su cuenta, haga click en el siguiente link:" + ip + ":8080/api/confirm-account?verificationToken=" + confirmationToken;
			
			this.message.setText(text);
			
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SocketException e) {
			e.printStackTrace();
		}
		
	}

	public SimpleMailMessage getMessage() {
		return message;
	}

	public void setMessage(SimpleMailMessage message) {
		this.message = message;
	}

	public String getMessageFromEmail() {
		return messageFromEmail;
	}

	public void setMessageFromEmail(String messageFromEmail) {
		this.messageFromEmail = messageFromEmail;
	}

	public String getMessageText() {
		return messageText;
	}

	public void setMessageText(String messageText) {
		this.messageText = messageText;
	}

	public String getMessageSubject() {
		return messageSubject;
	}

	public void setMessageSubject(String messageSubject) {
		this.messageSubject = messageSubject;
	}
	
}
