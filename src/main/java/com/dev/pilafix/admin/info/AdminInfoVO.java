package com.dev.pilafix.admin.info;

public class AdminInfoVO {
	private int seq;
	private String title;
	private String content;
	private String writerMemberCode;
	private String regDate;
	private int cnt;
	private boolean openYN;

	private String writerMemberCodeAd;
	private String writerMemberName;
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
	public String getWriterMemberCode() {
		return writerMemberCode;
	}
	public void setWriterMemberCode(String writerMemberCode) {
		this.writerMemberCode = writerMemberCode;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
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
	public String getWriterMemberCodeAd() {
		return writerMemberCodeAd;
	}
	public void setWriterMemberCodeAd(String writerMemberCodeAd) {
		this.writerMemberCodeAd = writerMemberCodeAd;
	}
	public String getWriterMemberName() {
		return writerMemberName;
	}
	public void setWriterMemberName(String writerMemberName) {
		this.writerMemberName = writerMemberName;
	}
	@Override
	public String toString() {
		return "AdminInfoVO [seq=" + seq + ", title=" + title + ", content=" + content + ", writerMemberCode="
				+ writerMemberCode + ", regDate=" + regDate + ", cnt=" + cnt + ", openYN=" + openYN
				+ ", writerMemberCodeAd=" + writerMemberCodeAd + ", writerMemberName=" + writerMemberName + "]";
	}

	

}
