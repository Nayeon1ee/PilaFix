package com.dev.pilafix.member.signup;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;



public class MemberVO {
	
	private String csEmailId; //아이디
	private String csPassword; //비번
	private String csName; //이름
	private int csMemberCode; //회원코드
	private String csRoleCode; //권한코드
	private String csPhoneNumber1;
	private String csPhoneNumber2;
	private String csPhoneNumber3;
	private Date csBirth; //생년월일
	private Timestamp csRegistrationDate; //가입일
	private String  csGenderMw;	 //성별
	private boolean csAgreementYn1; //약관동의
	private boolean csAgreementYn2; //약관동의
	private boolean csAgreementYn3; //약관동의
	private String csRegistraionType; //가입유형
	//비밀번호 확인 컬럼도 있어야하나?
	public String getCsEmailId() {
		return csEmailId;
	}
	public void setCsEmailId(String csEmailId) {
		this.csEmailId = csEmailId;
	}
	public String getCsPassword() {
		return csPassword;
	}
	public void setCsPassword(String csPassword) {
		this.csPassword = csPassword;
	}
	public String getCsName() {
		return csName;
	}
	public void setCsName(String csName) {
		this.csName = csName;
	}
	public int getCsMemberCode() {
		return csMemberCode;
	}
	public void setCsMemberCode(int csMemberCode) {
		this.csMemberCode = csMemberCode;
	}
	public String getCsRoleCode() {
		return csRoleCode;
	}
	public void setCsRoleCode(String csRoleCode) {
		this.csRoleCode = csRoleCode;
	}
	public String getCsPhoneNumber1() {
		return csPhoneNumber1;
	}
	public void setCsPhoneNumber1(String csPhoneNumber1) {
		this.csPhoneNumber1 = csPhoneNumber1;
	}
	public String getCsPhoneNumber2() {
		return csPhoneNumber2;
	}
	public void setCsPhoneNumber2(String csPhoneNumber2) {
		this.csPhoneNumber2 = csPhoneNumber2;
	}
	public String getCsPhoneNumber3() {
		return csPhoneNumber3;
	}
	public void setCsPhoneNumber3(String csPhoneNumber3) {
		this.csPhoneNumber3 = csPhoneNumber3;
	}
	
	public Date getCsBirth() {
		return csBirth;
	}
	public void setCsBirth(Date csBirth) {
		this.csBirth = csBirth;
	}
	public Timestamp getCsRegistrationDate() {
		return csRegistrationDate;
	}
	public void setCsRegistrationDate(Timestamp csRegistrationDate) {
		this.csRegistrationDate = csRegistrationDate;
	}

	public String getCsGenderMw() {
		return csGenderMw;
	}
	public void setCsGenderMw(String csGenderMw) {
		this.csGenderMw = csGenderMw;
	}
	public boolean isCsAgreementYn1() {
		return csAgreementYn1;
	}
	public void setCsAgreementYn1(boolean csAgreementYn1) {
		this.csAgreementYn1 = csAgreementYn1;
	}
	
	public boolean isCsAgreementYn2() {
		return csAgreementYn2;
	}
	public void setCsAgreementYn2(boolean csAgreementYn2) {
		this.csAgreementYn2 = csAgreementYn2;
	}
	public boolean isCsAgreementYn3() {
		return csAgreementYn3;
	}
	public void setCsAgreementYn3(boolean csAgreementYn3) {
		this.csAgreementYn3 = csAgreementYn3;
	}
	public String getCsRegistraionType() {
		return csRegistraionType;
	}
	public void setCsRegistraionType(String csRegistraionType) {
		this.csRegistraionType = csRegistraionType;
	}
	@Override
	public String toString() {
		return "MemberVO [csEmailId=" + csEmailId + ", csPassword=" + csPassword + ", csName=" + csName
				+ ", csMemberCode=" + csMemberCode + ", csRoleCode=" + csRoleCode + ", csPhoneNumber1=" + csPhoneNumber1
				+ ", csPhoneNumber2=" + csPhoneNumber2 + ", csPhoneNumber3=" + csPhoneNumber3 + ", csBirth=" + csBirth
				+ ", csRegistrationDate=" + csRegistrationDate + ", csGenderMw=" + csGenderMw + ", csAgreementYn1="
				+ csAgreementYn1 + ", csAgreementYn2=" + csAgreementYn2 + ", csAgreementYn3=" + csAgreementYn3
				+ ", csRegistraionType=" + csRegistraionType + "]";
	}

	
	
	
	
	
	
	
	
	

}
