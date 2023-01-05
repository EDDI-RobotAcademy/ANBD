package com.anabada.web.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anabada.web.service.NoteService;
import com.anabada.web.vo.NotePageMaker;
import com.anabada.web.vo.NoteSearchCriteria;
import com.anabada.web.vo.NoteVO;

@Controller
@RequestMapping("/note/*") 
public class NoteController {

	private static final Logger logger = LoggerFactory.getLogger(NoteController.class);

	
	@Inject
	NoteService noteService;

	// 쪽지보내는 ajax
	@RequestMapping(value="/note_insert.ajax", method = RequestMethod.GET)
	@ResponseBody
    public void reg_proc(HttpServletResponse resp, @ModelAttribute("noteVO") NoteVO noteVO) throws Exception {
        
		System.out.println("쪽지" + noteVO);
		System.out.println(noteVO);
		
		boolean result = false;
        
		noteService.send(noteVO);
		
		result = true;
        
        PrintWriter writer = resp.getWriter();
        resp.setCharacterEncoding("UTF-8"); 
        resp.setContentType("text/html;charset=UTF-8");
        writer.println(result);
    }
	
	
	//쪽지 목록보기
	@RequestMapping(value = "/note_list", method = RequestMethod.GET)
	public String note_list(HttpSession session, Model model, NoteVO noteVO, @ModelAttribute("scri") NoteSearchCriteria scri) throws Exception{
		
		logger.info("쪽지 목록보기 눌렀음~~~~");
	
		session.setAttribute("id","korea"); // 로그인 세션지금 임의로 줌. 이건 임의!!!!!!!!!
		String id = (String)session.getAttribute("id"); // 세션 아이디 받아옴
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", id);
		map.put("who", scri.getWho());
		map.put("rowStart", scri.getRowStart());
		map.put("rowEnd", scri.getRowEnd());
		
		model.addAttribute("n_list", noteService.note_list(map)); // 메시지 목록
		System.out.println("쪽지: " + noteService.note_list(map));
		model.addAttribute("who", scri.getWho());// 받는사람, 보낸사람 구분하려고
		
		NotePageMaker pageMaker = new NotePageMaker();
		pageMaker.setCri(scri); 
		pageMaker.setTotalCount(noteService.note_listCount(map)); // 로그인 아이디와(세션) who(NoteSearchCriteria) 넘겨야함
		System.out.println("총 개수: " + noteService.note_listCount(map));
		
		// 안읽으면 1, 읽으면 0
		model.addAttribute("no_read", noteService.no_readCount(id));
		model.addAttribute("pageMaker", pageMaker);
		
		return "/note/note_list";
	}
	
	// 쪽지 삭제하는 ajax(목록에서)
	@RequestMapping(value = "/delete_chk.ajax", method =RequestMethod.GET)
	public void delete_chk(HttpServletResponse resp, @RequestParam(value="delete_array") int[] delete_array, 
			@RequestParam(value="s_id") String s_id, @RequestParam(value="r_id") String r_id, HttpSession session) throws Exception{
		
		logger.info("쪽지함에서 삭제 눌렀음"); 
		// 페이징 처리 안해줬음 
		
		boolean result = false;
		
		String id = (String)session.getAttribute("id");
		
		if(id.equals(s_id)) {// 보낸 사람이랑 로그인한 회원이 같을 때
			noteService.delete_send(delete_array); 
		}else if(id.equals(r_id)){//보낸사람이랑 로그인한 회원이 같을 때 
			noteService.delete_receive(delete_array);
		}
		
		noteService.delete_all(delete_array); // 보낸 사람, 받는 사람 둘다 삭제했으면 디비에서도 삭제
			
		result = true;
        
        PrintWriter writer = resp.getWriter();
        resp.setCharacterEncoding("UTF-8"); 
        resp.setContentType("text/html;charset=UTF-8");
        writer.println(result);
	}
	
	// 쪽지 상세보기 + 쪽지보면 읽었다고 표시
	@RequestMapping(value = "/note_readView", method =RequestMethod.GET)
	public String note_readView(@ModelAttribute NoteVO vo, Model model,@ModelAttribute("scri") NoteSearchCriteria scri, HttpSession session) throws Exception{
		
		logger.info("쪽지 상세보기로 들어왔으~~");
		
		System.out.println("번호: " + vo.getBno());
		
		model.addAttribute("n_read", noteService.note_view(vo.getBno())); // 게시글 번호로 게시글 객체 불러옴
		model.addAttribute("scri", scri);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", (String)session.getAttribute("id"));
		map.put("bno", vo.getBno());
		noteService.read_check(map); // 읽었다고 처리
		
		return "/note/note_readView";
	}
	
	// 쪽지 삭제하는 ajax(상세보기에서)
	@RequestMapping(value = "/delete_chk2.ajax", method =RequestMethod.GET)
	public void delete_chk2(HttpServletResponse resp, @RequestParam(value="bno") int bno,
			@RequestParam(value="s_id") String s_id, @RequestParam(value="r_id") String r_id, HttpSession session) throws Exception{
			
		logger.info("쪽지 상세보기에서 삭제 눌렀음"); 
			
		boolean result = false;
			
		String id = (String)session.getAttribute("id");
		
			
		if(id.equals(s_id)) {// 보낸 사람이랑 로그인한 회원이 같을 때
			noteService.delete_send2(bno); 
		}else if(id.equals(r_id)){//보낸사람이랑 로그인한 회원이 같을 때 
			noteService.delete_receive2(bno);
		}
			
		noteService.delete_detail(bno); // 보낸 사람, 받는 사람 둘다 삭제했으면 디비에서도 삭제
				
		result = true;
	        
	    PrintWriter writer = resp.getWriter();
	    resp.setCharacterEncoding("UTF-8"); 
	    resp.setContentType("text/html;charset=UTF-8");
	    writer.println(result);
	}	
	
	
}
