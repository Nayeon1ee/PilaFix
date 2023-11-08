package com.dev.pilafix.member.signup;

import java.sql.Timestamp;
import java.util.Date;

public class MemberVO {
	
	private String csEmailId; //���̵�
	private String csPassword; //���
	private String csName; //�̸�
	private int csMemberCode; //ȸ���ڵ�
	private String csRoleCode; //�����ڵ�
	private String csPhoneNumber1;
	private String csPhoneNumber2;
	private String csPhoneNumber3;
	private Date csBirth; //�������
	private Timestamp csRegistrationDate; //������
	private boolean csGenderMw;	 //����
	private boolean csAgreementYn; //�������
	private String csRegistraionType; //��������
	//��й�ȣ Ȯ�� �÷��� �־���ϳ�?
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
	public boolean isCsGenderMw() {
		return csGenderMw;
	}
	public void setCsGenderMw(boolean csGenderMw) {
		this.csGenderMw = csGenderMw;
	}
	public boolean isCsAgreementYn() {
		return csAgreementYn;
	}
	public void setCsAgreementYn(boolean csAgreementYn) {
		this.csAgreementYn = csAgreementYn;
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
				+ ", csRegistrationDate=" + csRegistrationDate + ", csGenderMw=" + csGenderMw + ", csAgreementYn="
				+ csAgreementYn + ", csRegistraionType=" + csRegistraionType + "]";
	}
	
	
	
	
	
	
	
	
	

}
