package com.dev.pilafix.admin.complaints;

import java.util.Date;

public class ComplaintsVO {
	private int cpCode;
	private int cpTargetPostNumber;
	private String cpTargetPostType;
	private int targetWriterMemberCode;
	private int blamerMemberCode;
	private Date cpDate;
	private String blamerIp;
	public int getCpCode() {
		return cpCode;
	}
	public void setCpCode(int cpCode) {
		this.cpCode = cpCode;
	}
	public int getCpTargetPostNumber() {
		return cpTargetPostNumber;
	}
	public void setCpTargetPostNumber(int cpTargetPostNumber) {
		this.cpTargetPostNumber = cpTargetPostNumber;
	}
	public String getCpTargetPostType() {
		return cpTargetPostType;
	}
	public void setCpTargetPostType(String cpTargetPostType) {
		this.cpTargetPostType = cpTargetPostType;
	}
	public int getTargetWriterMemberCode() {
		return targetWriterMemberCode;
	}
	public void setTargetWriterMemberCode(int targetWriterMemberCode) {
		this.targetWriterMemberCode = targetWriterMemberCode;
	}
	public int getBlamerMemberCode() {
		return blamerMemberCode;
	}
	public void setBlamerMemberCode(int blamerMemberCode) {
		this.blamerMemberCode = blamerMemberCode;
	}
	public Date getCpDate() {
		return cpDate;
	}
	public void setCpDate(Date cpDate) {
		this.cpDate = cpDate;
	}
	public String getBlamerIp() {
		return blamerIp;
	}
	public void setBlamerIp(String blamerIp) {
		this.blamerIp = blamerIp;
	}
	@Override
	public String toString() {
		return "ComplaintsVO [cpCode=" + cpCode + ", cpTargetPostNumber=" + cpTargetPostNumber + ", cpTargetPostType="
				+ cpTargetPostType + ", targetWriterMemberCode=" + targetWriterMemberCode + ", blamerMemberCode="
				+ blamerMemberCode + ", cpDate=" + cpDate + ", blamerIp=" + blamerIp + "]";
	}
	
	
	
	
}
