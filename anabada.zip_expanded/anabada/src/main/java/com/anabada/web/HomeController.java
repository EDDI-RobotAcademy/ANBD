package com.anabada.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.anabada.web.service.AdminBannerService;
import com.anabada.web.service.ProductService;
import com.anabada.web.vo.PBoardVO;
import com.anabada.web.vo.PageMaker;
import com.anabada.web.vo.SearchCriteria;
import com.anabada.web.vo.SearchCriteriapro;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	ProductService service;
	
	@Inject
	AdminBannerService abservice;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception{
		
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		model.addAttribute("blist", abservice.list());
		
		// 중고 게시글 가져오기 
		SearchCriteriapro scri = new SearchCriteriapro();
		List<PBoardVO> list = service.list(scri); // 글정보 담아오기 
		// list에 해당하는 사진 정보 담아오기 
		for(int i=0 ; i < list.size() ; i++) {
			PBoardVO vo = list.get(i);
			String path = service.getImg(vo.getPno()); // 첫번쨰 사진의 정보를 담음
			if (path == null) {
				vo.setP_filepath("/tomcatImg/img.png");
			} else {
				vo.setP_filepath(path);
			}
		}
		model.addAttribute("list", list);
		
		return "index";
	}
	
	// 이벤트 배너 등록 페이지
	@RequestMapping(value = "/bannerForm", method = RequestMethod.GET)
	public String bannerForm() throws Exception {
		return "/a_banner/bannerForm";
	}
	
	// test
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Model model) {
		String kbs = "아름다운 대한민국!";
		model.addAttribute("datadata", kbs);
		logger.info("test: " + kbs);

		return "/test/korea";
	}
		
}
