package p2018.backend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import p2018.backend.entities.User;

public interface UserRepository extends JpaRepository<User, Long> {
	
	@Query("select u from User u where u.username = :username or u.password = :password")
	User findByUserNameAndPass(@Param("username") String username,
	                                 @Param("password") String password);
	
	User findByUsername(String username);
	
	@Query("select count(u) from User u where u.institutionId = :institutionId")
	Long findUserCountByInstitytionId(@Param("institutionId") Long institutionId);
	
	@Query("select u from User u where u.institutionId = :institutionId")
	List<User> findUserListByInstitutionId(@Param("institutionId") Long institutionId);
	
	@Query("select u from User u where u.email = :email")
	User findUserByEmail(@Param("email") String email);
	
	@Query("select u from User u where u.verificationToken = :verificationToken")
	User findUserByVerificationToken(@Param("verificationToken") String verificationToken);
	
	@Query("select count(u) from User u where u.email = :email or u.username = :username or u.dni = :dni")
	Integer checkExistentUser(@Param("email") String email, @Param("username") String username, @Param("dni") String dni);
	
	@Query("select u from User u where u.isInternal = 0")
	List<User> findClients();
}
