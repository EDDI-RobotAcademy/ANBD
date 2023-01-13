package com.anabada.web.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthOptionPaneUI;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.anabada.web.service.ProductService;
import com.anabada.web.service.UserProductService;
import com.anabada.web.vo.HeartVO;
import com.anabada.web.vo.PBoardVO;
import com.anabada.web.vo.PfileVO;
import com.anabada.web.vo.StoreCriteria;
import com.anabada.web.vo.StorePageMaker;

@Controller
@RequestMapping("/userProduct/*")
public class UserProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	private static final String CURR_IMAGE_REPO_PATH = "C:\\pimages\\";
	@Inject
	UserProductService service;

	@Inject
	ProductService productService;



	
	


	// user가 자기가 쓴 글 목록 보기

	@RequestMapping(value = "/myStore", method = RequestMethod.GET)
	public String myBoardList(Model model,@ModelAttribute("scri") StoreCriteria scri  ,HttpServletRequest req) throws Exception {

		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		scri.setId(id);
		List<PBoardVO> list = service.myBoardList(scri); // 글정보
		
		for (int i = 0; i < list.size(); i++) {
			PBoardVO vo = list.get(i);
			String path = productService.getImg(vo.getPno()); // 첫번째 사진의 정보를 담음
			if (path == null) {
				vo.setP_filepath("/tomcatImg/img.png");
				System.out.println("제목 : "+vo.getP_title());
			} else {
				vo.setP_filepath(path);
			}
		}
		model.addAttribute("list", list);
		StorePageMaker pageMaker = new StorePageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.storeCount(scri));
		model.addAttribute("pageMaker",pageMaker);
		
		return "user/myStore";

	}

	// user가 자기가 찜한 목록 보기

	@RequestMapping(value = "/myHeartList", method = RequestMethod.GET)
	public String myHeartList(Model model,HttpServletRequest req,@ModelAttribute("scri") StoreCriteria scri) throws Exception { // 보여줄 파일 리스트 받아오기
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		scri.setId(id);
		List<HeartVO> heartList = service.myHeartList(scri); //사용자가 찜을 누른 pno 받아오기 
		//pno에 해당하는 게시글 정보 받아오기 
		List<PBoardVO> list = new ArrayList<PBoardVO>();
		
		
		if (heartList != null) {
			for (int i = 0; i < heartList.size(); i++) {
				int pno = heartList.get(i).getPno();
				PBoardVO vo = productService.read(pno);
				String path = productService.getImg(pno);
				if (path == null) {
					vo.setP_filepath("/tomcatImg/img.png");

				} else {
					vo.setP_filepath(path);
				}
				list.add(vo);
			}

		}

		model.addAttribute("list", list);
		StorePageMaker pageMaker = new StorePageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.totalHeart(scri));
		model.addAttribute("pageMaker",pageMaker);

		return "user/myHeart";
	}
	
	
	//내상점에서 삭제하기 눌렀을때 
	   @RequestMapping(value = "/deleteProduct", method =RequestMethod.GET)
	   @ResponseBody
	   public boolean deleteProduct(HttpServletResponse resp, @RequestParam(value="delete_array") int[] delete_array, 
	         HttpSession session) throws Exception{
	      
	      logger.info("내상점에서 삭제하기 눌렀을때 "); 
	      
	      
	      for(int pno : delete_array) {
	      
			List<PfileVO> filelist = productService.filelist(pno);
			if (filelist != null) {
				for (PfileVO vo : filelist) {
					deleteRealImg(vo.getFilepath());
				}
			}
	      
	      }
	      
	      
	      service.deleteProductList(delete_array); //p_file, pboard 둘다 삭제 하는 쿼리를 daoimpl에 작성
	   
	      boolean result = true;
	      return result;
	        
	   }
	
	   @RequestMapping(value = "/deleteHeart", method =RequestMethod.GET)
	   @ResponseBody
	   public boolean deleteHeart(HttpServletResponse resp, @RequestParam(value="delete_array") int[] delete_array, 
			   HttpSession session) throws Exception{
		   
		   logger.info("deleteHeart123123"); 
		   service.deleteHeartList(delete_array);
		   
		   boolean result = true;
		   return result;
		   
	   }
	   
	   
		// 해당 경로의 이미지를 삭제하는 메소드
		public void deleteRealImg(String filePath) {
			String realPath = filePath.substring(11);
			File file = null;
			file = new File(CURR_IMAGE_REPO_PATH + realPath);
			file.delete();

		}
	   
	
	

}
