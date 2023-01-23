package com.anabada.web.controller;

import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.anabada.web.service.ProductComplaintService;
import com.anabada.web.vo.ComplaintVO;


@Controller
@RequestMapping("/pcomplaint/*")
public class ProductComplaintController {
	private static final Logger logger = LoggerFactory.getLogger(ProductComplaintController.class);
	
	@Inject
	ProductComplaintService service;
	
	
	// 중고 상품 게시판 신고 내역 불러오기 
	@RequestMapping(value = "/proComplaint", method = RequestMethod.GET)
	public String proComplaint() throws Exception {
		
		
		// 중고 게시판에 신고된 리스트 불러오기 
		List<ComplaintVO> list = service.productList("pboard"); // PBoard에 해당하는 신고 내역 불러오기 
		

		
		
		
		return "";
	}
	
	
	//  리뷰 신고 내역 불러오기 
	/*
	 * @RequestMapping(value = "/proComplaint", method = RequestMethod.GET) public
	 * String reviewComplaint() throws Exception {
	 * 
	 * 
	 * // 중고 게시판에 신고된 리스트 불러오기 List<ComplaintVO> list =
	 * service.productList("review"); // PBoard에 해당하는 신고 내역 불러오기
	 * 
	 * 
	 * 
	 * 
	 * 
	 * return ""; }
	 */


	
	

}
