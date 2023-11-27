package com.dev.pilafix.member.reserve;

import java.sql.Date;

public class ReservVO {

	private String rsCode;
	private int memberCode;
	private String usedTicketCode;
	private int centerCode;
	private String lessonCode;
	private Date rsDatetime;
	private boolean rsCancelYn;
	public String getRsCode() {
		return rsCode;
	}
	public void setRsCode(String rsCode) {
		this.rsCode = rsCode;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public String getUsedTicketCode() {
		return usedTicketCode;
	}
	public void setUsedTicketCode(String usedTicketCode) {
		this.usedTicketCode = usedTicketCode;
	}
	public int getCenterCode() {
		return centerCode;
	}
	public void setCenterCode(int centerCode) {
		this.centerCode = centerCode;
	}
	public String getLessonCode() {
		return lessonCode;
	}
	public void setLessonCode(String lessonCode) {
		this.lessonCode = lessonCode;
	}
	public Date getRsDatetime() {
		return rsDatetime;
	}
	public void setRsDatetime(Date rsDatetime) {
		this.rsDatetime = rsDatetime;
	}
	public boolean isRsCancelYn() {
		return rsCancelYn;
	}
	public void setRsCancelYn(boolean rsCancelYn) {
		this.rsCancelYn = rsCancelYn;
	}
	@Override
	public String toString() {
		return "ReservVO [rsCode=" + rsCode + ", memberCode=" + memberCode + ", usedTicketCode=" + usedTicketCode
				+ ", centerCode=" + centerCode + ", lessonCode=" + lessonCode + ", rsDatetime=" + rsDatetime
				+ ", rsCancelYn=" + rsCancelYn + "]";
	}
	
	



}
