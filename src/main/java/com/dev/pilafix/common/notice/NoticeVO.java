package com.dev.pilafix.common.notice;

import java.sql.Date;
import java.sql.Timestamp;

public class NoticeVO {
	
	private String ncId;
	private int memberCode;
	private String recipientCode;
	private String eventType;
	private Timestamp eventDatetime; // js로 화면 출력 위해 Timestamp 
	private String uniqueIdentifierCode;
	private String ncNoticeContent;
	private boolean ncReadYn;
	private Date ncSentDatetime;

	//알림 리스트 출력 시 필요
	private String centerName;
	
	
	public NoticeVO() { }

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

	
	public Timestamp getEventDatetime() {
		return eventDatetime;
	}

	public void setEventDatetime(Timestamp eventDatetime) {
		this.eventDatetime = eventDatetime;
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

	public boolean isNcReadYn() {
		return ncReadYn;
	}

	public void setNcReadYn(boolean ncReadYn) {
		this.ncReadYn = ncReadYn;
	}

	
	public Date getNcSentDatetime() {
		return ncSentDatetime;
	}

	public void setNcSentDatetime(Date ncSentDatetime) {
		this.ncSentDatetime = ncSentDatetime;
	}

	
	public String getCenterName() {
		return centerName;
	}

	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}

	@Override
	public String toString() {
		return "NoticeVO [ncId=" + ncId + ", memberCode=" + memberCode + ", recipientCode=" + recipientCode
				+ ", eventType=" + eventType + ", eventDatetime=" + eventDatetime + ", uniqueIdentifierCode="
				+ uniqueIdentifierCode + ", ncNoticeContent=" + ncNoticeContent + ", ncReadYn=" + ncReadYn + "]";
	}

	public NoticeVO(String ncId, int memberCode, String recipientCode, String eventType, Timestamp eventDatetime,
			String uniqueIdentifierCode, String ncNoticeContent, boolean ncReadYn, Date ncSentDatetime,
			String centerName) {
		this.ncId = ncId;
		this.memberCode = memberCode;
		this.recipientCode = recipientCode;
		this.eventType = eventType;
		this.eventDatetime = eventDatetime;
		this.uniqueIdentifierCode = uniqueIdentifierCode;
		this.ncNoticeContent = ncNoticeContent;
		this.ncReadYn = ncReadYn;
		this.ncSentDatetime = ncSentDatetime;
		this.centerName = centerName;
	}

	



}
