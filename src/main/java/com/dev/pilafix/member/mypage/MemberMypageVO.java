package com.dev.pilafix.member.mypage;

import java.sql.Timestamp;

public class MemberMypageVO {
	private String paId;
	private String paMethod;
	private Timestamp paDateTime;
	private int paAmount;
	private String ticketCode;
	private int memberCode;
	private boolean paCancelYn;
	private String tkName;
	private String tkLessonType;
	private int tkUsageNumMonth;
	private int tkUsageCount;
	private String tkPriceAddDot; 
	private int centerCode;
	private int tkCapacity;
	private String centerName;
	private String adminName;
	
	
	
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getPaId() {
		return paId;
	}
	public void setPaId(String paId) {
		this.paId = paId;
	}
	public String getPaMethod() {
		return paMethod;
	}
	public void setPaMethod(String paMethod) {
		this.paMethod = paMethod;
	}
	public Timestamp getPaDateTime() {
		return paDateTime;
	}
	public void setPaDateTime(Timestamp paDateTime) {
		this.paDateTime = paDateTime;
	}
	public int getPaAmount() {
		return paAmount;
	}
	public void setPaAmount(int paAmount) {
		this.paAmount = paAmount;
	}
	public String getTicketCode() {
		return ticketCode;
	}
	public void setTicketCode(String ticketCode) {
		this.ticketCode = ticketCode;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public boolean isPaCancelYn() {
		return paCancelYn;
	}
	public void setPaCancelYn(boolean paCancelYn) {
		this.paCancelYn = paCancelYn;
	}
	public String getTkName() {
		return tkName;
	}
	public void setTkName(String tkName) {
		this.tkName = tkName;
	}
	public String getTkLessonType() {
		return tkLessonType;
	}
	public void setTkLessonType(String tkLessonType) {
		this.tkLessonType = tkLessonType;
	}
	public int getTkUsageNumMonth() {
		return tkUsageNumMonth;
	}
	public void setTkUsageNumMonth(int tkUsageNumMonth) {
		this.tkUsageNumMonth = tkUsageNumMonth;
	}
	public int getTkUsageCount() {
		return tkUsageCount;
	}
	public void setTkUsageCount(int tkUsageCount) {
		this.tkUsageCount = tkUsageCount;
	}
	public String getTkPriceAddDot() {
		return tkPriceAddDot;
	}
	public void setTkPriceAddDot(String tkPriceAddDot) {
		this.tkPriceAddDot = tkPriceAddDot;
	}
	public int getCenterCode() {
		return centerCode;
	}
	public void setCenterCode(int centerCode) {
		this.centerCode = centerCode;
	}
	public int getTkCapacity() {
		return tkCapacity;
	}
	public void setTkCapacity(int tkCapacity) {
		this.tkCapacity = tkCapacity;
	}
	public String getCenterName() {
		return centerName;
	}
	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}
	@Override
	public String toString() {
		return "MemberMypageVO [paId=" + paId + ", paMethod=" + paMethod + ", paDateTime=" + paDateTime + ", paAmount="
				+ paAmount + ", ticketCode=" + ticketCode + ", memberCode=" + memberCode + ", paCancelYn=" + paCancelYn
				+ ", tkName=" + tkName + ", tkLessonType=" + tkLessonType + ", tkUsageNumMonth=" + tkUsageNumMonth
				+ ", tkUsageCount=" + tkUsageCount + ", tkPriceAddDot=" + tkPriceAddDot + ", centerCode=" + centerCode
				+ ", tkCapacity=" + tkCapacity + ", centerName=" + centerName + "]";
	}
	
	

}
