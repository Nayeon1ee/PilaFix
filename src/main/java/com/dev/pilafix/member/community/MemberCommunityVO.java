package com.dev.pilafix.member.community;

import java.util.Date;

public class MemberCommunityVO {
	private int memberCmNumber;
	private String memberCmTitle;
	private String memberCmContent;
	private int memberCmWriterMemberCode;
	private Date memberCmRegdate;
	private int memberCmViews;
	private int memberCmBlameCount;

	public int getMemberCmNumber() {
		return memberCmNumber;
	}

	public void setMemberCmNumber(int memberCmNumber) {
		this.memberCmNumber = memberCmNumber;
	}

	public String getMemberCmTitle() {
		return memberCmTitle;
	}

	public void setMemberCmTitle(String memberCmTitle) {
		this.memberCmTitle = memberCmTitle;
	}

	public String getMemberCmContent() {
		return memberCmContent;
	}

	public void setMemberCmContent(String memberCmContent) {
		this.memberCmContent = memberCmContent;
	}

	public int getMemberCmWriterMemberCode() {
		return memberCmWriterMemberCode;
	}

	public void setMemberCmWriterMemberCode(int memberCmWriterMemberCode) {
		this.memberCmWriterMemberCode = memberCmWriterMemberCode;
	}

	public Date getMemberCmRegdate() {
		return memberCmRegdate;
	}

	public void setMemberCmRegdate(Date memberCmRegdate) {
		this.memberCmRegdate = memberCmRegdate;
	}

	public int getMemberCmViews() {
		return memberCmViews;
	}

	public void setMemberCmViews(int memberCmViews) {
		this.memberCmViews = memberCmViews;
	}

	public int getMemberCmBlameCount() {
		return memberCmBlameCount;
	}

	public void setMemberCmBlameCount(int memberCmBlameCount) {
		this.memberCmBlameCount = memberCmBlameCount;
	}

	@Override
	public String toString() {
		return "MemberCommunityVO [memberCmNumber=" + memberCmNumber + ", memberCmTitle=" + memberCmTitle
				+ ", memberCmContent=" + memberCmContent + ", memberCmWriterMemberCode=" + memberCmWriterMemberCode
				+ ", memberCmRegdate=" + memberCmRegdate + ", memberCmViews=" + memberCmViews + ", memberCmBlameCount="
				+ memberCmBlameCount + "]";
	}

}