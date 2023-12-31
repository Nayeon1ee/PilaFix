package com.dev.pilafix.center.info;

import java.sql.Date;

public class CenterInfoVO {
	private int icNumber;
	private String title;
	private String content;
	private int writerMemberCode;
	private Date regDate;
	private int cnt;
	private boolean openYN;

	private String ctName;

	public int getIcNumber() {
		return icNumber;
	}

	public void setIcNumber(int icNumber) {
		this.icNumber = icNumber;
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

	public int getWriterMemberCode() {
		return writerMemberCode;
	}

	public void setWriterMemberCode(int writerMemberCode) {
		this.writerMemberCode = writerMemberCode;
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

	public String getCtName() {
		return ctName;
	}

	public void setCtName(String ctName) {
		this.ctName = ctName;
	}

	@Override
	public String toString() {
		return "CenterInfoVO [icNumber=" + icNumber + ", title=" + title + ", content=" + content + ", writerMemberCode="
				+ writerMemberCode + ", regDate=" + regDate + ", cnt=" + cnt + ", openYN=" + openYN + ", ctName="
				+ ctName + "]";
	}

}
