package com.dev.pilafix.admin.center_manage;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class SendEmailHistoryVO {
	private String mhEmailSendCode;
	private String mhEmailSendType;
	private Timestamp mhEmailSendDate;
	private String mhRecipientName;
	private String mhRecipientTitle;
	private String mhRecipientContent;
	private String mhRecipientEmail;
	private boolean mhSuccessYN;
	private Timestamp mhSuccessDate;
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
	public boolean isMhSuccessYN() {
		return mhSuccessYN;
	}
	public void setMhSuccessYN(boolean mhSuccessYN) {
		this.mhSuccessYN = mhSuccessYN;
	}
	
	public String getMhFailReason() {
		return mhFailReason;
	}
	public void setMhFailReason(String mhFailReason) {
		this.mhFailReason = mhFailReason;
	}
	
	
	public Timestamp getMhEmailSendDate() {
		return mhEmailSendDate;
	}
	public void setMhEmailSendDate(Timestamp mhEmailSendDate) {
		this.mhEmailSendDate = mhEmailSendDate;
	}
	public Timestamp getMhSuccessDate() {
		return mhSuccessDate;
	}
	public void setMhSuccessDate(Timestamp mhSuccessDate) {
		this.mhSuccessDate = mhSuccessDate;
	}
	@Override
	public String toString() {
		return "SendEmailHistoryVO [mhEmailSendCode=" + mhEmailSendCode + ", mhEmailSendType=" + mhEmailSendType
				+ ", mhEmailSendDate=" + mhEmailSendDate + ", mhRecipientName=" + mhRecipientName
				+ ", mhRecipientTitle=" + mhRecipientTitle + ", mhRecipientContent=" + mhRecipientContent
				+ ", mhRecipientEmail=" + mhRecipientEmail + ", mhSuccessYN=" + mhSuccessYN + ", mhSuccessDate="
				+ mhSuccessDate + ", mhFailReason=" + mhFailReason + "]";
	}
	
	
	
	
}