package com.anabada.web.vo;

public class ComplaintVO {
	private int com_num;
	private String id;
	private String c_content;
	private int c_bno;
	private String board_type;
	public int getCom_num() {
		return com_num;
	}
	public void setCom_num(int com_num) {
		this.com_num = com_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public int getC_bno() {
		return c_bno;
	}
	public void setC_bno(int c_bno) {
		this.c_bno = c_bno;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	@Override
	public String toString() {
		return "ComplaintVO [com_num=" + com_num + ", id=" + id + ", c_content=" + c_content + ", c_bno=" + c_bno
				+ ", board_type=" + board_type + "]";
	}
	
	
	

}
