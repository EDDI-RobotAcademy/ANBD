package com.anabada.web.vo;

public class StoreCriteria {
	
	
	private int page; //현재 페이지 번호 
	private int perPageNum; // 페이지당 보여줄 글의 갯수 
	private int rowStart; // 페이지 한행의 첫번째 게시물 rowNum
	private int rowEnd; // 페이지 한 행의 마지막 게시물 rowNum 

	
	
	public StoreCriteria() { // 디폴트 생성자 
		this.page = 1; // 페이지 1로 초기화
		this.perPageNum = 10; // 페이지당 게시글 10개 
	}

	public void setPage(int page) { // 페이지 번호 set
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;

	}

	public int getPageStart() {  
		// 특정 페이지의 게시글 시작 번호, 게시글 시작 행 번호 
		// 특정 페이지의 범위를 정하는 구간. 현재 페이지의 게시글 시작번호 
	
		
		return (this.page - 1) * perPageNum;  
	
		
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	//페이지당 게시물 갯수 set 
	public void setPerPageNum(int re_perPageNum) {
		if (re_perPageNum <= 0 || re_perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = re_perPageNum;
	}

	
	//현재 페이지의 페이지당 게시글 수를 곱하여 현재 페이지의 시작 게시글 rownum 수를 구하는 것 
	public int getRowStart() { 
		
		rowStart = ((page - 1) * perPageNum) + 1;

		return rowStart; 
	}

	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}

	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;

		return rowEnd;
	}

	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}

	public int getPage() {
		return page;
	}



}
