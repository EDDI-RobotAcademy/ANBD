package com.anabada.web.vo;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class StorePageMaker {
	
	private int totalCount; 
	   private int startPage; 
	   private int endPage; 
	   private boolean prev; 
	   private boolean next; 
	   private int displayPageNum = 3;
	   private StoreCriteria cri;
	   
	   public int getTotalCount() {
	      return totalCount;
	   }
	   public void setTotalCount(int totalCount) {
	      this.totalCount = totalCount;
	      calData();
	 
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
	   public StoreCriteria getCri() {
	      return cri;
	   }
	   public void setCri(StoreCriteria cri) {
	      this.cri = cri;
	   }
	   
	   // setTotlaCount 메소드 실행하면 calData()가 실행돼서 endPage, startPage, prev, next에 값이 삽입된다.
	   private void calData() { // 페이지 데이터 처리
	      // 1~10페이지는 endPage가 [10]으로 고정되고 11~20페이지는 endPage가 [20]으로 고정되는 방식
	      endPage = (int)(Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum);
	      // startPage는 매 첫번째 페이지
	      startPage = (endPage - displayPageNum) + 1; // [1], [11]
	      
	      int tempEndPage = (int)(Math.ceil(totalCount / (double)cri.getPerPageNum()  ));
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
	   
	   public String makeSearch(int page,int pno,String p_type) { // list.jsp에서 페이지 숫자 눌렀을 때 실행되는 메소드
		      UriComponents uriComponents = 
		            UriComponentsBuilder.newInstance() 
		          
		            .queryParam("page", page)
		            .queryParam("perPageNum", cri.getPerPageNum())
		            .queryParam("pno", pno)
		            .queryParam("p_type", p_type)
		       
		            .build();
		      
		      return uriComponents.toUriString();
		   }
		   

	   
	
	

}
