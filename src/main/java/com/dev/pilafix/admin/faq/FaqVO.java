package com.dev.pilafix.admin.faq;

import java.sql.Date;

public class FaqVO {
	private int fqNumber;
	private String fqTitle;
	private String fqContent;
	private String fqWriterMemberCode;
	private String roleName;
	private String fqType; 
	private Date fqRegDate;
	private boolean fqOpenYn;
	public int getFqNumber() {
		return fqNumber;
	}
	public void setFqNumber(int fqNumber) {
		this.fqNumber = fqNumber;
	}
	public String getFqTitle() {
		return fqTitle;
	}
	public void setFqTitle(String fqTitle) {
		this.fqTitle = fqTitle;
	}
	public String getFqContent() {
		return fqContent;
	}
	public void setFqContent(String fqContent) {
		this.fqContent = fqContent;
	}
	public String getFqWriterMemberCode() {
		return fqWriterMemberCode;
	}
	public void setFqWriterMemberCode(String fqWriterMemberCode) {
		this.fqWriterMemberCode = fqWriterMemberCode;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getFqType() {
		return fqType;
	}
	public void setFqType(String fqType) {
		this.fqType = fqType;
	}
	public Date getFqRegDate() {
		return fqRegDate;
	}
	public void setFqRegDate(Date fqRegDate) {
		this.fqRegDate = fqRegDate;
	}
	public boolean isFqOpenYn() {
		return fqOpenYn;
	}
	public void setFqOpenYn(boolean fqOpenYn) {
		this.fqOpenYn = fqOpenYn;
	}
	@Override
	public String toString() {
		return "FaqVO [fqNumber=" + fqNumber + ", fqTitle=" + fqTitle + ", fqContent=" + fqContent
				+ ", fqWriterMemberCode=" + fqWriterMemberCode + ", roleName=" + roleName + ", fqType=" + fqType
				+ ", fqRegDate=" + fqRegDate + ", fqOpenYn=" + fqOpenYn + "]";
	}
	
	
	

}
