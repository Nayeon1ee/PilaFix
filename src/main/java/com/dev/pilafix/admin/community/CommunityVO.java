package com.dev.pilafix.admin.community;

import java.sql.Timestamp;

import java.util.Date;

public class CommunityVO {
	private int cmNumber;
	private String cmTitle;
	private String cmContent;
	private int cmWriterMemberCode;
	private String cmRegdate;
	private String csName;
	private boolean cmOpenYn;
	private int cmBlameCount;

	
	public String getCsName() {
		return csName;
	}
	public void setCsName(String csName) {
		this.csName = csName;
	}
	
	public int getCmNumber() {
		return cmNumber;
	}
	public void setCmNumber(int cmNumber) {
		this.cmNumber = cmNumber;
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
	public int getCmWriterMemberCode() {
		return cmWriterMemberCode;
	}
	public void setCmWriterMemberCode(int cmWriterMemberCode) {
		this.cmWriterMemberCode = cmWriterMemberCode;
	}
	
	
	public String getCmRegdate() {
		return cmRegdate;
	}
	public void setCmRegdate(String cmRegdate) {
		this.cmRegdate = cmRegdate;
	}
	public boolean isCmOpenYn() {
		return cmOpenYn;
	}
	public void setCmOpenYn(boolean cmOpenYn) {
		this.cmOpenYn = cmOpenYn;
	}
	
	public int getCmBlameCount() {
		return cmBlameCount;
	}
	public void setCmBlameCount(int cmBlameCount) {
		this.cmBlameCount = cmBlameCount;
	}
	@Override
	public String toString() {
		return "CommunityVO [cmNumber=" + cmNumber + ", cmTitle=" + cmTitle + ", cmContent=" + cmContent
				+ ", cmWriterMemberCode=" + cmWriterMemberCode + ", cmRegdate=" + cmRegdate + ", csName=" + csName
				+ "]";
	}

	
}
