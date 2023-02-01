package com.anabada.web.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.anabada.web.service.NoteService;
import com.anabada.web.service.ProductComplaintService;
import com.anabada.web.service.ProductService;
import com.anabada.web.vo.ComplaintVO;
import com.anabada.web.vo.PBoardVO;
import com.anabada.web.vo.PfileVO;

@Controller
@RequestMapping("/pcomplaint/*")
public class ProductComplaintController {
	private static final Logger logger = LoggerFactory.getLogger(ProductComplaintController.class);
	private static final String CURR_IMAGE_REPO_PATH = "C:\\pimages\\";
	@Inject
	ProductComplaintService service;
	
	@Inject
	ProductService productService;
	@Inject
	NoteService noteService;
	
	
	// 중고 상품 게시판 신고 내역 불러오기 
	@RequestMapping(value = "/proComplaint", method = RequestMethod.GET)
	public String proComplaint() throws Exception {
		
		
		// 중고 게시판에 신고된 리스트 불러오기 
		List<ComplaintVO> list = service.productList("pboard"); // PBoard에 해당하는 신고 내역 불러오기 
		

		
		
		
		return "";
	}
	
	
	//  리뷰 신고 내역 불러오기 
	
	  @RequestMapping(value = "/reviewComplaint", method = RequestMethod.GET) 
	  public String reviewComplaint() throws Exception {
	  
	  
	  // 중고 게시판에 신고된 리스트 불러오기 List<ComplaintVO> list =
	  service.productList("review"); // PBoard에 해당하는 신고 내역 불러오기
	  
	  
	  
	  
	  
	  return "";
	  }
	 
	  @RequestMapping(value = "/complaintBoard" , method = RequestMethod.GET)
		public String complaintBoard(PBoardVO pboardVO,
				Model model/* , @RequestParam(value="href") String href */) throws Exception{
		 // int pno= pboardVO.getPno();
		  int pno = 17;
		  logger.info("신고 게시물 상세보기  : "+pno);
		  model.addAttribute("read",productService.read(pno)); // 게시글 정보 
		  model.addAttribute("filelist",productService.filelist(pno)); // 사진정보 담음
		  
		  for(int i=0 ; i< productService.filelist(pno).size() ; i++) {
		  System.out.println("사진정보 : "   +  productService.filelist(pno).get(i));
		  }
		  
		  
		  return "product/complaintBoard";
	  }
	  
	  
	  @RequestMapping(value = "/delete_pro" , method = RequestMethod.GET)
	  public boolean deleteProduct(@RequestParam(value = "pno")int pno )throws Exception {
		  logger.info("관리자가 게시글 삭제");
		  
		  List<PfileVO> filelist = productService.filelist(pno);
				for (PfileVO vo : filelist) {
					deleteRealImg(vo.getFilepath());
				}
				
				productService.delete(pno); // 게시글 삭제 
				
				// 신고 내역 삭제 
				Map<String, Object> map = new HashMap<String,Object>();
				map.put("c_bno", pno);
				map.put("board_type", "pboard");
				noteService.delete_complaint(map);
				return true;
				
				
				
				
			}
		  
		 
		  
		  
		  
	  
	  
	  
		public void deleteRealImg(String filePath) {
			String realPath = filePath.substring(11);
			File file = null;
			file = new File(CURR_IMAGE_REPO_PATH + realPath);
			file.delete();

		}

	
	

}
