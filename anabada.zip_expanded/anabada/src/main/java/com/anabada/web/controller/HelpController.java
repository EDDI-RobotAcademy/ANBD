package com.anabada.web.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anabada.web.service.HelpService;
import com.anabada.web.vo.HelpVO;
import com.anabada.web.vo.PageMaker;
import com.anabada.web.vo.SearchCriteria;

@Controller
@RequestMapping("/help_board/*")
public class HelpController {

	private static final Logger logger = LoggerFactory.getLogger(HelpController.class);
	
	@Inject
	HelpService service;
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception {
		logger.info("자주 묻는 질문 게시판 글 작성 ~ ");
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(HelpVO helpVO) throws Exception {
		logger.info("자주 묻는 질문 게시판 글쓰기 완료 ~ ");
		
		service.write(helpVO);
		
		return "redirect:/help_board/list";
	}
	
	// 게시판 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(HelpVO helpVO, Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("게시글 목록 조회 ~ ");
		
		model.addAttribute("list", service.list(scri));
		model.addAttribute("read", service.read(helpVO.getH_no()));
		model.addAttribute("scri", scri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "help_board/list";
	}
	
	// 게시판 글 조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(HelpVO helpVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("게시글 조회 ~ ");
			
		model.addAttribute("read", service.read(helpVO.getH_no()));
		model.addAttribute("scri", scri);
			
		return "help_board/readView";
	}
		
	// 게시판 수정 뷰
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(HelpVO helpVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("게시글 수정 ~ ");
			
		model.addAttribute("update", service.read(helpVO.getH_no()));
		model.addAttribute("scri", scri);
		
		return "help_board/updateView";
	}
		
	// 게시판 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(HelpVO helpVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("게시글 수정 완료 ~");
		
		service.update(helpVO);
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
			return "redirect:/help_board/list";
		}
		
	// 게시판 삭제
	@RequestMapping(value = "/delete")
	public String delete(HelpVO helpVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("delete delete");
			
		service.delete(helpVO.getH_no());
			
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
			
		return "redirect:/help_board/list";
	}
		
}
