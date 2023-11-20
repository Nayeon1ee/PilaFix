package com.dev.pilafix.center.notice_history;

import java.sql.Date;

public class NoticeHistoryVO {
	private String ncId;
	private Date ncSentDatetime;
	private int memberCode;
	private String recipientCode;
	private String eventType;
	private String uniqueIdentifierCode;
	private boolean readYn;
	private String ncNoticeContent;
	
	
	public String getNcId() {
		return ncId;
	}
	public void setNcId(String ncId) {
		this.ncId = ncId;
	}
	public Date getNcSentDatetime() {
		return ncSentDatetime;
	}
	public void setNcSentDatetime(Date ncSentDatetime) {
		this.ncSentDatetime = ncSentDatetime;
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
	public boolean isReadYn() {
		return readYn;
	}
	public void setReadYn(boolean readYn) {
		this.readYn = readYn;
	}
	
	
	public String getNcNoticeContent() {
		return ncNoticeContent;
	}
	public void setNcNoticeContent(String ncNoticeContent) {
		this.ncNoticeContent = ncNoticeContent;
	}
	@Override
	public String toString() {
		return "NoticeHistoryVO [ncId=" + ncId + ", ncSentDatetime=" + ncSentDatetime + ", memberCode=" + memberCode
				+ ", recipientCode=" + recipientCode + ", eventType=" + eventType + ", uniqueIdentifierCode="
				+ uniqueIdentifierCode + ", readYn=" + readYn + "]";
	}
	
	
	
	
}
