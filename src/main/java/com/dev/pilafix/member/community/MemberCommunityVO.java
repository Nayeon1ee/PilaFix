package com.dev.pilafix.member.community;

import java.sql.Date;

public class MemberCommunityVO {
	private int memberCmNumber;
	private String memberCmTitle;
	private String memberCmContent;
	private int memberCmWriterMemberCode;
	private Date memberCmRegdate;
	private int memberCmViews;
	private int memberCmBlameCount;
	private boolean memberCmOpenYN;
	private String cmWriterIp;

	private int memberCpCode;
	private int memberCpTargetPostNumber;
	private String memberCpTargetPostType;
	private int memberTargetWriterMemberCode;
	private int memberBlamerMemberCode;
	private Date memberCpDate;
	private String memberBlamerIp;

	private String memberBlameReasonCode;
	private String memberBlameReasonName;

	private int memberReNumber;
	private String memberReTitle;
	private String memberReContent;
	private String memberWriterRoleCode;
	private int memberWriterCode;
	private Date memberReRegdate;
	private String memberReTargetPostType;
	private int memberReTargetPostNumber;

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

	public boolean isMemberCmOpenYN() {
		return memberCmOpenYN;
	}

	public void setMemberCmOpenYN(boolean memberCmOpenYN) {
		this.memberCmOpenYN = memberCmOpenYN;
	}

	public String getCmWriterIp() {
		return cmWriterIp;
	}

	public void setCmWriterIp(String cmWriterIp) {
		this.cmWriterIp = cmWriterIp;
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

	public int getMemberReNumber() {
		return memberReNumber;
	}

	public void setMemberReNumber(int memberReNumber) {
		this.memberReNumber = memberReNumber;
	}

	public String getMemberReTitle() {
		return memberReTitle;
	}

	public void setMemberReTitle(String memberReTitle) {
		this.memberReTitle = memberReTitle;
	}

	public String getMemberReContent() {
		return memberReContent;
	}

	public void setMemberReContent(String memberReContent) {
		this.memberReContent = memberReContent;
	}

	public String getMemberWriterRoleCode() {
		return memberWriterRoleCode;
	}

	public void setMemberWriterRoleCode(String memberWriterRoleCode) {
		this.memberWriterRoleCode = memberWriterRoleCode;
	}

	public int getMemberWriterCode() {
		return memberWriterCode;
	}

	public void setMemberWriterCode(int memberWriterCode) {
		this.memberWriterCode = memberWriterCode;
	}

	public Date getMemberReRegdate() {
		return memberReRegdate;
	}

	public void setMemberReRegdate(Date memberReRegdate) {
		this.memberReRegdate = memberReRegdate;
	}

	public String getMemberReTargetPostType() {
		return memberReTargetPostType;
	}

	public void setMemberReTargetPostType(String memberReTargetPostType) {
		this.memberReTargetPostType = memberReTargetPostType;
	}

	public int getMemberReTargetPostNumber() {
		return memberReTargetPostNumber;
	}

	public void setMemberReTargetPostNumber(int memberReTargetPostNumber) {
		this.memberReTargetPostNumber = memberReTargetPostNumber;
	}

	@Override
	public String toString() {
		return "MemberCommunityVO [memberCmNumber=" + memberCmNumber + ", memberCmTitle=" + memberCmTitle
				+ ", memberCmContent=" + memberCmContent + ", memberCmWriterMemberCode=" + memberCmWriterMemberCode
				+ ", memberCmRegdate=" + memberCmRegdate + ", memberCmViews=" + memberCmViews + ", memberCmBlameCount="
				+ memberCmBlameCount + ", memberCmOpenYN=" + memberCmOpenYN + ", cmWriterIp=" + cmWriterIp
				+ ", memberCpCode=" + memberCpCode + ", memberCpTargetPostNumber=" + memberCpTargetPostNumber
				+ ", memberCpTargetPostType=" + memberCpTargetPostType + ", memberTargetWriterMemberCode="
				+ memberTargetWriterMemberCode + ", memberBlamerMemberCode=" + memberBlamerMemberCode
				+ ", memberCpDate=" + memberCpDate + ", memberBlamerIp=" + memberBlamerIp + ", memberBlameReasonCode="
				+ memberBlameReasonCode + ", memberBlameReasonName=" + memberBlameReasonName + ", memberReNumber="
				+ memberReNumber + ", memberReTitle=" + memberReTitle + ", memberReContent=" + memberReContent
				+ ", memberWriterRoleCode=" + memberWriterRoleCode + ", memberWriterCode=" + memberWriterCode
				+ ", memberReRegdate=" + memberReRegdate + ", memberReTargetPostType=" + memberReTargetPostType
				+ ", memberReTargetPostNumber=" + memberReTargetPostNumber + "]";
	}

}