package com.anabada.web.controller;

import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.anabada.web.service.ProductService;
import com.anabada.web.service.UserProductService;
import com.anabada.web.vo.HeartVO;
import com.anabada.web.vo.PBoardVO;

@Controller
@RequestMapping("/userProduct/*")
public class UserProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Inject
	UserProductService service;

	@Inject
	ProductService productService;



	
	


	// user가 자기가 쓴 글 목록 보기

	@RequestMapping(value = "/myStore", method = RequestMethod.GET)
	public String myBoardList(Model model,HttpServletRequest req) throws Exception {

		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		List<PBoardVO> list = service.myBoardList(id); // 글정보
		System.out.println("총 글의 수 : "+list.size());
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
	

		return "user/myStore";

	}

	// user가 자기가 찜한 목록 보기

	@RequestMapping(value = "myHeartList", method = RequestMethod.GET)
	public String myHeartList(Model model,HttpServletRequest req) throws Exception { // 보여줄 파일 리스트 받아오기
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		List<HeartVO> list = service.myHeartList(id);
		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				HeartVO vo = list.get(i);
				String path = productService.getImg(vo.getPno());
				if (path == null) {
					vo.setH_filePath("/tomcatImg/img.png");

				} else {
					vo.setH_filePath(path);
				}
			}

		}

		model.addAttribute("list", list);

		return null;
	}

}
