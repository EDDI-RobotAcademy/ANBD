package com.anabada.web.vo;

public class EvSearchCriteria extends EvCriteria {
	// 수정 필요 이벤트 검색 : 진행중 , 마감  으로 구분 해서 검색하도록 한다. 
	private String searchType = "";
	private String keyword = "";
	private String state = "" ;
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "EvSearchCriteria [searchType=" + searchType + ", keyword=" + keyword + ", state=" + state + "]";
	} 
	
	

}
