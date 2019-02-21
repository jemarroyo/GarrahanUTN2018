package p2018.backend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import p2018.backend.entities.GeneralComment;

public interface GeneralCommentRepository extends JpaRepository<GeneralComment, Long> {
	
	@Query("select c from GeneralComment c where c.orderId = :orderId")
	List<GeneralComment> findCommentByOrderId(@Param("orderId") Long orderId);

}
