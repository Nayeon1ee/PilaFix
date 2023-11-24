package com.dev.pilafix.member.ticket;

import java.sql.Timestamp;

public class MemberTicketVO {
	private String paId; // 결제번호
	private String ticketCode; // 수강권코드
	private String paAmount; // 결제금액
	private String memberCode; // 회원코드
	private String paMethod; // 결제방식
	private String paymentDateTime; // 결제일시 (유닉스 타임스탬프로 들어온 값 받는 것)
	private Timestamp paDateTime; // 결제일시 (유닉스 타임스탬프로 들어온 값 받는 것)
	
	
	public String getPaymentDateTime() {
		return paymentDateTime;
	}
	public void setPaymentDateTime(String paymentDateTime) {
		this.paymentDateTime = paymentDateTime;
	}
	public void setPaDateTime(Timestamp paDateTime) {
		this.paDateTime = paDateTime;
	}
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
	public String getPaAmount() {
		return paAmount;
	}
	public void setPaAmount(String paAmount) {
		this.paAmount = paAmount;
	}
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public String getPaMethod() {
		return paMethod;
	}
	public void setPaMethod(String paMethod) {
		this.paMethod = paMethod;
	}
	@Override
	public String toString() {
		return "MemberTicketVO [paId=" + paId + ", ticketCode=" + ticketCode + ", paAmount=" + paAmount
				+ ", memberCode=" + memberCode + ", paMethod=" + paMethod + ", paymentDateTime=" + paymentDateTime
				+ ", paDateTime=" + paDateTime + "]";
	}
	
	
	
	
	
}
