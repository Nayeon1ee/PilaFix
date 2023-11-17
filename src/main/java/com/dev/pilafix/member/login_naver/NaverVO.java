package com.dev.pilafix.member.login_naver;

import java.sql.Date;

public class NaverVO {
	private String email;
	private String birthday;
	private String gender;
	private String mobile;
	private String name;
	private String birthyear;
	private String roleCode;
	
	
	
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthyear() {
		return birthyear;
	}
	public void setBirthyear(String birthyear) {
		this.birthyear = birthyear;
	}
	@Override
	public String toString() {
		return "NaverVO [email=" + email + ", birthday=" + birthday + ", gender=" + gender + ", mobile=" + mobile
				+ ", name=" + name + ", birthyear=" + birthyear + ", roleCode=" + roleCode + "]";
	}
	
	
	
	
	
	
	

}
