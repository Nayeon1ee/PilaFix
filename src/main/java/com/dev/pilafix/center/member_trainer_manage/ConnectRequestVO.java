package com.dev.pilafix.center.member_trainer_manage;

import java.sql.Date;

public class ConnectRequestVO {
	
	private String crCode;
	private int centerCode;
	private int memberCode;
	private String memberName;
	private String memberPhone;
	private Date crReqDate;
	private String crConnectionYn;
	private String crConnectionDate;
	
	public String getCrCode() {
		return crCode;
	}
	public void setCrCode(String crCode) {
		this.crCode = crCode;
	}
	public int getCenterCode() {
		return centerCode;
	}
	public void setCenterCode(int centerCode) {
		this.centerCode = centerCode;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}	
	public Date getCrReqDate() {
		return crReqDate;
	}
	public void setCrReqDate(Date crReqDate) {
		this.crReqDate = crReqDate;
	}
	public String getCrConnectionYn() {
		return crConnectionYn;
	}
	public void setCrConnectionYn(String crConnectionYn) {
		this.crConnectionYn = crConnectionYn;
	}
	public String getCrConnectionDate() {
		return crConnectionDate;
	}
	public void setCrConnectionDate(String crConnectionDate) {
		this.crConnectionDate = crConnectionDate;
	}
	@Override
	public String toString() {
		return "ConnectRequestVO [crCode=" + crCode + ", centerCode=" + centerCode + ", memberCode=" + memberCode
				+ ", memberName=" + memberName + ", memberPhone=" + memberPhone + ", crReqDate=" + crReqDate
				+ ", crConnectionYn=" + crConnectionYn + ", crConnectionDate=" + crConnectionDate + ", getCrCode()="
				+ getCrCode() + ", getCenterCode()=" + getCenterCode() + ", getMemberCode()=" + getMemberCode()
				+ ", getMemberName()=" + getMemberName() + ", getMemberPhone()=" + getMemberPhone()
				+ ", getCrReqDate()=" + getCrReqDate() + ", getCrConnectionYn()=" + getCrConnectionYn()
				+ ", getCrConnectionDate()=" + getCrConnectionDate() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	

}
