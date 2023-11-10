package com.dev.pilafix.member.login;

import java.sql.Date;

public class MemberLoginVO {
	//센터 수강권 수업 예약 게시판들
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
	private boolean csAgreementYn;
	private String csRegistrationType;
	private String connectedCenterCode1;
	private String connectedCenterCode2;
	private String connectedCenterCode3;
	private String ticketCodePersonal1;
	private int ticketRemainingCountPersonal1;
	private Date ticketStartDatePersonal1;
	private Date ticketExpiryDatePersonal1;
	private boolean ticketExpiryYnPersonal1;
	private String ticketCodeGroup1;
	private int ticketRemainingCountGroup1;
	private Date ticketStartDateGroup1;
	private Date ticketExpiryDateGroup1;
	private boolean ticketExpiryYnGroup1;


}
