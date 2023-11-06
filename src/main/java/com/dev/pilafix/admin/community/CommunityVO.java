package com.dev.pilafix.admin.community;

import java.util.Date;

public class CommunityVO {
	private int cmNumber;
	private String cmTitle;
	private String cmContent;
	private int cmWriterMemberCode;
	private Date cmRegdate;
	
	//테스트
	private String csName;
	
	
	public String getCsName() {
		return csName;
	}
	public void setCsName(String csName) {
		this.csName = csName;
	}
	//테스트 끝
	
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
	public Date getCmRegdate() {
		return cmRegdate;
	}
	public void setCmRegdate(Date cmRegdate) {
		this.cmRegdate = cmRegdate;
	}
	
	
	@Override
	public String toString() {
		return "CommunityVO [cmNumber=" + cmNumber + ", cmTitle=" + cmTitle + ", cmContent=" + cmContent
				+ ", cmWriterMemberCode=" + cmWriterMemberCode + ", cmRegdate=" + cmRegdate + ", csName=" + csName
				+ "]";
	}

	
}
