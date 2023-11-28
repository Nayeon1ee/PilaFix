package com.dev.pilafix.member.reserve;

import java.sql.Date;

/**
 * 
 * 예약/예약 취소 시 TBL_CST에 저장된 각 개인/그룹 수강권 활용을 위한 VO 
 * 
 * @author ny
 *
 */
public class UsingTicketVO {
	private int csMemberCode; 
	private String csName; 
    private String ticketCode;
    private String ticketName;
    private int ticketRemainingCount;
    private Date ticketStartDate;
    private Date ticketExpiryDate;
    private boolean ticketExpiryYn;
    
	public int getCsMemberCode() {
		return csMemberCode;
	}
	public void setCsMemberCode(int csMemberCode) {
		this.csMemberCode = csMemberCode;
	}
	public String getCsName() {
		return csName;
	}
	public void setCsName(String csName) {
		this.csName = csName;
	}
	public String getTicketCode() {
		return ticketCode;
	}
	public void setTicketCode(String ticketCode) {
		this.ticketCode = ticketCode;
	}
	public String getTicketName() {
		return ticketName;
	}
	public void setTicketName(String ticketName) {
		this.ticketName = ticketName;
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
		return "UsingTicketVO [csMemberCode=" + csMemberCode + ", csName=" + csName + ", ticketCode=" + ticketCode
				+ ", ticketName=" + ticketName + ", ticketRemainingCount=" + ticketRemainingCount + ", ticketStartDate="
				+ ticketStartDate + ", ticketExpiryDate=" + ticketExpiryDate + ", ticketExpiryYn=" + ticketExpiryYn
				+ "]";
	}
    
    

}
