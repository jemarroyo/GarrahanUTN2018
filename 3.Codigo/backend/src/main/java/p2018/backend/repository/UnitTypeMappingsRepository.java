package p2018.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import p2018.backend.entities.UnitTypeMappings;

public interface UnitTypeMappingsRepository extends JpaRepository<UnitTypeMappings, Long> {
	
	@Query("delete from UnitTypeMappings u where u.orderId = :orderId")
	void deleteAllByOrderId(@Param("orderId") Long orderId);

}
