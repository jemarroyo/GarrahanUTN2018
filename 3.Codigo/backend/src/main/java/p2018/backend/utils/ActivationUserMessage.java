package p2018.backend.utils;

import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;

import javax.annotation.PostConstruct;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.aspectj.EnableSpringConfigured;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import p2018.backend.entities.User;

@Configurable(preConstruction=true,dependencyCheck=true)
@EnableSpringConfigured
public class ActivationUserMessage {
	
	private MimeMessage message;
	private String messageFromEmail;
	private String messageText;
	private String messageSubject;
	
	public ActivationUserMessage(User user, JavaMailSender sender, ConfigUtility config) {
		
		messageFromEmail = config.getProperty("mail.message.sender");
		messageSubject = config.getProperty("mail.message.subject");
		
		String passwordReset = null;
		String accountActivation = null; 
		
		try {
			
			this.message = sender.createMimeMessage();
			
			MimeMessageHelper helper = new MimeMessageHelper(this.message, false, "utf-8");
			helper.setFrom(messageFromEmail);
			helper.setTo(user.getEmail());
			helper.setSubject(messageSubject);		
			
			DatagramSocket socket = new DatagramSocket();
			socket.connect(InetAddress.getByName("8.8.8.8"), 10002);
			String ip = socket.getLocalAddress().getHostAddress();
			
			if(user.getAccountConfirmed()) {
				passwordReset = "<h1>Hospital de Pediatría S.A.M.I.C. Prof. Dr. Juan P. Garrahan</h1><h3>Banco de Sangre | Centro Regional de Hemoterapia</h3><p>Estimado:" + user.getFirstname() + " " + user.getLastname() + ", su nombre de usuario es: <strong>" + user.getUsername() + "</strong></p><p>Para cambiar su contraseña haga click <a href=\""+ config.getProperty("garrahan.client.host") + "/password-change?token="+ user.getVerificationToken() +"\">aquí</a></p>";
				this.message.setContent(passwordReset, "text/html");
			}else {
				accountActivation = "<h1>Hospital de Pediatría S.A.M.I.C. Prof. Dr. Juan P. Garrahan</h1><h3>Banco de Sangre | Centro Regional de Hemoterapia</h3><p>Estimado: "+ user.getFirstname() + " " + user.getLastname() +", su cuenta se ha registrado correctamente.</p><p>Para activar la misma, debe ingresar <a href=\""+ config.getProperty("garrahan.client.host") +"/confirmar-cuenta?token="+ user.getVerificationToken() +"\">aquí</a></p>";
				this.message.setContent(accountActivation, "text/html");
			}
			
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public MimeMessage getMessage() {
		return message;
	}

	public void setMessage(MimeMessage message) {
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
