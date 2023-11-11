package com.dev.pilafix.member.login;

import java.sql.Date;

public class MemberLoginVO {
	// 센터 수강권 수업 예약 기타게시판테이블들과 연동되어야함
	// 회원이 작성한 게시글,댓글?
	private int csMemberCode; // 회원코드 : 회원이면시퀀스번호 2000부터 시작 / 강사면 시퀀스 8000부터시작
	private String csRoleCode; // 권한코드
	private String csEmailId; // 이메일아이디
	private String csPassword; // 비밀번호 : 암호화
	private String csName; // 이름
	private String csPhoneNumber1; // 연락처1
	private String csPhoneNumber2; // 연락처2
	private String csPhoneNumber3; // 연락처3
	private Date csRegistrationDate; // 가입일자 : DEFAULT NOW()
	private Date csBirth; // 생년월일 : 소셜 로그인의 경우 값이 없을 수 있음 
	private String csGenderMw; // 성별 : 소셜 로그인의 경우 값이 없을 수 있음 
	private boolean csDeleteYn; // 탈퇴여부
	private boolean csAgreementYn; // 약관동의여부
	private String csRegistrationType; // 가입유형 : 일반/카카오/네이버/구글
	private String connectedCenterCode1; // 현재연동센터코드1 : 미연동 상태일 수 있음
	private String connectedCenterCode2; // 현재연동센터코드2 : 미연동 상태일 수 있음
	private String connectedCenterCode3; // 현재연동센터코드3 : 미연동 상태일 수 있음
	private String ticketCodePersonal1; // 보유수강권코드_개인 : 보유한 수강권이 없을 수 있음/수강권 결제 완료 시 해당 컬럼 업데이트  
	private int ticketRemainingCountPersonal1; // 보유수강권잔여횟수_개인 : 수강권 결제 완료 시 해당 컬럼 업데이트  
	private Date ticketStartDatePersonal1; // 보유수강권시작일자_개인
	private Date ticketExpiryDatePersonal1; // 보유수강권만료일자_개인 : 수강권 결제 완료 시 해당 컬럼 업데이트 / 결제된 날로부터 해당 수강권의 기간 계산해서 넣어야 함 
	private boolean ticketExpiryYnPersonal1; // 보유수강권만료여부_개인 : 사용중일 때는 N, 만료 시에 Y (즉, 기존 수강권 구매 후 만료-> 재구매하지 않은 고객)
	private String ticketCodeGroup1; // 보유수강권코드_그룹
	private int ticketRemainingCountGroup1; // 보유수강권잔여횟수_그룹
	private Date ticketStartDateGroup1; // 보유수강권시작일자_그룹
	private Date ticketExpiryDateGroup1; // 보유수강권만료일자_그룹
	private boolean ticketExpiryYnGroup1; // 보유수강권만료여부_그룹
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
	public boolean isCsAgreementYn() {
		return csAgreementYn;
	}
	public void setCsAgreementYn(boolean csAgreementYn) {
		this.csAgreementYn = csAgreementYn;
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
	@Override
	public String toString() {
		return "MemberLoginVO [csMemberCode=" + csMemberCode + ", csRoleCode=" + csRoleCode + ", csEmailId=" + csEmailId
				+ ", csPassword=" + csPassword + ", csName=" + csName + ", csPhoneNumber1=" + csPhoneNumber1
				+ ", csPhoneNumber2=" + csPhoneNumber2 + ", csPhoneNumber3=" + csPhoneNumber3 + ", csRegistrationDate="
				+ csRegistrationDate + ", csBirth=" + csBirth + ", csGenderMw=" + csGenderMw + ", csDeleteYn="
				+ csDeleteYn + ", csAgreementYn=" + csAgreementYn + ", csRegistrationType=" + csRegistrationType
				+ ", connectedCenterCode1=" + connectedCenterCode1 + ", connectedCenterCode2=" + connectedCenterCode2
				+ ", connectedCenterCode3=" + connectedCenterCode3 + ", ticketCodePersonal1=" + ticketCodePersonal1
				+ ", ticketRemainingCountPersonal1=" + ticketRemainingCountPersonal1 + ", ticketStartDatePersonal1="
				+ ticketStartDatePersonal1 + ", ticketExpiryDatePersonal1=" + ticketExpiryDatePersonal1
				+ ", ticketExpiryYnPersonal1=" + ticketExpiryYnPersonal1 + ", ticketCodeGroup1=" + ticketCodeGroup1
				+ ", ticketRemainingCountGroup1=" + ticketRemainingCountGroup1 + ", ticketStartDateGroup1="
				+ ticketStartDateGroup1 + ", ticketExpiryDateGroup1=" + ticketExpiryDateGroup1
				+ ", ticketExpiryYnGroup1=" + ticketExpiryYnGroup1 + "]";
	}
	
	

}
