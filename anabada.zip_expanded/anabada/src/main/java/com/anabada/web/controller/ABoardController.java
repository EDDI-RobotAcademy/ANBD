package com.anabada.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anabada.web.service.ABoardService;
import com.anabada.web.service.ALikeService;
import com.anabada.web.service.AReplyService;
import com.anabada.web.service.ComplaintService;
import com.anabada.web.service.JobService;
import com.anabada.web.vo.ABoardVO;
import com.anabada.web.vo.ALikeVO;
import com.anabada.web.vo.APageMaker;
import com.anabada.web.vo.AReplyVO;
import com.anabada.web.vo.ASearchCriteria;
import com.anabada.web.vo.ComplaintVO;
import com.anabada.web.vo.MemberVO;

@Controller
@RequestMapping("/a_board/*")
public class ABoardController {

   private static final Logger logger = LoggerFactory.getLogger(ABoardController.class);
   private static final String CURR_IMAGE_REPO_PATH = "C:\\pimages\\";
   private static final String JOB_IMG_PATH = "C:\\upload\\"; // ?????? ????????? ????????????

   @Inject
   ABoardService service;

   @Inject
   AReplyService replyService;

   @Inject
   ALikeService likeService;

   @Inject
   ComplaintService complaintService;

   @Inject
   JobService jobService;

   // ???????????? ?????? ??????
   // ??????????????? ????????? ????????? ??????????????? ???
   @RequestMapping(value = "/writeView", method = RequestMethod.GET)
   public void writeView() throws Exception {

      logger.info("writeView");
   }

   // ????????? ??????
   @RequestMapping(value = "/write", method = RequestMethod.POST)
   public String writeView(ABoardVO boardVO) throws Exception {

      logger.info("write");

      service.write(boardVO);

      return "redirect:/a_board/list";
      // redirect??? ???????????? ????????? ?????????
   }

   // ckeditor ?????? ?????????
   @RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
   public void imageUpload(Model model, HttpServletRequest request, HttpServletResponse response,
         MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {
      // ?????? ?????? ??????
      UUID uid = UUID.randomUUID();

      OutputStream out = null;
      PrintWriter printWriter = null;

      // ?????????
      response.setCharacterEncoding("utf-8");
      response.setContentType("text/html;charset=utf-8");
      try {
         // ?????? ?????? ????????????
         String fileName = upload.getOriginalFilename();
         byte[] bytes = upload.getBytes();

         // ????????? ?????? ??????
         String path = "C:\\ckeditor_upload_" + "ckImage/";
         String ckUploadPath = path + uid + "_" + fileName;
         File folder = new File(path);
         System.out.println("path111 : " + path); // ????????? ???????????? console??? ??????

         // ?????? ???????????? ??????
         if (!folder.exists()) {
            try {
               folder.mkdirs(); // ?????? ??????
            } catch (Exception e) {
               e.getStackTrace();
            }
         }

         out = new FileOutputStream(new File(ckUploadPath));
         out.write(bytes);
         out.flush(); // outputStram??? ????????? ???????????? ???????????? ?????????
         System.out.println(1);
         String callback = request.getParameter("CKEditorFuncNum");
         printWriter = response.getWriter();
         String fileUrl = "/a_board/ckImgSubmit?uid=" + uid + "&fileName=" + fileName; // ????????????
         System.out.println(2);
         // ???????????? ????????? ??????
         printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
         System.out.println(3);
         printWriter.flush();
         System.out.println(4);

      } catch (IOException e) {
         e.printStackTrace();
      } finally {
         try {
            if (out != null) {
               out.close();
            }
            if (printWriter != null) {
               printWriter.close();
            }
         } catch (IOException e) {
            e.printStackTrace();
         }
      }
      System.out.println(5);
      return;
   }

   // ????????? ????????? ????????? ????????????
   @RequestMapping(value = "/ckImgSubmit")
   public void ckSubmit(@RequestParam(value = "uid") String uid, @RequestParam(value = "fileName") String fileName,
         HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("????????????");
      // ????????? ????????? ????????? ??????
      String path = "C:\\ckeditor_upload_" + "ckImage/"; // ????????? ????????? ??????
      System.out.println("path2222 : " + path);
      String sDirPath = path + uid + "_" + fileName;

      File imgFile = new File(sDirPath);

      // ?????? ????????? ?????? ????????? ?????? ??????????????? ??? ????????? ????????? ????????????.
      if (imgFile.isFile()) {
         byte[] buf = new byte[1024];
         int readByte = 0;
         int length = 0;
         byte[] imgBuf = null;

         FileInputStream fileInputStream = null;
         ByteArrayOutputStream outputStream = null;
         ServletOutputStream out = null;

         try {
            fileInputStream = new FileInputStream(imgFile);
            outputStream = new ByteArrayOutputStream();
            out = response.getOutputStream();

            while ((readByte = fileInputStream.read(buf)) != -1) {
               outputStream.write(buf, 0, readByte);
            }

            imgBuf = outputStream.toByteArray();
            length = imgBuf.length;
            out.write(imgBuf, 0, length);
            out.flush();

         } catch (IOException e) {
            e.printStackTrace();
         } finally {
            outputStream.close();
            fileInputStream.close();
            out.close();
         }
      }
   }

   // ????????? ??????
   @RequestMapping(value = "/list", method = RequestMethod.GET)
   public String list(Model model, @ModelAttribute("scri") ASearchCriteria scri, HttpServletRequest req,
         @RequestParam(value = "loca", required = false) String loca) throws Exception {

      logger.info("????????? ?????? ??????");

      model.addAttribute("list", service.list(scri));

      APageMaker pageMaker = new APageMaker();
      pageMaker.setCri(scri);
      pageMaker.setTotalCount(service.listCount(scri));

      model.addAttribute("pageMaker", pageMaker);

      return "/a_board/list";
   }

   // ????????? ??????
   @RequestMapping(value = "/loca_list", method = RequestMethod.GET)
   public String loca_list(Model model, @ModelAttribute("scri") ASearchCriteria scri, HttpServletRequest req,
         @RequestParam(value = "loca", required = false) String loca) throws Exception {

      logger.info("????????? ?????? ??????");

      model.addAttribute("list", service.list(scri));

      APageMaker pageMaker = new APageMaker();
      pageMaker.setCri(scri);
      pageMaker.setTotalCount(service.listCount(scri));

      model.addAttribute("pageMaker", pageMaker);

      return "/a_board/loca_list";
   }

   // ????????? ????????????
   @RequestMapping(value = "/readView", method = RequestMethod.GET)
   public String read(Model model, ABoardVO boardVO, ALikeVO likeVO, MemberVO memberVO,
         @ModelAttribute("scri") ASearchCriteria scri, HttpServletRequest req) throws Exception {

      logger.info("????????? ????????????");

      HttpSession session = req.getSession();
      String id = (String) session.getAttribute("id");

      logger.info("id : " + id);

      String str = service.read(boardVO.getA_bno()).getA_content();
      Pattern pattern = Pattern.compile("<img[^>]*src=[\\\"']?([^>\\\"']+)[\\\"']?[^>]*>");
      Matcher matcher = pattern.matcher(str);

      while (matcher.find()) {
         System.out.println(matcher.group(1));
      }

      model.addAttribute("str", str);
      model.addAttribute("read", service.read(boardVO.getA_bno()));
      model.addAttribute("scri", scri);

      List<AReplyVO> replyList = replyService.readReply(boardVO.getA_bno());
      model.addAttribute("replyList", replyList);

      Map<String, String> likeChk = new HashMap<>();

      likeChk.put("id", id);
      likeChk.put("a_bno", Integer.toString(boardVO.getA_bno()));

      logger.info("likeChk : " + likeChk);

      int Chk = likeService.likeCheck(likeChk);

      // ????????? ?????? ?????? ????????? ????????? 1, ????????? ????????? 0
      model.addAttribute("Chk", Chk);

      logger.info("Chk : " + Chk);

      return "/a_board/readView";
   }

   // ????????? ?????? ??????
   @RequestMapping(value = "/updateView", method = RequestMethod.GET)
   public String updateView(Model model, ABoardVO boardVO, MemberVO memberVO,
         @ModelAttribute("scri") ASearchCriteria scri) throws Exception {
      logger.info("????????? ???????????? ????????????");

      model.addAttribute("update", service.read(boardVO.getA_bno()));
      model.addAttribute("scri", scri);

      return "a_board/updateView";
   }

   // ????????? ??????
   @RequestMapping(value = "/update", method = RequestMethod.POST)
   public String update(ABoardVO boardVO, @ModelAttribute("scri") ASearchCriteria scri, RedirectAttributes rttr)
         throws Exception {
      logger.info("????????? ?????? ??????");

      service.update(boardVO);

      rttr.addAttribute("page", scri.getPage());
      rttr.addAttribute("perPageNum", scri.getPerPageNum());
      rttr.addAttribute("searchType", scri.getSearchType());
      rttr.addAttribute("keyword", scri.getKeyword());
      rttr.addAttribute("cateType", scri.getCateType());

      return "redirect:/a_board/list";
   }

   // ????????? ??????
   @RequestMapping(value = "/delete", method = RequestMethod.GET)
   public String delete(ABoardVO boardVO, @ModelAttribute("scri") ASearchCriteria scri, RedirectAttributes rttr)
         throws Exception {
      logger.info("????????? ?????? ??????");

      service.delete(boardVO.getA_bno());

      // ?????? ?????? ??????
      Map<String, Object> map = new HashMap<>();

      map.put("c_bno", boardVO.getA_bno());
      map.put("board_type", "a_board");

      complaintService.delete_complaint(map);

      rttr.addAttribute("page", scri.getPage());
      rttr.addAttribute("perPageNum", scri.getPerPageNum());
      rttr.addAttribute("searchType", scri.getSearchType());
      rttr.addAttribute("keyword", scri.getKeyword());
      rttr.addAttribute("cateType", scri.getCateType());

      return "redirect:/a_board/list";
   }

   // ????????? ??????
   @RequestMapping(value = "/insertLike", method = RequestMethod.POST)
   public @ResponseBody String insertLike(ABoardVO boardVO, ALikeVO likeVO,
         @RequestParam(value = "id", required = false) String id,
         @RequestParam(value = "a_bno", required = false) int a_bno, HttpServletRequest request, Model model)
         throws Exception {
      System.out.println("??? ???????????? ??????");

      Map<String, String> bnoId = new HashMap<>();

      bnoId.put("id", id);
      bnoId.put("a_bno", Integer.toString(boardVO.getA_bno()));

      likeService.insertLike(bnoId);

      int likeCnt = likeService.updateLike(likeVO.getA_bno());
      model.addAttribute("read", likeCnt);

      return "redirect:/a_board/readView";
   }

   // ????????? ??????
   @RequestMapping(value = "/deleteLike", method = RequestMethod.POST)
   public @ResponseBody String deleteLike(ABoardVO boardVO, ALikeVO likeVO,
         @RequestParam(value = "id", required = false) String id,
         @RequestParam(value = "a_bno", required = false) int a_bno, HttpServletRequest request) throws Exception {

      Map<String, String> bnoId = new HashMap<>();

      bnoId.put("id", id);
      bnoId.put("a_bno", Integer.toString(boardVO.getA_bno()));

      likeService.deleteLike(bnoId);
      likeService.deleteIsLike(likeVO.getA_bno());

      return "redirect:/a_board/readView";
   }

   // ?????? ?????? ?????????
   @RequestMapping(value = "/report", method = RequestMethod.GET)
   public String report(Model model, @RequestParam(value = "a_bno", required = false) int a_bno) throws Exception {

      model.addAttribute("a_bno", a_bno);
      return "a_board/report";
   }

   // ?????? ?????? ?????? ????????? ?????? ?????? ?????????
   @RequestMapping(value = "/reportError", method = RequestMethod.GET)
   public String reportError() throws Exception {
      return "a_board/reportError";
   }

   // ????????? ?????? DB ????????????
   @RequestMapping(value = "/reportComplaint", method = RequestMethod.GET)
   public String reportComplaint(Model model, ComplaintVO complaintVO) throws Exception {
      logger.info("????????? ??????");

      service.reportComplaint(complaintVO);

      return "a_board/report";
   }

   // ??????????????? ?????? ??? ??? ??????
   @RequestMapping(value = "/myWriteList", method = RequestMethod.GET)
   public String myWriteList(Model model, ABoardVO boardVO, @ModelAttribute("scri") ASearchCriteria scri,
         HttpServletRequest req) throws Exception {

      HttpSession session = req.getSession();
      String id = (String) session.getAttribute("id");
      scri.setId(id);

      APageMaker pageMaker = new APageMaker();
      pageMaker.setCri(scri);
      pageMaker.setTotalCount(service.writeListCount(scri));

      model.addAttribute("pageMaker", pageMaker);
      model.addAttribute("myWriteList", service.myWriteList(scri));

      return "a_board/myWriteList";
   }

   // ????????? ?????? ?????? ????????????
   @RequestMapping(value = "/complaintReadView", method = RequestMethod.GET)
   public String complaintRead(Model model, ABoardVO boardVO, @ModelAttribute("scri") ASearchCriteria scri,
         HttpServletRequest req, @RequestParam(value = "href") String href) throws Exception {

      logger.info("????????? ????????????");

      model.addAttribute("read", service.complaintRead(boardVO.getA_bno()));
      model.addAttribute("scri", scri);
      model.addAttribute("href", href);

      return "/a_board/complaintReadView";
   }

   // ???????????? ????????? ????????? ??????
   @RequestMapping(value = "/admin_delete", method = RequestMethod.GET)
   @ResponseBody
   public boolean admin_delete(@ModelAttribute ABoardVO boardVO,
         @RequestParam(value = "a_bno", required = false) int a_bno) throws Exception {

      logger.info("???????????? ????????? ????????? ??????");

      // ?????? ????????? ??????
      service.delete(a_bno);

      // ?????? ?????? ??????
      Map<String, Object> map = new HashMap<>();

      map.put("c_bno", a_bno);
      map.put("board_type", "a_board");

      complaintService.delete_complaint(map);

      // ????????? ????????? ????????? ?????? ?????? ??????(caution??? ??????)
      System.out.println("id : " + boardVO.getId());
      int count = complaintService.count_caution(boardVO.getId());

      if (count < 4) {
         complaintService.add_caution(boardVO.getId());

         String content = "???????????? ???????????? ????????? '" + boardVO.getA_title() + "'??? ???????????? ????????? ?????? ?????????????????????." + "\n???????????? ?????? ???????????? "
               + ++count + "?????????." + "\n?????? ???????????? 5??? ?????? ?????? ?????? ????????? ??????????????????.";

         Map<String, Object> map2 = new HashMap<>();

         map2.put("n_receiver", boardVO.getId());
         map2.put("n_content", content);

         complaintService.note_caution(map2);
      } else {
         String email = complaintService.expel_email(boardVO.getId());
         deleteWithdrawal(boardVO.getId());
         complaintService.review_null(boardVO.getId());

         // ?????? ??????????????? ?????? ?????? ????????? ?????? ????????? ???????????? ?????? ??????
         List img_list = jobService.img_list(boardVO.getId());

         if (img_list != null || !img_list.isEmpty()) { // ????????? ????????? ??????

            for (int i = 0; i < img_list.size(); i++) {
               File file = null;
               file = new File(JOB_IMG_PATH + img_list.get(i));
               file.delete();
            }
         }

         complaintService.expel_member(boardVO.getId());
         complaintService.insert_email(email);

      }
      boolean result = true;
      return result;
   }

   // ????????? ?????? ????????? ??????
   @RequestMapping(value = "/deleteChk", method = RequestMethod.GET)
   public @ResponseBody int deleteChk(@RequestParam(value = "a_bno", required = false) int a_bno) throws Exception {

      System.out.println("????????? ???????????? ??? ????????? ??????????????? ??????");
      int result = service.deleteChk(a_bno);
      System.out.println("a_bno : " + result);

      return result;
   }

   // ????????? ?????? ????????? ??????
   @RequestMapping(value = "/complaintChk", method = RequestMethod.GET)
   public @ResponseBody int complaintChk(@RequestParam(value = "id") String id,
         @RequestParam(value = "a_bno") int a_bno, @RequestParam(value = "a_board", required = false) String a_board)
         throws Exception {
      logger.info("?????? ????????? ??????");

      Map<String, String> comChk = new HashMap<>();

      comChk.put("id", id);
      comChk.put("c_bno", Integer.toString(a_bno));
      comChk.put("board_type", a_board);

      int result = service.complaintChk(comChk);

      return result;
   }

   public void deleteRealImg(String filePath) {
      String realPath = filePath.substring(11);
      File file = null;
      file = new File(CURR_IMAGE_REPO_PATH + realPath);
      file.delete();

   }

   public void deleteWithdrawal(String id) throws Exception {
      List<Integer> pno_list = complaintService.pno_list(id);

      if (!pno_list.isEmpty()) { 
         List<String> filePath_list = complaintService.filePath_list(pno_list); 
         for (String filePath : filePath_list) {
            deleteRealImg(filePath);
         }
      }
   }

}