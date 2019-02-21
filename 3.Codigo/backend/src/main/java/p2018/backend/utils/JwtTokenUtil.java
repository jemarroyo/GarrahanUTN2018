package p2018.backend.utils;

import java.io.Serializable;
import java.util.function.Function;

import org.springframework.stereotype.Component;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;

@Component
public class JwtTokenUtil implements Serializable {


	private static final long serialVersionUID = -6606302441607192804L;
	
	public String getUsernameFromToken(String token) {
	    return getClaimFromToken(token, Claims::getSubject);
	}
	
	public <T> T getClaimFromToken(String token, Function<Claims, T> claimsResolver) {
	    final Claims claims = getAllClaimsFromToken(token);
	    return claimsResolver.apply(claims);
	}
	
	private Claims getAllClaimsFromToken(String token) {
	    return Jwts.parser()
	            .setSigningKey(Constants.SUPER_SECRET_KEY)
	            .parseClaimsJws(token)
	            .getBody();
	}

}
