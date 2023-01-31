package com.example.boilerplateproj.domain.vue.complaint.repository;

import com.example.boilerplateproj.domain.vue.complaint.controller.request.ComplaintRequest;
import com.example.boilerplateproj.domain.vue.complaint.entity.Complaint;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ComplaintRepository extends JpaRepository<Complaint, Long> {

    @Query(value = "SELECT * FROM complaint WHERE board_type = ?1", nativeQuery = true)
    List<Complaint> findAllByBoardType(String board_type);

    @Transactional
    @Modifying
    @Query(value = "delete from complaint c where c.board_type = :board_type and c.c_bno = :c_bno", nativeQuery = true)
    void deleteByParameters(@Param("board_type") String boardType, @Param("c_bno") long c_bno);

}
