package com.anabada.web.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class NotePageMaker {

	private int totalCount; // 게시글 총 갯수
	private int startPage; // 10개의 페이지 중 첫번째 ex)[1], [11], [21]
	private int endPage; // 10개의 페이지 중 마지막 ex) [10], [20], [30]
	private boolean prev; // 페이지 이전 버튼
	private boolean next; // 페이지 다음 버튼
	private int displayPageNum = 10;
	private NoteCriteria cri; // 페이지 정보 객체
	
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
	public NoteCriteria getCri() {
		return cri;
	}
	public void setCri(NoteCriteria cri) {
		this.cri = cri;
	}
	
	private void calData() { // 페이지 데이터 처리
		endPage = (int)(Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1; // [1], [11]
		
		int tempEndPage = (int)(Math.ceil(totalCount / (double)cri.getPerPageNum()));
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}
	
	public String makeQuery(int page) {
		// 원하는 페이지로 페이지 쿼리문을 날려준다.
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
				.queryParam("page", page) // page번호를 파라미터값으로 날려준다.
				.queryParam("perPageNum", cri.getPerPageNum()) // page당 게시글 갯수를 파라미터 값으로 날려준다.
				.build();
		// ?page=1&perPageNum=10
		
		return uriComponents.toUriString();
	}
	
	public String makeSearch(int page) { 
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("who", encoding(((NoteSearchCriteria)cri).getWho()))
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
