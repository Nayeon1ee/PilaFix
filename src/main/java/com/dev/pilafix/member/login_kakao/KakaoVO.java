package com.dev.pilafix.member.login_kakao;

public class KakaoVO {

	private String K_name; 
	private String K_email;
	public String getK_name() {
		return K_name;
	}
	public void setK_Name(String k_name) {
		K_name = k_name;
	}
	public String getK_email() {
		return K_email;
	}
	public void setK_email(String k_email) {
		K_email = k_email;
	}
	
	@Override
	public String toString() {
		return "KakaoVO [K_name=" + K_name + ", K_email=" + K_email + "]";
	} 
	
	
	
	
}
