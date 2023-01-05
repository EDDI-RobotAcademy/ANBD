package com.anabada.web.vo;

//검색의 기준
public class SearchCriteriapro extends PBCriteria {

	private String searchType = "";
	private String keyword = "";
	private String productType="";
	
	
	
	
	
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




	public String getProductType() {
	
		return productType;
	}




	public void setProductType(String productType) {
		this.productType = productType;
	}




	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + ", productType=" + productType
				+ ", getPageStart()=" + getPageStart() + ", getPerPageNum()=" + getPerPageNum() + ", getRowStart()="
				+ getRowStart() + ", getRowEnd()=" + getRowEnd() + ", getPage()=" + getPage() + ", toString()="
				+ super.toString() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}

	
}
