package com.anabada.web.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PBPageMaker {
	private int totalCount; // 게시글 총 갯수
	   private int startPage; // 10개의 페이지 중 첫번째 ex)[1], [11], [21]
	   private int endPage; // 10개의 페이지 중 마지막 ex) [10], [20], [30]
	   private boolean prev; // 페이지 이전 버튼
	   private boolean next; // 페이지 다음 버튼
	   private int displayPageNum = 10;
	   private PBCriteria cri; // 페이지 정보 객체
	   
	   public int getTotalCount() {
	      return totalCount;
	   }
	   public void setTotalCount(int totalCount) {
	      this.totalCount = totalCount;
	      calData();
	      System.out.println("end : "+endPage);
	      System.out.println("start : "+startPage);
	      System.out.println("전 : "+prev);
	      System.out.println("후 : "+next);
	   }
	   
	   public int getStartPage() {
	      return startPage;
	   }
	   public void setStartPage(int startPage) {
	      this.startPage = startPage;
	   }
	   
	   public int getEndPage() {
	      return endPage;
	   }
	   public void setEndPage(int endPage) {
	      this.endPage = endPage;
	   }
	   
	   public boolean isPrev() {
	      return prev;
	   }
	   public void setPrev(boolean prev) {
	      this.prev = prev;
	   }
	   public boolean isNext() {
	      return next;
	   }
	   public void setNext(boolean next) {
	      this.next = next;
	   }
	   public int getDisplayPageNum() {
	      return displayPageNum;
	   }
	   public void setDisplayPageNum(int displayPageNum) {
	      this.displayPageNum = displayPageNum;
	   }
	   public PBCriteria getCri() {
	      return cri;
	   }
	   public void setCri(PBCriteria cri) {
	      this.cri = cri;
	   }
	   
	   // setTotlaCount 메소드 실행하면 calData()가 실행돼서 endPage, startPage, prev, next에 값이 삽입된다.
	   private void calData() { // 페이지 데이터 처리
	      // 1~10페이지는 endPage가 [10]으로 고정되고 11~20페이지는 endPage가 [20]으로 고정되는 방식
	      endPage = (int)(Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum);
	      // startPage는 매 첫번째 페이지
	      startPage = (endPage - displayPageNum) + 1; // [1], [11]
	      
	      int tempEndPage = (int)(Math.ceil(totalCount / (double)cri.getPerPageNum()));
	      // ex) 게시물이 43개 있으면 tempEndPage = 5
	      if(endPage > tempEndPage) {
	         endPage = tempEndPage;
	         // 마지막 게시물이 있는 페이지가 endPage로 다시 할당해준다. 
	      }
	      
	      prev = startPage == 1 ? false : true;
	      // 첫번째 페이지가 [1]이면 false를 반환하여 이전버튼이 사라지게 한다.
	      next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	      // 마지막 페이지 다음에는 다음버튼이 사라지게 한다.
	      // 마지막 페이지가 [54]일때, 54*10=540 >= 536(게시글총갯수)
	   }
	   
	   public String makeQuery(int page) { // list.jsp에서 [검색] 버튼 눌렀을 때 실행되는 메소드
	      // 원하는 페이지로 페이지 쿼리문을 날려준다.
	      UriComponents uriComponents = 
	            UriComponentsBuilder.newInstance()
	            .queryParam("page", page) // page번호를 파라미터값으로 날려준다.
	            .queryParam("perPageNum", cri.getPerPageNum()) // page당 게시글 갯수를 파라미터 값으로 날려준다.
	            .build();
	      // ?page=1&perPageNum=10
	      
	      return uriComponents.toUriString();
	   }
	   
	   public String makeSearch(int page) { // list.jsp에서 페이지 숫자 눌렀을 때 실행되는 메소드
	      UriComponents uriComponents = 
	            UriComponentsBuilder.newInstance() 
	            /*
	            UroComponentsBilder : 여러개의 파라미터들을 연결하여 URL 형태로 만들어주는 기능 
	            즉,Controller에서 addAttribute로 하나하나 속성을 지정해주지 ㅇ낳아도 이 class를 이용하면 
	            간단하게 파라미터들을 전달 할 수 있다. (한글처리를 신경쓰지 않아도 된다.)
	            */
	            .queryParam("page", page)
	            .queryParam("perPageNum", cri.getPerPageNum())
	            .queryParam("searchType", ((SearchCriteriapro)cri).getSearchType())
	            .queryParam("keyword", encoding(((SearchCriteriapro)cri).getKeyword()))
	            .queryParam("productType", encoding(((SearchCriteriapro)cri).getProductType()))
	            .build();
	      
	      return uriComponents.toUriString();
	      // UriComponents: URI를 동적으로 생성해주는 클래스다. 파라미터가 조합된 URI를 손쉽게 만들어 주어서
	      // 코드상에서 직접 문자열을 조합할 때 생기는 실수를 방지할 수 있다.
	   }
	   
	   private String encoding(String keyword) {
	      if(keyword == null || keyword.trim().length() == 0) {
	         return "";
	      }
	      
	      try {
	         return URLEncoder.encode(keyword, "UTF-8");
	      }catch(UnsupportedEncodingException e) {
	         return "";
	      }
	   }
	   
}
