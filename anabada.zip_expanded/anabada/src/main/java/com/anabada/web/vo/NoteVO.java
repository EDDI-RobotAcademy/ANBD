package com.anabada.web.vo;

import java.sql.Date;

public class NoteVO {

	private int bno;
	private String s_id; // 보낸사람 id
	private String r_id; // 받는 사람 id
	private String s_time; // 보내는 시간
	private String content; // 내용
	private String read_chk; // 읽었는지 체크
	private int s_delete_chk; 
	private int r_delete_chk; 
	private int pno; // 중고게시물 번호
	private String confirm; // 판매완료된 쪽지이면
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getS_time() {
		return s_time;
	}
	public void setS_time(String s_time) {
		this.s_time = s_time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRead_chk() {
		return read_chk;
	}
	public void setRead_chk(String read_chk) {
		this.read_chk = read_chk;
	}
	public int getS_delete_chk() {
		return s_delete_chk;
	}
	public void setS_delete_chk(int s_delete_chk) {
		this.s_delete_chk = s_delete_chk;
	}
	public int getR_delete_chk() {
		return r_delete_chk;
	}
	public void setR_delete_chk(int r_delete_chk) {
		this.r_delete_chk = r_delete_chk;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	@Override
	public String toString() {
		return "NoteVO [bno=" + bno + ", s_id=" + s_id + ", r_id=" + r_id + ", s_time=" + s_time + ", content="
				+ content + ", read_chk=" + read_chk + ", s_delete_chk=" + s_delete_chk + ", r_delete_chk="
				+ r_delete_chk + ", pno=" + pno + ", confirm=" + confirm + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
}
