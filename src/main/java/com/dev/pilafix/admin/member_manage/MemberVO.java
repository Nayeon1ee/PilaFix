package com.dev.pilafix.admin.member_manage;

import java.sql.Date;

public class MemberVO {

	private int csMemberCode;
    private String csRoleCode;
    private String csEmailId;
    private String csPassword;
    private String csName;
    private String csPhoneNumber1;
    private String csPhoneNumber2;
    private String csPhoneNumber3;
    private Date csRegistrationDate;
    private Date csBirth;
    private String csGenderMw;
    private boolean csDeleteYn;
    private boolean csAgreementYn1;
    private boolean csAgreementYn2;
    private boolean csAgreementYn3;
    private String csRegistrationType;
    private String connectedCenterCode1;
    private String connectedCenterCode2;
    private String connectedCenterCode3;
	
	private String connectedCenterName1;
	private String connectedCenterName2;
	private String connectedCenterName3;
	
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
	public Date getCsRegistrationDate() {
		return csRegistrationDate;
	}
	public void setCsRegistrationDate(Date csRegistrationDate) {
		this.csRegistrationDate = csRegistrationDate;
	}
	public Date getCsBirth() {
		return csBirth;
	}
	public void setCsBirth(Date csBirth) {
		this.csBirth = csBirth;
	}
	public String getCsGenderMw() {
		return csGenderMw;
	}
	public void setCsGenderMw(String csGenderMw) {
		this.csGenderMw = csGenderMw;
	}
	public boolean isCsDeleteYn() {
		return csDeleteYn;
	}
	public void setCsDeleteYn(boolean csDeleteYn) {
		this.csDeleteYn = csDeleteYn;
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
	public String getCsRegistrationType() {
		return csRegistrationType;
	}
	public void setCsRegistrationType(String csRegistrationType) {
		this.csRegistrationType = csRegistrationType;
	}
	public String getConnectedCenterCode1() {
		return connectedCenterCode1;
	}
	public void setConnectedCenterCode1(String connectedCenterCode1) {
		this.connectedCenterCode1 = connectedCenterCode1;
	}
	public String getConnectedCenterCode2() {
		return connectedCenterCode2;
	}
	public void setConnectedCenterCode2(String connectedCenterCode2) {
		this.connectedCenterCode2 = connectedCenterCode2;
	}
	public String getConnectedCenterCode3() {
		return connectedCenterCode3;
	}
	public void setConnectedCenterCode3(String connectedCenterCode3) {
		this.connectedCenterCode3 = connectedCenterCode3;
	}
	public String getConnectedCenterName1() {
		return connectedCenterName1;
	}
	public void setConnectedCenterName1(String connectedCenterName1) {
		this.connectedCenterName1 = connectedCenterName1;
	}
	public String getConnectedCenterName2() {
		return connectedCenterName2;
	}
	public void setConnectedCenterName2(String connectedCenterName2) {
		this.connectedCenterName2 = connectedCenterName2;
	}
	public String getConnectedCenterName3() {
		return connectedCenterName3;
	}
	public void setConnectedCenterName3(String connectedCenterName3) {
		this.connectedCenterName3 = connectedCenterName3;
	}
	@Override
	public String toString() {
		return "MemberVO [csMemberCode=" + csMemberCode + ", csRoleCode=" + csRoleCode + ", csEmailId=" + csEmailId
				+ ", csPassword=" + csPassword + ", csName=" + csName + ", csPhoneNumber1=" + csPhoneNumber1
				+ ", csPhoneNumber2=" + csPhoneNumber2 + ", csPhoneNumber3=" + csPhoneNumber3 + ", csRegistrationDate="
				+ csRegistrationDate + ", csBirth=" + csBirth + ", csGenderMw=" + csGenderMw + ", csDeleteYn="
				+ csDeleteYn + ", csAgreementYn1=" + csAgreementYn1 + ", csAgreementYn2=" + csAgreementYn2
				+ ", csAgreementYn3=" + csAgreementYn3 + ", csRegistrationType=" + csRegistrationType
				+ ", connectedCenterCode1=" + connectedCenterCode1 + ", connectedCenterCode2=" + connectedCenterCode2
				+ ", connectedCenterCode3=" + connectedCenterCode3 + ", connectedCenterName1=" + connectedCenterName1
				+ ", connectedCenterName2=" + connectedCenterName2 + ", connectedCenterName3=" + connectedCenterName3
				+ "]";
	}
	
	
	
}
