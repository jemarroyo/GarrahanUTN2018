package p2018.test;

import java.net.DatagramSocket;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
public class BackendApplicationTests {

	
	public void test1() {
		
		//Password:$2a$10$OVJtyuzri1x3q30XRTAM0OUAgd5NA9yiadW94poFmG1XVjRF4mf1m
		//Password2:$2a$10$Xc0BDTcdFqqequJjVoMscuPKowDm/6bM5g/ByCWqa60pSDqcTF.C6
		
		String encryptPassword = BCrypt.hashpw("garrahan", BCrypt.gensalt());
		System.out.println("Password:" + encryptPassword);
		
		String encryptPassword2 = BCrypt.hashpw("garrahan", BCrypt.gensalt());
		System.out.println("Password2:" + encryptPassword2);
		
		boolean check1 = BCrypt.checkpw("garrahan", "$2a$10$TggEiELu1ZLjgn48RKfwJ.sh1Kgv9pgfe.iJk..01i304SPiZ4hd");
		boolean check2 = BCrypt.checkpw("garrahan", "$2a$10$Xc0BDTcdFqqequJjVoMscuPKowDm/6bM5g/ByCWqa60pSDqcTF.C6");
		
		System.out.println(check1);
		System.out.println(check2);

	}
	
	
	public void test2() {
		
		List<String> tokenConfirmations = new ArrayList<String>();
		
		for (int i = 0; i < 7; i++) {
			tokenConfirmations.add(UUID.randomUUID().toString());
		}
		
		for (Iterator iterator = tokenConfirmations.iterator(); iterator.hasNext();) {
			String string = (String) iterator.next();
			System.out.println(string);
		}
	}
	
	@Test
	public void test3() throws SocketException {
		
		String ip;
		try {
			
			DatagramSocket socket = new DatagramSocket();
			socket.connect(InetAddress.getByName("8.8.8.8"), 10002);
			ip = socket.getLocalAddress().getHostAddress();
			System.out.println("host:" + ip);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
