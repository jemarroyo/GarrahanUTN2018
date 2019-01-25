package p2018.test;

import org.junit.Test;
import org.springframework.security.crypto.bcrypt.BCrypt;

public class BackendApplicationTests {

	@Test
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

}
