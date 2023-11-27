package com.dev.pilafix.member.ticket;

import java.sql.Date;
import java.sql.Timestamp;

public class MemberTicketVO {
	private String paId; // 결제번호
	private int paAmount; // 결제금액
	private int memberCode; // 회원코드
	private String paMethod; // 결제방식
	private long paymentDateTime; // 결제일시 (유닉스 타임스탬프로 들어온 값 받는 것)
	private String paDateTime; // 결제일시 (유닉스로 들어온 값 timestamp타입으로 변환)
	
	private String tkLessonType; // 수강권 수업 타입
	private String ticketCode; // 수강권코드
	private int ticketRemainingCount; // 수강권잔여횟수
	private Date ticketStartDate; // 수강권시작일자
	private Date ticketExpiryDate; // 수강권만료일자
	private boolean ticketExpiryYn; // 수강권만료여부
	
	
	public String getPaId() {
		return paId;
	}
	public void setPaId(String paId) {
		this.paId = paId;
	}
	public int getPaAmount() {
		return paAmount;
	}
	public void setPaAmount(int paAmount) {
		this.paAmount = paAmount;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public String getPaMethod() {
		return paMethod;
	}
	public void setPaMethod(String paMethod) {
		this.paMethod = paMethod;
	}
	public long getPaymentDateTime() {
		return paymentDateTime;
	}
	public void setPaymentDateTime(long paymentDateTime) {
		this.paymentDateTime = paymentDateTime;
	}
	public String getPaDateTime() {
		return paDateTime;
	}
	public void setPaDateTime(String paDateTime) {
		this.paDateTime = paDateTime;
	}
	public String getTkLessonType() {
		return tkLessonType;
	}
	public void setTkLessonType(String tkLessonType) {
		this.tkLessonType = tkLessonType;
	}
	public String getTicketCode() {
		return ticketCode;
	}
	public void setTicketCode(String ticketCode) {
		this.ticketCode = ticketCode;
	}
	public int getTicketRemainingCount() {
		return ticketRemainingCount;
	}
	public void setTicketRemainingCount(int ticketRemainingCount) {
		this.ticketRemainingCount = ticketRemainingCount;
	}
	public Date getTicketStartDate() {
		return ticketStartDate;
	}
	public void setTicketStartDate(Date ticketStartDate) {
		this.ticketStartDate = ticketStartDate;
	}
	public Date getTicketExpiryDate() {
		return ticketExpiryDate;
	}
	public void setTicketExpiryDate(Date ticketExpiryDate) {
		this.ticketExpiryDate = ticketExpiryDate;
	}
	public boolean isTicketExpiryYn() {
		return ticketExpiryYn;
	}
	public void setTicketExpiryYn(boolean ticketExpiryYn) {
		this.ticketExpiryYn = ticketExpiryYn;
	}
	@Override
	public String toString() {
		return "MemberTicketVO [paId=" + paId + ", paAmount=" + paAmount + ", memberCode=" + memberCode + ", paMethod="
				+ paMethod + ", paymentDateTime=" + paymentDateTime + ", paDateTime=" + paDateTime + ", tkLessonType="
				+ tkLessonType + ", ticketCode=" + ticketCode + ", ticketRemainingCount=" + ticketRemainingCount
				+ ", ticketStartDate=" + ticketStartDate + ", ticketExpiryDate=" + ticketExpiryDate
				+ ", ticketExpiryYn=" + ticketExpiryYn + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
