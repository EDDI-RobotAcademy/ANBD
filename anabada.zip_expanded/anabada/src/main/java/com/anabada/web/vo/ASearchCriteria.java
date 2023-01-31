package com.anabada.web.vo;
//
public class ASearchCriteria extends ACriteria {

	private String searchType = "";
	private String keyword = "";
	private String cateType = "";
	private String id;
	private String locaType = "";
	
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
	public String getCateType() {
		return cateType;
	}
	public void setCateType(String cateType) {
		this.cateType = cateType;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLocaType() {
		return locaType;
	}
	public void setLocaType(String locaType) {
		this.locaType = locaType;
	}
	
	@Override
	public String toString() {
		return "ASearchCriteria [searchType=" + searchType + ", keyword=" + keyword + ", cateType=" + cateType + ", id="
				+ id + ", locaType=" + locaType + "]";
	}

}
