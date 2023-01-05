package com.anabada.web.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class JobVO {

	private String id;
	private int j_bno; 
	private String j_title;
	private String j_company;
	private String j_addr1;
	private String j_addr2;
	private String j_cate;
	private String j_method; // 시급, 일급, 주급, 월급
	private String j_pay; // 9160원, 300만원
	private String j_term; // 하루, 3개월 등
	private String j_day; // 월-일요일
	private int j_start; // 알바시작 시간
	private int j_end; // 알바끝나는 시간
	private String j_content; // 내용
	private String j_img; // 사진
	private Date j_date; // 등록 날짜
	private int j_heart; // 찜개수
	private MultipartFile j_uploadImg; // 멀티파일 객체. 데이터베이스에는 저장이 안된다.
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getJ_bno() {
		return j_bno;
	}
	public void setJ_bno(int j_bno) {
		this.j_bno = j_bno;
	}
	public String getJ_title() {
		return j_title;
	}
	public void setJ_title(String j_title) {
		this.j_title = j_title;
	}
	public String getJ_addr1() {
		return j_addr1;
	}
	public void setJ_addr1(String j_addr1) {
		this.j_addr1 = j_addr1;
	}
	public String getJ_addr2() {
		return j_addr2;
	}
	public void setJ_addr2(String j_addr2) {
		this.j_addr2 = j_addr2;
	}
	public String getJ_cate() {
		return j_cate;
	}
	public void setJ_cate(String j_cate) {
		this.j_cate = j_cate;
	}
	public String getJ_method() {
		return j_method;
	}
	public void setJ_method(String j_method) {
		this.j_method = j_method;
	}
	public String getJ_pay() {
		return j_pay;
	}
	public void setJ_pay(String j_pay) {
		this.j_pay = j_pay;
	}
	public String getJ_term() {
		return j_term;
	}
	public void setJ_term(String j_term) {
		this.j_term = j_term;
	}
	public String getJ_day() {
		System.out.println("get하는 day: " + j_day);
		return j_day;
	}
	public void setJ_day(String j_day) {
		System.out.println("인덱스 0:"+ j_day.charAt(0));
		if(j_day.charAt(0) == ',') {
			this.j_day = j_day.replaceFirst(",", "");
		}else {
			this.j_day = j_day;
		}
	}
	public int getJ_start() {
		return j_start;
	}
	public void setJ_start(int j_start) {
		this.j_start = j_start;
	}
	public int getJ_end() {
		return j_end;
	}
	public void setJ_end(int j_end) {
		this.j_end = j_end;
	}
	public String getJ_content() {
		return j_content;
	}
	public void setJ_content(String j_content) {
		this.j_content = j_content;
	}
	
	public Date getJ_date() {
		return j_date;
	}
	public void setJ_date(Date j_date) {
		this.j_date = j_date;
	}
	public int getJ_heart() {
		return j_heart;
	}
	public void setJ_heart(int j_heart) {
		this.j_heart = j_heart;
	}
	
	
	public String getJ_company() {
		return j_company;
	}
	public void setJ_company(String j_company) {
		this.j_company = j_company;
	}
	
	
	public String getJ_img() {
		if(j_img == null || j_img == "") { // 이미지 선택안했을 떄
			this.j_img = ""; // db에 null로 저장됨
		}
		 
		return j_img;
	}
	public void setJ_img(String j_img) {
		this.j_img = j_img;
	}
	
	public MultipartFile getJ_uploadImg() {
		return j_uploadImg;
	}
	public void setJ_uploadImg(MultipartFile j_uploadImg) {
		this.j_uploadImg = j_uploadImg;
	}
	
	@Override
	public String toString() {
		return "JobVO [id=" + id + ", j_bno=" + j_bno + ", j_title=" + j_title + ", j_company=" + j_company
				+ ", j_addr1=" + j_addr1 + ", j_addr2=" + j_addr2 + ", j_cate=" + j_cate + ", j_method=" + j_method
				+ ", j_pay=" + j_pay + ", j_term=" + j_term + ", j_day=" + j_day + ", j_start=" + j_start + ", j_end="
				+ j_end + ", j_content=" + j_content + ", j_img=" + j_img + ", j_date=" + j_date + ", j_heart="
				+ j_heart + ", j_uploadImg=" + j_uploadImg + "]";
	}
	
	
	

}
