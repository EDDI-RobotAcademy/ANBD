package com.example.boilerplateproj.domain.vue.complaint.repository;

import com.example.boilerplateproj.domain.vue.complaint.entity.Complaint;
import com.example.boilerplateproj.domain.vue.complaint.service.ComplaintService;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.transaction.Transactional;
import java.util.List;

@SpringBootTest
@Transactional
public class complaintTest {

    @Autowired
    private ComplaintService service;
    @Autowired
    private ComplaintRepository repository;

    @Test
    public void totalCountTest() throws  Exception{

        Long total = repository.totalCount("pboard",33);
        System.out.println("결과 : "+total);
    }

    @Test
    public  void detailsCountTest() throws  Exception{
        Long total = repository.detailCount("pboard",33,"판매 금지 물품 판매");
        System.out.println(total);

    }


    @Test
    public void test1() throws  Exception{
        //List<Complaint> findAllByBoardType(String board_type);

        List<Complaint>  test = repository.findAllByBoardType("pboard");
        for(int i=0 ; i<test.size() ; i++){
            System.out.println(test.get(i));
        }

    }

    @Test
    public void findByResonTest() throws  Exception{
        List<Complaint> list = service.findByReson("pboard",35);

        for (int i=0 ; i<list.size() ; i++){
               System.out.println( "확인 : "+ list.get(i));
        }



    }




}
