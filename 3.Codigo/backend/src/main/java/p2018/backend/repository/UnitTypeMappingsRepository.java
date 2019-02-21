package p2018.backend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import p2018.backend.entities.UnitTypeMappings;

public interface UnitTypeMappingsRepository extends JpaRepository<UnitTypeMappings, Long> {
	
	@Query("Select u from UnitTypeMappings u where u.orderId = :orderId")
	List<UnitTypeMappings> getAllByOrderId(@Param("orderId") Long orderId);

}
