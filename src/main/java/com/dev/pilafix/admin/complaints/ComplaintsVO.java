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
	private boolean cpOpenYn;
	private String cmTitle;
	private String cmContent;
	private String blameReasonName;
	private String csEmailId;
	private String csName;
	private int cmBlameCount; 
	
	
	public int getCmBlameCount() {
		return cmBlameCount;
	}
	public void setCmBlameCount(int cmBlameCount) {
		this.cmBlameCount = cmBlameCount;
	}
	public boolean isCpOpenYn() {
		return cpOpenYn;
	}
	public void setCpOpenYn(boolean cpOpenYn) {
		this.cpOpenYn = cpOpenYn;
	}
	
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
	public String getCmTitle() {
		return cmTitle;
	}
	public void setCmTitle(String cmTitle) {
		this.cmTitle = cmTitle;
	}
	public String getCmContent() {
		return cmContent;
	}
	public void setCmContent(String cmContent) {
		this.cmContent = cmContent;
	}
	public String getBlameReasonName() {
		return blameReasonName;
	}
	public void setBlameReasonName(String blameReasonName) {
		this.blameReasonName = blameReasonName;
	}
	public String getCsEmailId() {
		return csEmailId;
	}
	public void setCsEmailId(String csEmailId) {
		this.csEmailId = csEmailId;
	}
	public String getCsName() {
		return csName;
	}
	public void setCsName(String csName) {
		this.csName = csName;
	}
	@Override
	public String toString() {
		return "ComplaintsVO [cpCode=" + cpCode + ", cpTargetPostNumber=" + cpTargetPostNumber + ", cpTargetPostType="
				+ cpTargetPostType + ", targetWriterMemberCode=" + targetWriterMemberCode + ", blamerMemberCode="
				+ blamerMemberCode + ", cpDate=" + cpDate + ", blamerIp=" + blamerIp + ", cpOpenYn=" + cpOpenYn
				+ ", cmTitle=" + cmTitle + ", cmContent=" + cmContent + ", blameReasonName=" + blameReasonName
				+ ", csEmailId=" + csEmailId + ", csName=" + csName + ", cmBlameCount=" + cmBlameCount + "]";
	}
	
}
