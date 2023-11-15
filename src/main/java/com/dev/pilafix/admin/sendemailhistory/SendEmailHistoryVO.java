package com.dev.pilafix.admin.sendemailhistory;

import java.sql.Date;

public class SendEmailHistoryVO {
	private String mhEmailSendCode;
	private String mhEmailSendType;
	private Date mhEmailSendDatetime;
	private	String mhRecipientName;
	private	String mhRecipientTitle;
	private String mhRecipientContent;
	private	String mhRecipientEmail;
	private boolean	mhSuccessyn;
	private Date mhSuccessDatetime;
	private String mhFailReason;
	public String getMhEmailSendCode() {
		return mhEmailSendCode;
	}
	public void setMhEmailSendCode(String mhEmailSendCode) {
		this.mhEmailSendCode = mhEmailSendCode;
	}
	public String getMhEmailSendType() {
		return mhEmailSendType;
	}
	public void setMhEmailSendType(String mhEmailSendType) {
		this.mhEmailSendType = mhEmailSendType;
	}
	public Date getMhEmailSendDatetime() {
		return mhEmailSendDatetime;
	}
	public void setMhEmailSendDatetime(Date mhEmailSendDatetime) {
		this.mhEmailSendDatetime = mhEmailSendDatetime;
	}
	public String getMhRecipientName() {
		return mhRecipientName;
	}
	public void setMhRecipientName(String mhRecipientName) {
		this.mhRecipientName = mhRecipientName;
	}
	public String getMhRecipientTitle() {
		return mhRecipientTitle;
	}
	public void setMhRecipientTitle(String mhRecipientTitle) {
		this.mhRecipientTitle = mhRecipientTitle;
	}
	public String getMhRecipientContent() {
		return mhRecipientContent;
	}
	public void setMhRecipientContent(String mhRecipientContent) {
		this.mhRecipientContent = mhRecipientContent;
	}
	public String getMhRecipientEmail() {
		return mhRecipientEmail;
	}
	public void setMhRecipientEmail(String mhRecipientEmail) {
		this.mhRecipientEmail = mhRecipientEmail;
	}
	public boolean isMhSuccessyn() {
		return mhSuccessyn;
	}
	public void setMhSuccessyn(boolean mhSuccessyn) {
		this.mhSuccessyn = mhSuccessyn;
	}
	public Date getMhSuccessDatetime() {
		return mhSuccessDatetime;
	}
	public void setMhSuccessDatetime(Date mhSuccessDatetime) {
		this.mhSuccessDatetime = mhSuccessDatetime;
	}
	public String getMhFailReason() {
		return mhFailReason;
	}
	public void setMhFailReason(String mhFailReason) {
		this.mhFailReason = mhFailReason;
	}
	@Override
	public String toString() {
		return "SendEmailHistoryVO [mhEmailSendCode=" + mhEmailSendCode + ", mhEmailSendType=" + mhEmailSendType
				+ ", mhEmailSendDatetime=" + mhEmailSendDatetime + ", mhRecipientName=" + mhRecipientName
				+ ", mhRecipientTitle=" + mhRecipientTitle + ", mhRecipientContent=" + mhRecipientContent
				+ ", mhRecipientEmail=" + mhRecipientEmail + ", mhSuccessyn=" + mhSuccessyn + ", mhSuccessDatetime="
				+ mhSuccessDatetime + ", mhFailReason=" + mhFailReason + "]";
	}
	
	
}
