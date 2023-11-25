package com.dev.pilafix.member.ticket;

import java.sql.Timestamp;

public class MemberTicketVO {
	private String paId; // 결제번호
	private String ticketCode; // 수강권코드
	private int paAmount; // 결제금액
	private int memberCode; // 회원코드
	private String paMethod; // 결제방식
	private long paymentDateTime; // 결제일시 (유닉스 타임스탬프로 들어온 값 받는 것)
	private String paDateTime; // 결제일시 (유닉스로 들어온 값 timestamp타입으로 변환)
	
	
	
	public String getPaId() {
		return paId;
	}
	public void setPaId(String paId) {
		this.paId = paId;
	}
	public String getTicketCode() {
		return ticketCode;
	}
	public void setTicketCode(String ticketCode) {
		this.ticketCode = ticketCode;
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
	@Override
	public String toString() {
		return "MemberTicketVO [paId=" + paId + ", ticketCode=" + ticketCode + ", paAmount=" + paAmount
				+ ", memberCode=" + memberCode + ", paMethod=" + paMethod + ", paymentDateTime=" + paymentDateTime
				+ ", paDateTime=" + paDateTime  + "]";
	}
	
	
	
	
	
	
	
	
}
