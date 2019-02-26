package p2018.backend.utils;

public class Constants {
	
	// Spring Security

	public static final String LOGIN_URL = "/api/xusers/login";
	public static final String HEADER_AUTHORIZACION_KEY = "Authorization";
	public static final String TOKEN_BEARER_PREFIX = "Bearer ";

	// JWT

	public static final String ISSUER_INFO = "";
	public static final String SUPER_SECRET_KEY = "z1x2c3v4b5n6m7";
	public static final long TOKEN_EXPIRATION_TIME = 864_000_000; // 10 day
	
}
