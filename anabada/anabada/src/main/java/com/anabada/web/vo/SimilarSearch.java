package com.anabada.web.vo;

public class SimilarSearch {

	private String searchP_type;
	private int tnum;
	private int selpno;


	public int getSelpno() {
		return selpno;
	}

	public void setSelpno(int selpno) {
		this.selpno = selpno;
	}

	public String getSearchP_type() {
		return searchP_type;
	}

	public void setSearchP_type(String searchP_type) {
		this.searchP_type = searchP_type;
	}

	@Override
	public String toString() {
		return "SimilarSearch [searchP_type=" + searchP_type + ", tnum=" + tnum + ", selpno=" + selpno + "]";
	}

	public int getTnum() {
		return tnum;
	}

	public void setTnum(int tnum) {
		this.tnum = tnum;
	}

}
