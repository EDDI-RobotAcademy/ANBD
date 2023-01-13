package com.anabada.web.vo;

public class NoteVO {

	private int n_bno;
	private String n_sender; // 보낸사람 id
	private String n_receiver; // 받는 사람 id
	private String n_s_time; // 보내는 시간
	private String n_content; // 내용
	private String n_read_chk; // 읽었는지 체크
	private int n_s_delete_chk; // 기본값이 1, 삭제하면 0 
	private int n_r_delete_chk; // 기본값이 1, 삭제하면 0
	private int n_rno; // 중고게시물 번호
	private String n_type; // 판매완료된 쪽지이면 review, 아니면 null
	public int getN_bno() {
		return n_bno;
	}
	public void setN_bno(int n_bno) {
		this.n_bno = n_bno;
	}
	public String getN_sender() {
		return n_sender;
	}
	public void setN_sender(String n_sender) {
		this.n_sender = n_sender;
	}
	public String getN_receiver() {
		return n_receiver;
	}
	public void setN_receiver(String n_receiver) {
		this.n_receiver = n_receiver;
	}
	public String getN_s_time() {
		return n_s_time;
	}
	public void setN_s_time(String n_s_time) {
		this.n_s_time = n_s_time;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_read_chk() {
		return n_read_chk;
	}
	public void setN_read_chk(String n_read_chk) {
		this.n_read_chk = n_read_chk;
	}
	public int getN_s_delete_chk() {
		return n_s_delete_chk;
	}
	public void setN_s_delete_chk(int n_s_delete_chk) {
		this.n_s_delete_chk = n_s_delete_chk;
	}
	public int getN_r_delete_chk() {
		return n_r_delete_chk;
	}
	public void setN_r_delete_chk(int n_r_delete_chk) {
		this.n_r_delete_chk = n_r_delete_chk;
	}
	public int getN_rno() {
		return n_rno;
	}
	public void setN_rno(int n_rno) {
		this.n_rno = n_rno;
	}
	public String getN_type() {
		return n_type;
	}
	public void setN_type(String n_type) {
		this.n_type = n_type;
	}
	@Override
	public String toString() {
		return "NoteVO [n_bno=" + n_bno + ", n_sender=" + n_sender + ", n_receiver=" + n_receiver + ", n_s_time="
				+ n_s_time + ", n_content=" + n_content + ", n_read_chk=" + n_read_chk + ", n_s_delete_chk="
				+ n_s_delete_chk + ", n_r_delete_chk=" + n_r_delete_chk + ", n_rno=" + n_rno + ", n_type=" + n_type
				+ "]";
	}
	
	
	
	
	
	
	
	
	
}
