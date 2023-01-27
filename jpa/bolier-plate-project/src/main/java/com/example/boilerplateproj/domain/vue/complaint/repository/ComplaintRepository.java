package com.example.boilerplateproj.domain.vue.complaint.repository;

import com.example.boilerplateproj.domain.vue.complaint.entity.Complaint;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ComplaintRepository extends JpaRepository<Complaint, Long> {

    @Query(value = "SELECT * FROM complaint WHERE board_type = ?1", nativeQuery = true)
    List<Complaint> findAllByBoardType(String board_type);

}
