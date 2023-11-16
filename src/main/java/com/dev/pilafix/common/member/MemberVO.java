package com.dev.pilafix.common.member;

import java.sql.Date;

public class MemberVO {
	
	private int csMemberCode; // ȸ���ڵ� : ȸ���̸��������ȣ 2000���� ���� / ����� ������ 8000���ͽ���
	private String csRoleCode; // �����ڵ�
	private String csEmailId; // �̸��Ͼ��̵�
	private String csPassword; // ��й�ȣ : ��ȣȭ
	private String csName; // �̸�
	private String csPhoneNumber1; // ����ó1
	private String csPhoneNumber2; // ����ó2
	private String csPhoneNumber3; // ����ó3
	private Date csRegistrationDate; // �������� : DEFAULT NOW()
	private Date csBirth; // ������� : �Ҽ� �α����� ��� ���� ���� �� ���� 
	private String csGenderMw; // ���� : �Ҽ� �α����� ��� ���� ���� �� ���� 
	private boolean csDeleteYn; // Ż�𿩺�
	private boolean csAgreementYn1; //�������1
	private boolean csAgreementYn2; //�������2
	private boolean csAgreementYn3; //�������3
	private String csRegistrationType; // �������� : �Ϲ�/īī��/���̹�/����
	private int connectedCenterCode1; // ���翬�������ڵ�1 : �̿��� ������ �� ����
	private int connectedCenterCode2; // ���翬�������ڵ�2 : �̿��� ������ �� ����
	private int connectedCenterCode3; // ���翬�������ڵ�3 : �̿��� ������ �� ����
	private String ticketCodePersonal1; // �����������ڵ�_���� : ������ �������� ���� �� ����/������ ���� �Ϸ� �� �ش� �÷� ������Ʈ  
	private int ticketRemainingCountPersonal1; // �����������ܿ�Ƚ��_���� : ������ ���� �Ϸ� �� �ش� �÷� ������Ʈ  
	private Date ticketStartDatePersonal1; // ���������ǽ�������_����
	private Date ticketExpiryDatePersonal1; // ���������Ǹ�������_���� : ������ ���� �Ϸ� �� �ش� �÷� ������Ʈ / ������ ���κ��� �ش� �������� �Ⱓ ����ؼ� �־�� �� 
	private boolean ticketExpiryYnPersonal1; // ���������Ǹ��Ῡ��_���� : ������� ���� N, ���� �ÿ� Y (��, ���� ������ ���� �� ����-> �籸������ ���� ��)
	private String ticketCodeGroup1; // �����������ڵ�_�׷�
	private int ticketRemainingCountGroup1; // �����������ܿ�Ƚ��_�׷�
	private Date ticketStartDateGroup1; // ���������ǽ�������_�׷�
	private Date ticketExpiryDateGroup1; // ���������Ǹ�������_�׷�
	private boolean ticketExpiryYnGroup1; // ���������Ǹ��Ῡ��_�׷�
	private String connectedCenterName1; //���� ���� �� (���� �ڵ�� �����ؼ� ������)
	private String connectedCenterName2; //���� ���� �� (���� �ڵ�� �����ؼ� ������)
	private String connectedCenterName3; //���� ���� �� (���� �ڵ�� �����ؼ� ������)
	
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
	public int getConnectedCenterCode1() {
		return connectedCenterCode1;
	}
	public void setConnectedCenterCode1(int connectedCenterCode1) {
		this.connectedCenterCode1 = connectedCenterCode1;
	}
	public int getConnectedCenterCode2() {
		return connectedCenterCode2;
	}
	public void setConnectedCenterCode2(int connectedCenterCode2) {
		this.connectedCenterCode2 = connectedCenterCode2;
	}
	public int getConnectedCenterCode3() {
		return connectedCenterCode3;
	}
	public void setConnectedCenterCode3(int connectedCenterCode3) {
		this.connectedCenterCode3 = connectedCenterCode3;
	}
	public String getTicketCodePersonal1() {
		return ticketCodePersonal1;
	}
	public void setTicketCodePersonal1(String ticketCodePersonal1) {
		this.ticketCodePersonal1 = ticketCodePersonal1;
	}
	public int getTicketRemainingCountPersonal1() {
		return ticketRemainingCountPersonal1;
	}
	public void setTicketRemainingCountPersonal1(int ticketRemainingCountPersonal1) {
		this.ticketRemainingCountPersonal1 = ticketRemainingCountPersonal1;
	}
	public Date getTicketStartDatePersonal1() {
		return ticketStartDatePersonal1;
	}
	public void setTicketStartDatePersonal1(Date ticketStartDatePersonal1) {
		this.ticketStartDatePersonal1 = ticketStartDatePersonal1;
	}
	public Date getTicketExpiryDatePersonal1() {
		return ticketExpiryDatePersonal1;
	}
	public void setTicketExpiryDatePersonal1(Date ticketExpiryDatePersonal1) {
		this.ticketExpiryDatePersonal1 = ticketExpiryDatePersonal1;
	}
	public boolean isTicketExpiryYnPersonal1() {
		return ticketExpiryYnPersonal1;
	}
	public void setTicketExpiryYnPersonal1(boolean ticketExpiryYnPersonal1) {
		this.ticketExpiryYnPersonal1 = ticketExpiryYnPersonal1;
	}
	public String getTicketCodeGroup1() {
		return ticketCodeGroup1;
	}
	public void setTicketCodeGroup1(String ticketCodeGroup1) {
		this.ticketCodeGroup1 = ticketCodeGroup1;
	}
	public int getTicketRemainingCountGroup1() {
		return ticketRemainingCountGroup1;
	}
	public void setTicketRemainingCountGroup1(int ticketRemainingCountGroup1) {
		this.ticketRemainingCountGroup1 = ticketRemainingCountGroup1;
	}
	public Date getTicketStartDateGroup1() {
		return ticketStartDateGroup1;
	}
	public void setTicketStartDateGroup1(Date ticketStartDateGroup1) {
		this.ticketStartDateGroup1 = ticketStartDateGroup1;
	}
	public Date getTicketExpiryDateGroup1() {
		return ticketExpiryDateGroup1;
	}
	public void setTicketExpiryDateGroup1(Date ticketExpiryDateGroup1) {
		this.ticketExpiryDateGroup1 = ticketExpiryDateGroup1;
	}
	public boolean isTicketExpiryYnGroup1() {
		return ticketExpiryYnGroup1;
	}
	public void setTicketExpiryYnGroup1(boolean ticketExpiryYnGroup1) {
		this.ticketExpiryYnGroup1 = ticketExpiryYnGroup1;
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
				+ ", connectedCenterCode3=" + connectedCenterCode3 + ", ticketCodePersonal1=" + ticketCodePersonal1
				+ ", ticketRemainingCountPersonal1=" + ticketRemainingCountPersonal1 + ", ticketStartDatePersonal1="
				+ ticketStartDatePersonal1 + ", ticketExpiryDatePersonal1=" + ticketExpiryDatePersonal1
				+ ", ticketExpiryYnPersonal1=" + ticketExpiryYnPersonal1 + ", ticketCodeGroup1=" + ticketCodeGroup1
				+ ", ticketRemainingCountGroup1=" + ticketRemainingCountGroup1 + ", ticketStartDateGroup1="
				+ ticketStartDateGroup1 + ", ticketExpiryDateGroup1=" + ticketExpiryDateGroup1
				+ ", ticketExpiryYnGroup1=" + ticketExpiryYnGroup1 + ", connectedCenterName1=" + connectedCenterName1
				+ ", connectedCenterName2=" + connectedCenterName2 + ", connectedCenterName3=" + connectedCenterName3
				+ "]";
	}
	
	
	
	
	
}
