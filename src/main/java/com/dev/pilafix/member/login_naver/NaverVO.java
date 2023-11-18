package com.dev.pilafix.member.login_naver;

import java.sql.Date;

public class NaverVO {
	private String email;
	private String birthday;
	private String gender;
	private String mobile;
	private String name;
	private String birthyear;
	private String num1;
	private String num2;
	private String num3;
	private Date birth;
	private String nGender;
	private String chooseRole;
	
	
	
	public String getChooseRole() {
		return chooseRole;
	}
	public void setChooseRole(String chooseRole) {
		this.chooseRole = chooseRole;
	}
	public String getNum1() {
		return num1;
	}
	public void setNum1(String num1) {
		this.num1 = num1;
	}
	public String getNum2() {
		return num2;
	}
	public void setNum2(String num2) {
		this.num2 = num2;
	}
	public String getNum3() {
		return num3;
	}
	public void setNum3(String num3) {
		this.num3 = num3;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getnGender() {
		return nGender;
	}
	public void setnGender(String nGender) {
		this.nGender = nGender;
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
				+ ", name=" + name + ", birthyear=" + birthyear + ", num1=" + num1 + ", num2=" + num2 + ", num3=" + num3
				+ ", birth=" + birth + ", nGender=" + nGender + ", chooseRole=" + chooseRole + "]";
	}
	
	
	
	
	
	
	
	
	

}
