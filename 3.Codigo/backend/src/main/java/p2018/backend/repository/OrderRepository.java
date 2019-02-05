package p2018.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import p2018.backend.entities.OrderInfo;

public interface OrderRepository extends JpaRepository<OrderInfo, Long>, JpaSpecificationExecutor<OrderInfo> {
	
	@Query("select count(o) from OrderInfo o where o.institutionId = :institutionId")
	Long findOrderCountByInstitytionId(@Param("institutionId") Long institutionId);
	
	@Query("select count(o) from OrderInfo o where o.ownerId = :ownerId")
	Long findOrderCountByUserId(@Param("ownerId") Long ownerId);

}
