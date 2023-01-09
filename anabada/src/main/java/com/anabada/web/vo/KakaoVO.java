package com.anabada.web.vo;

public class KakaoVO {

	private String nickname;
	private String account_email;
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAccount_email() {
		return account_email;
	}
	public void setAccount_email(String account_email) {
		this.account_email = account_email;
	}
	
	@Override
	public String toString() {
		return "KakaoVO [nickname=" + nickname + ", account_email=" + account_email + "]";
	}
}
