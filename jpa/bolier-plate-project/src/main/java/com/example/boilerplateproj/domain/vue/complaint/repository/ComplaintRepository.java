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

    @Query(value = "SELECT  com_num, id, c_content, c_bno, board_type FROM "
            + "(SELECT com_num, id, c_content, c_bno, board_type"
            + ", ROW_NUMBER() OVER (PARTITION BY c_bno, board_type ORDER BY com_num desc)  AS RN "
            + "FROM complaint) "
            + "WHERE RN = 1 ORDER BY com_num desc", nativeQuery = true)
    List<Complaint> findAllComplaint();

    @Query(value = "SELECT  com_num, id, c_content, c_bno, board_type FROM "
            + "(SELECT com_num, id, c_content, c_bno, board_type"
            + ", ROW_NUMBER() OVER (PARTITION BY c_bno, board_type ORDER BY com_num desc)  AS RN "
            + "FROM complaint) "
            + "WHERE RN = 1 AND board_type =?1 ORDER BY com_num desc", nativeQuery = true)
    List<Complaint> findAllByBoardType(String board_type);

    @Transactional
    @Modifying
    @Query(value = "delete from complaint c where c.board_type = :board_type and c.c_bno = :c_bno", nativeQuery = true)
    void deleteByParameters(@Param("board_type") String boardType, @Param("c_bno") long c_bno);


    @Transactional
    @Query(value = "select count(*) from COMPLAINT c  where c.board_type = :board_type and c.c_bno= :c_bno",nativeQuery = true)
    Long totalCount(@Param("board_type") String boardType, @Param("c_bno") long c_bno);

    @Transactional
    @Query(value = "select count(*) from complaint c where c.board_type = :board_type and c.c_bno= :c_bno and c.c_content = :c_content", nativeQuery = true)
    Long detailCount(@Param("board_type") String boardType, @Param("c_bno")long c_bno, @Param("c_content")String c_content);

    @Transactional
    @Query(value = "select * from complaint c where c.board_type= :board_type and c.c_bno= :c_bno  and c_content not in ('욕설, 비방, 차별, 혐오','판매 금지 물품 판매','홍보,영리목적','불법 정보','음란, 청소년 유해','사기 글이에요','개인 정보 노출, 유포, 거래','도배 스팸')", nativeQuery = true)
    List<Complaint> findByReson(@Param("board_type")String boardType,@Param("c_bno")long c_bno);

}


