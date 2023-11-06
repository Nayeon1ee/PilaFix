package com.dev.pilafix.admin.info;

import java.util.Date;

public class AdminInfoVO {
	private int seq;
	private String title;
	private String content;
	private String writerMemberCode;
	private Date regDate;
	private int cnt;
	private boolean openYN;

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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

	public String getwriterMemberCode() {
		return writerMemberCode;
	}

	public void setwriterMemberCode(String writerMemberCode) {
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

	@Override
	public String toString() {
		return "InfoVO [seq=" + seq + ", title=" + title + ", content=" + content + ", writerMemberCode="
				+ writerMemberCode + ", regDate=" + regDate + ", cnt=" + cnt + ", openYN=" + openYN + "]";
	}

}
