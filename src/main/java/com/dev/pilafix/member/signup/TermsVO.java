package com.dev.pilafix.member.signup;

public class TermsVO {
	private String tmName;
	private String tmDetail;
	private boolean tmRequiredYn;//필수면 Y 선택이면 N
	private boolean tmOpenYn;
	public String getTmName() {
		return tmName;
	}
	public void setTmName(String tmName) {
		this.tmName = tmName;
	}
	public String getTmDetail() {
		return tmDetail;
	}
	public void setTmDetail(String tmDetail) {
		this.tmDetail = tmDetail;
	}
	public boolean isTmRequiredYn() {
		return tmRequiredYn;
	}
	public void setTmRequiredYn(boolean tmRequiredYn) {
		this.tmRequiredYn = tmRequiredYn;
	}
	public boolean isTmOpenYn() {
		return tmOpenYn;
	}
	public void setTmOpenYn(boolean tmOpenYn) {
		this.tmOpenYn = tmOpenYn;
	}
	@Override
	public String toString() {
		return "TermsVO [tmName=" + tmName + ", tmDetail=" + tmDetail + ", tmRequiredYn=" + tmRequiredYn + ", tmOpenYn="
				+ tmOpenYn + "]";
	}
	
	
	
	
}