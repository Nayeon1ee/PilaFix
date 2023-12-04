package com.dev.pilafix.admin.member_trainer_manage;

import java.sql.Date;

public class PaymentHistoryVO {
	
	private String paId;
	private String ticketCode;
	private int paAmount;
	private int memberCode;
	private String paMethod;
	private Date paDatetime;
	private String centerName;
	private String ticketName; //ȭ�� ��� �� 
	private boolean paCancelYn;
	
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
	public Date getPaDatetime() {
		return paDatetime;
	}
	public void setPaDatetime(Date paDatetime) {
		this.paDatetime = paDatetime;
	}
	public String getCenterName() {
		return centerName;
	}
	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}
	public String getTicketName() {
		return ticketName;
	}
	public void setTicketName(String ticketName) {
		this.ticketName = ticketName;
	}
	
	public boolean isPaCancelYn() {
		return paCancelYn;
	}
	public void setPaCancelYn(boolean paCancelYn) {
		this.paCancelYn = paCancelYn;
	}
	@Override
	public String toString() {
		return "PaymentHistoryVO [paId=" + paId + ", ticketCode=" + ticketCode + ", paAmount=" + paAmount
				+ ", memberCode=" + memberCode + ", paMethod=" + paMethod + ", paDatetime=" + paDatetime
				+ ", centerName=" + centerName + ", ticketName=" + ticketName + "]";
	}

	
}
