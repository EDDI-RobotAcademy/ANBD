package com.anabada.web.vo;

public class JobCriteria {

	private int page; // 페이지 번호
	private int perPageNum; // 한 페이지 당 보여줄 게시글 수
	private int rowStart; // 페이지 한 행의 첫번째 게시물 rowNum
	private int rowEnd; // 페이지 한 행의 마지막 게시물 rowNum
	
	/////알바 마이페이지 관련
	private int perPageNum2;
	private int rowStart2;
	private int rowEnd2;
	////알바 마이페이지 관련
	
	public JobCriteria() { // 생성자
		this.page = 1; // 페이지 1로 초기화
		this.perPageNum = 16; // 페이지당 게시글 16개
		this.perPageNum2 = 10;
	}
	
	public void setPage(int page) { // 페이지 번호 set
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	public int getPage() {
		return page;
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) { // 페이지당 게시물 갯수 set
		if(perPageNum <= 0 || perPageNum > 100) { 
			this.perPageNum = 16;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPageStart() { 
		// 현재 페이지의 페이지당 게시글 수를 곱하여 현재 페이지의 시작 게시글 rownum 수를 구하는 것
		return (this.page - 1) * perPageNum; 
	}
	
	// rowStart랑 rowEnd는 page와 perPageNum만 있으면 get할때 계산됨
	public int getRowStart() { // ex) 페이지(page)가 [2], perPageNum
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}
	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum -1;
		return rowEnd;
	}
	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}
	
	/////////////알바마이페이지 관련
	public int getPerPageNum2() {
		return perPageNum2;
	}
	
	public void setPerPageNum2(int perPageNum2) { 
		if(perPageNum2 <= 0 || perPageNum2 > 100) { 
			this.perPageNum2 = 10;
			return;
		}
		this.perPageNum2 = perPageNum2;
	}
	
	public int getPageStart2() { 
		// 현재 페이지의 페이지당 게시글 수를 곱하여 현재 페이지의 시작 게시글 rownum 수를 구하는 것
		return (this.page - 1) * perPageNum2; 
	}
	
	// rowStart랑 rowEnd는 page와 perPageNum만 있으면 get할때 계산됨
	public int getRowStart2() { // ex) 페이지(page)가 [2], perPageNum
		rowStart2 = ((page - 1) * perPageNum2) + 1;
		return rowStart2;
	}
	public void setRowStart2(int rowStart2) {
		this.rowStart2 = rowStart2;
	}
	
	public int getRowEnd2() {
		rowEnd2 = rowStart2 + perPageNum2 -1;
		return rowEnd2;
	}
	public void setRowEnd2(int rowEnd2) {
		this.rowEnd2 = rowEnd2;
	}
	////////

	@Override
	public String toString() {
		return "JobCriteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd="
				+ rowEnd + ", perPageNum2=" + perPageNum2 + ", rowStart2=" + rowStart2 + ", rowEnd2=" + rowEnd2 + "]";
	}

	
	
	

}
