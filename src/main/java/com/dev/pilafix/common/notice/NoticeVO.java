package com.dev.pilafix.common.notice;

import java.sql.Date;

public class NoticeVO {
	
	private String ncId;
	private int memberCode;
	private String recipientCode;
	private String eventType;
	private String uniqueIdentifierCode;
	private String ncNoticeContent;
	private boolean ncSendYn;
	private Date ncSentDatetime;
	private boolean ncReadYn;
	
	public NoticeVO() { }
	
	
	public NoticeVO(String ncId, int memberCode, String recipientCode, String eventType, String uniqueIdentifierCode,
			String ncNoticeContent, boolean ncSendYn, Date ncSentDatetime, boolean ncReadYn) {
		this.ncId = ncId;
		this.memberCode = memberCode;
		this.recipientCode = recipientCode;
		this.eventType = eventType;
		this.uniqueIdentifierCode = uniqueIdentifierCode;
		this.ncNoticeContent = ncNoticeContent;
		this.ncSendYn = ncSendYn;
		this.ncSentDatetime = ncSentDatetime;
		this.ncReadYn = ncReadYn;
	}


	public String getNcId() {
		return ncId;
	}
	public void setNcId(String ncId) {
		this.ncId = ncId;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public String getRecipientCode() {
		return recipientCode;
	}
	public void setRecipientCode(String recipientCode) {
		this.recipientCode = recipientCode;
	}
	public String getEventType() {
		return eventType;
	}
	public void setEventType(String eventType) {
		this.eventType = eventType;
	}
	public String getUniqueIdentifierCode() {
		return uniqueIdentifierCode;
	}
	public void setUniqueIdentifierCode(String uniqueIdentifierCode) {
		this.uniqueIdentifierCode = uniqueIdentifierCode;
	}
	public String getNcNoticeContent() {
		return ncNoticeContent;
	}
	public void setNcNoticeContent(String ncNoticeContent) {
		this.ncNoticeContent = ncNoticeContent;
	}
	public boolean isNcSendYn() {
		return ncSendYn;
	}
	public void setNcSendYn(boolean ncSendYn) {
		this.ncSendYn = ncSendYn;
	}
	public Date getNcSentDatetime() {
		return ncSentDatetime;
	}
	public void setNcSentDatetime(Date ncSentDatetime) {
		this.ncSentDatetime = ncSentDatetime;
	}
	public boolean isNcReadYn() {
		return ncReadYn;
	}
	public void setNcReadYn(boolean ncReadYn) {
		this.ncReadYn = ncReadYn;
	}
	@Override
	public String toString() {
		return "NoticeVO [ncId=" + ncId + ", memberCode=" + memberCode + ", recipientCode=" + recipientCode
				+ ", eventType=" + eventType + ", uniqueIdentifierCode=" + uniqueIdentifierCode + ", ncNoticeContent="
				+ ncNoticeContent + ", ncSendYn=" + ncSendYn + ", ncSentDatetime=" + ncSentDatetime + ", ncReadYn="
				+ ncReadYn + "]";
	}

	



}
