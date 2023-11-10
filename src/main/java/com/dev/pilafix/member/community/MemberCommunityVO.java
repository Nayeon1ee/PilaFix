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

	private int memberCpCode;
	private int memberCpTargetPostNumber;
	private String memberCpTargetPostType;
	private int memberTargetWriterMemberCode;
	private int memberBlamerMemberCode;
	private Date memberCpDate;
	private String memberBlamerIp;
	private String memberBlameReasonCode;

	private String memberBlameReasonName;

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

	public int getMemberCpCode() {
		return memberCpCode;
	}

	public void setMemberCpCode(int memberCpCode) {
		this.memberCpCode = memberCpCode;
	}

	public int getMemberCpTargetPostNumber() {
		return memberCpTargetPostNumber;
	}

	public void setMemberCpTargetPostNumber(int memberCpTargetPostNumber) {
		this.memberCpTargetPostNumber = memberCpTargetPostNumber;
	}

	public String getMemberCpTargetPostType() {
		return memberCpTargetPostType;
	}

	public void setMemberCpTargetPostType(String memberCpTargetPostType) {
		this.memberCpTargetPostType = memberCpTargetPostType;
	}

	public int getMemberTargetWriterMemberCode() {
		return memberTargetWriterMemberCode;
	}

	public void setMemberTargetWriterMemberCode(int memberTargetWriterMemberCode) {
		this.memberTargetWriterMemberCode = memberTargetWriterMemberCode;
	}

	public int getMemberBlamerMemberCode() {
		return memberBlamerMemberCode;
	}

	public void setMemberBlamerMemberCode(int memberBlamerMemberCode) {
		this.memberBlamerMemberCode = memberBlamerMemberCode;
	}

	public Date getMemberCpDate() {
		return memberCpDate;
	}

	public void setMemberCpDate(Date memberCpDate) {
		this.memberCpDate = memberCpDate;
	}

	public String getMemberBlamerIp() {
		return memberBlamerIp;
	}

	public void setMemberBlamerIp(String memberBlamerIp) {
		this.memberBlamerIp = memberBlamerIp;
	}

	public String getMemberBlameReasonCode() {
		return memberBlameReasonCode;
	}

	public void setMemberBlameReasonCode(String memberBlameReasonCode) {
		this.memberBlameReasonCode = memberBlameReasonCode;
	}

	public String getMemberBlameReasonName() {
		return memberBlameReasonName;
	}

	public void setMemberBlameReasonName(String memberBlameReasonName) {
		this.memberBlameReasonName = memberBlameReasonName;
	}

	@Override
	public String toString() {
		return "MemberCommunityVO [memberCmNumber=" + memberCmNumber + ", memberCmTitle=" + memberCmTitle
				+ ", memberCmContent=" + memberCmContent + ", memberCmWriterMemberCode=" + memberCmWriterMemberCode
				+ ", memberCmRegdate=" + memberCmRegdate + ", memberCmViews=" + memberCmViews + ", memberCmBlameCount="
				+ memberCmBlameCount + ", memberCpCode=" + memberCpCode + ", memberCpTargetPostNumber="
				+ memberCpTargetPostNumber + ", memberCpTargetPostType=" + memberCpTargetPostType
				+ ", memberTargetWriterMemberCode=" + memberTargetWriterMemberCode + ", memberBlamerMemberCode="
				+ memberBlamerMemberCode + ", memberCpDate=" + memberCpDate + ", memberBlamerIp=" + memberBlamerIp
				+ ", memberBlameReasonCode=" + memberBlameReasonCode + ", memberBlameReasonName="
				+ memberBlameReasonName + "]";
	}

}