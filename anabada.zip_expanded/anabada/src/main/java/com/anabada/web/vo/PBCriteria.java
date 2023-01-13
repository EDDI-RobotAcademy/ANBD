package com.anabada.web.vo;

public class PBCriteria {
	private int page; //현재 페이지 번호 
	private int perPageNum; // 페이지당 보여줄 글의 갯수 
	//쿼리문에서 listpage 쿼리의 RNUM의 범위를 제한하기 위해 rowStart, rowEnd 설정해줌 
	private int rowStart; // 페이지 한행의 첫번째 게시물 rowNum
	private int rowEnd; // 페이지 한 행의 마지막 게시물 rowNum 

	public PBCriteria() { // 디폴트 생성자 
		this.page = 1; // 페이지 1로 초기화
		this.perPageNum = 12; // 페이지당 게시글 10개 
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
		//예를들어 page=11 이면 (11-1)*10 = 100 
		/*
		 1페이지 > 0-9 게시글 
		 2페이지 > 10-19 게시글  
		 */
		
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	//페이지당 게시물 갯수 set 
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
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

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}

	
}
