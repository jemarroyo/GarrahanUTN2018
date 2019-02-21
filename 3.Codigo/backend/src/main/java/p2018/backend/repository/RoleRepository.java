package p2018.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import p2018.backend.entities.Role;
import p2018.backend.entities.User;

public interface RoleRepository extends JpaRepository<Role, Long>{
	
	@Query("select r from Role r where r.name = :name")
	Role findRoleByName(@Param("name") String name);
}
