package com.anabada.web.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anabada.web.service.NoteService;
import com.anabada.web.service.ProductService;
import com.anabada.web.vo.PBPageMaker;
import com.anabada.web.vo.PBoardVO;
import com.anabada.web.vo.PfileVO;
import com.anabada.web.vo.ReviewCriteria;
import com.anabada.web.vo.ReviewPageMaker;
import com.anabada.web.vo.ReviewVO;
import com.anabada.web.vo.SearchCriteriapro;
import com.anabada.web.vo.SimilerVO;
import com.fasterxml.jackson.databind.util.JSONPObject;
//import com.google.gson.JsonArray;
//import com.google.gson.JsonObject;

@Controller
@RequestMapping("/product/*")
@SessionAttributes("member")
public class ProductController {


     int pno = pboardvo.getPno();
      logger.info("product delete");

      // 서버에 저장된 이미지 이름 지우는 방법
      // 1. DB에 저장된 이미지 이름을 불러옴 2. 삭제
      List<PfileVO> filelist = service.filelist(pno);
      if (filelist != null) {
         for (PfileVO vo : filelist) {
            deleteRealImg(vo.getFilepath());
         }
      }
      service.delete(pno); // 게시글 삭제 
      // 관계 설정때문에 db에서 글삭제시 이미지 테이블에서 이미지도 삭제됨 
   
      rttr.addAttribute("page", scri.getPage());
      rttr.addAttribute("keyword", scri.getKeyword());
      rttr.addAttribute("searchType", scri.getSearchType());

      return "redirect:/product/list"; // 목록으로 돌아감
   }

   // 게시글 수정하기 클릭했을때
   @RequestMapping(value = "/updateView", method = RequestMethod.GET)
   public String updateView(PBoardVO pboardvo, @ModelAttribute("scri") SearchCriteriapro scri, Model model)
         throws Exception {
      logger.info("product controller updateView");
      model.addAttribute("update", service.read(pboardvo.getPno())); // 해당 게시글의 정보를 담음
      model.addAttribute("scri", scri);
      model.addAttribute("filelist", service.filelist(pboardvo.getPno())); // 사진정보 저장
      return "product/updateView";
   }

   // 게시글 수정이 끝나고 저장할때
   @RequestMapping(value = "/update", method = RequestMethod.POST)
   public String update(PBoardVO pboardVO, @ModelAttribute("scri") SearchCriteriapro scri, Model model,
         @RequestParam String dlist, MultipartHttpServletRequest multipartRequest, HttpServletResponse response,
         RedirectAttributes rttr) throws Exception {
      int num = 0;
      multipartRequest.setCharacterEncoding("utf-8");
      // dlist에 삭제할 이미지의 fno가 담겨서 온다.
      logger.info("update");
      //String[] str = dlist.split(",");
   
      if (pboardVO.getSell_a() == null) {
         pboardVO.setSell_a("0");
         pboardVO.setP_local("0");
      }
      if (pboardVO.getSell_b() == null) {
         pboardVO.setSell_b("0");
      }

      // 게시글 수정시 삭제해야할 이미지 삭제
      if (!(dlist.equals(""))) {
         num += dlist.split(",").length; // 삭제될 이미지 숫자

         removeImg(dlist);
      }
      service.update(pboardVO);

      // 넘어온 사진 저장
      List<String> fileList = fileProcess(multipartRequest);

      int listnum = fileList.size();
      int pnum = pboardVO.getP_file();
      pboardVO.setP_file(pnum - num + listnum);

      // ______________________________________________________________
      if (fileList != null) {
         for (int i = 0; i < fileList.size(); i++) {
            int ftotal = pnum + i + 1;
            Map<String, String> fileMap = new HashMap<>();
            fileMap.put("fno", String.valueOf(ftotal)); // 게시글 내부에서 파일의 넘버 전달
            fileMap.put("filePath", "/tomcatImg/" + (String) fileList.get(i)); // 파일의 경로 저장
            fileMap.put("pno", String.valueOf(pboardVO.getPno())); // 게시글 넘버 저장

            service.fileSave(fileMap); // 파일 저장
         }
      }

      // 넘어온 게시글 저장하기

      // 페이징 정보
      rttr.addAttribute("page", scri.getPage());
      rttr.addAttribute("perPageNum", scri.getPerPageNum());
      rttr.addAttribute("searchType", scri.getSearchType());
      rttr.addAttribute("keyword", scri.getSearchType());

      return "redirect:/product/list";
   }

   // 게시글에서 찜하기 할때

   @RequestMapping(value = "/addHeart")
   @ResponseBody
   public Map<String, String> addHeart(@RequestParam Map<String, String> param) throws Exception {
      logger.info("addHeart");
      Map<String, String> hlist = new HashMap<String, String>();
      int pno = Integer.parseInt(param.get("pno")); // 좋아요 누른 게시판번호
      service.addHeart(param); // Heart 테이블에 좋아요 누른 정보 저장
      service.upHeart(pno); // pno 게시글의 p_heart +1 하기
      hlist.put("hnum", Integer.toString(service.read(pno).getP_heart()));

      return hlist;
   }

   // 게시글 찜 해제 할때
   @RequestMapping(value = "/subHeart")
   @ResponseBody
   public Map<String, String> subHeart(@RequestParam Map<String, String> param) throws Exception {
      logger.info("subHeart");
      Map<String, String> hlist = new HashMap<String, String>();
      int pno = Integer.parseInt(param.get("pno")); // 게시판번호
      service.subHeart(param); // Heart 테이블에 좋아요 누른 정보 삭제
      service.downHeart(pno); // pno 게시글의 p_heart -1 하기
      hlist.put("hnum", Integer.toString(service.read(pno).getP_heart()));

      return hlist;
   }
   
   //상품의 판매 상태 변경
   @RequestMapping(value = "/change")
   @ResponseBody
   public void change(@RequestParam Map<String, String> param) throws Exception {
      logger.info("change");
      
       service.change(param); // pno , p_buy 전달 
   }
   
   
   
   

   // 이미지 저장
   private List<String> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception {

      // Iterator<String> fileNames = multipartRequest.getFileNames();
      List<MultipartFile> fileNameList = multipartRequest.getFiles("file");
      List<String> fileList = new ArrayList<>();
      for (MultipartFile mf : fileNameList) {
         String originalFileName = mf.getOriginalFilename(); // 원본 파일 명
         UUID uuid = UUID.randomUUID();
         

         if (originalFileName.length() > 0) { // 사진이 들어오면 확장자 때문에 . 존재
            String imgExtension = originalFileName.substring(originalFileName.lastIndexOf("."),
                  originalFileName.length()); // 확장자 추출

            String saveName = uuid.toString() + imgExtension;

            fileList.add(saveName);

            File file = new File(CURR_IMAGE_REPO_PATH + "\\" + saveName);
            if (mf.getSize() != 0) {
               if (!file.exists()) {
                  if (file.getParentFile().mkdir()) {
                     file.createNewFile();
                  }
               }
               mf.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + saveName));
            }

         }
      }

      return fileList;

   }

   // 게시글 수정시 넘어온 이미지 삭제
   private void removeImg(String dlist) throws Exception {

      String[] list = dlist.split(",");
      for (String str : list) {
         int fno = Integer.parseInt(str);
         // 사진의 경로 가져오기
         String imgpath = service.imgPath(fno);
         deleteRealImg(imgpath); // 넣어준 경로의 사진을 서버에서 삭제해준다
         service.deleteImg(fno); // 해당 이미지를 테이블에서 삭제
      }
   }

   // 해당 경로의 이미지를 삭제하는 메소드
   public void deleteRealImg(String filePath) {
      String realPath = filePath.substring(11);
      File file = null;
      file = new File(CURR_IMAGE_REPO_PATH + realPath);
      file.delete();

   }
   

   

}