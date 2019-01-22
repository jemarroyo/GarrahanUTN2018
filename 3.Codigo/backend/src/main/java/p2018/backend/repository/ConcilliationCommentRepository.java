package p2018.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import p2018.backend.entities.ConcilliationComment;

public interface ConcilliationCommentRepository extends JpaRepository<ConcilliationComment, Long> {

}
