package com.dev.pilafix.admin.sendemailhistory;

import java.sql.Timestamp;

public class SendEmailHistoryVO {
	private String mhEmailSendCode;
	private String mhEmailSendType;
	private Timestamp mhEmailSendDatetime;
	private	String mhRecipientName;
	private	String mhRecipientTitle;
	private String mhRecipientContent;
	private	String mhRecipientEmail;
	private boolean	mhSuccessyn;
	private Timestamp mhSuccessDatetime;
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

	public String getMhFailReason() {
		return mhFailReason;
	}
	public void setMhFailReason(String mhFailReason) {
		this.mhFailReason = mhFailReason;
	}
	public Timestamp getMhEmailSendDatetime() {
		return mhEmailSendDatetime;
	}
	public void setMhEmailSendDatetime(Timestamp mhEmailSendDatetime) {
		this.mhEmailSendDatetime = mhEmailSendDatetime;
	}
	public Timestamp getMhSuccessDatetime() {
		return mhSuccessDatetime;
	}
	public void setMhSuccessDatetime(Timestamp mhSuccessDatetime) {
		this.mhSuccessDatetime = mhSuccessDatetime;
	}
	@Override
	public String toString() {
		return "SendEmailHistoryVO [mhEmailSendCode=" + mhEmailSendCode + ", mhEmailSendType=" + mhEmailSendType
				+ ", mhRecipientName=" + mhRecipientName + ", mhRecipientTitle=" + mhRecipientTitle
				+ ", mhRecipientContent=" + mhRecipientContent + ", mhRecipientEmail=" + mhRecipientEmail
				+ ", mhSuccessyn=" + mhSuccessyn + ", mhFailReason=" + mhFailReason + "]";
	}
	
	
	
}
