package com.dev.pilafix.admin.info;

import java.sql.Date;

public class AdminInfoVO {
	private int iwNumber;
	private String title;
	private String content;
	private String writerMemberCode;
	private String writerMemberName;
	private Date regDate;
	private int cnt;
	private boolean openYN;
	
	public int getIwNumber() {
		return iwNumber;
	}
	public void setIwNumber(int iwNumber) {
		this.iwNumber = iwNumber;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriterMemberCode() {
		return writerMemberCode;
	}
	public void setWriterMemberCode(String writerMemberCode) {
		this.writerMemberCode = writerMemberCode;
	}
	public String getWriterMemberName() {
		return writerMemberName;
	}
	public void setWriterMemberName(String writerMemberName) {
		this.writerMemberName = writerMemberName;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public boolean isOpenYN() {
		return openYN;
	}
	public void setOpenYN(boolean openYN) {
		this.openYN = openYN;
	}
	@Override
	public String toString() {
		return "AdminInfoVO [iwNumber=" + iwNumber + ", title=" + title + ", content=" + content + ", writerMemberCode="
				+ writerMemberCode + ", writerMemberName=" + writerMemberName + ", regDate=" + regDate + ", cnt=" + cnt
				+ ", openYN=" + openYN + "]";
	}


	

	

}
