package p2018.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import p2018.backend.entities.OrderInfoDTO;

public interface OrderInfoDTORepository extends JpaRepository<OrderInfoDTO, Long> {

}
