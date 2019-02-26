package p2018.backend.utils;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

/**
 * This configuration class defines the security applied to the routing 
 * and the encryption type used for the user password
 * 
 * @author gmolina
 *
 */
@Configuration
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {
	
	@Autowired
	ConfigUtility onfigUtility;
	
	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}
	 
	@Autowired
	private UserDetailsService userDatilsService;
	
	@Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
	    auth.userDetailsService(userDatilsService).passwordEncoder(bCryptPasswordEncoder());
	}
	
	@Override
    protected void configure(HttpSecurity http) throws Exception {
			
		http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
		.cors().and()
		.csrf().disable()
		.authorizeRequests().antMatchers(HttpMethod.POST, Constants.LOGIN_URL).permitAll().and()
		.authorizeRequests().antMatchers("/api/confirm-account").permitAll().and()
		.authorizeRequests().antMatchers(HttpMethod.OPTIONS, "/**").permitAll()
		.anyRequest().authenticated()
		.and().formLogin().and()
		.httpBasic()
		.and()
		.addFilter(new JWTAuthenticationFilter(authenticationManager()))
		.addFilter(new JWTAuthorizationFilter(authenticationManager()));
		
    }
	
	
	
	  @Bean 
	  CorsConfigurationSource corsConfigurationSource() {
	  
		  CorsConfiguration configuration = new CorsConfiguration();
		  configuration.setAllowedOrigins(Arrays.asList(onfigUtility.getProperty("security.cors.url")));
		  configuration.setAllowedMethods(Arrays.asList("GET","POST","PATCH","PUT","OPTIONS")); configuration.addAllowedHeader("*");
	  
		  UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
		  source.registerCorsConfiguration("/**",configuration); return source; 
	  }
	 
	 
} 
