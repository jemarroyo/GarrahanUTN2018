package p2018.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import p2018.backend.entities.User;

public interface UserRepository extends JpaRepository<User, Long> {

}
