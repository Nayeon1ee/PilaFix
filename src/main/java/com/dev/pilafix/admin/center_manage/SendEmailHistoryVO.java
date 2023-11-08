package com.dev.pilafix.admin.center_manage;

import java.sql.Date;

public class SendEmailHistoryVO {
	private String emailSendCode;
	private String emailSendType;
	private Date emailSendDate;
	private String recipientName;
	private String recipientTitle;
	private String recipientContent;
	private String recipientEmail;
	private boolean successYN;
	private Date successDate;
	private String failReason;
	public String getEmailSendCode() {
		return emailSendCode;
	}
	public void setEmailSendCode(String emailSendCode) {
		this.emailSendCode = emailSendCode;
	}
	public String getEmailSendType() {
		return emailSendType;
	}
	public void setEmailSendType(String emailSendType) {
		this.emailSendType = emailSendType;
	}
	public Date getEmailSendDate() {
		return emailSendDate;
	}
	public void setEmailSendDate(Date emailSendDate) {
		this.emailSendDate = emailSendDate;
	}
	public String getRecipientName() {
		return recipientName;
	}
	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}
	public String getRecipientTitle() {
		return recipientTitle;
	}
	public void setRecipientTitle(String recipientTitle) {
		this.recipientTitle = recipientTitle;
	}
	public String getRecipientContent() {
		return recipientContent;
	}
	public void setRecipientContent(String recipientContent) {
		this.recipientContent = recipientContent;
	}
	public String getRecipientEmail() {
		return recipientEmail;
	}
	public void setRecipientEmail(String recipientEmail) {
		this.recipientEmail = recipientEmail;
	}
	public boolean isSuccessYN() {
		return successYN;
	}
	public void setSuccessYN(boolean successYN) {
		this.successYN = successYN;
	}
	public Date getSuccessDate() {
		return successDate;
	}
	public void setSuccessDate(Date successDate) {
		this.successDate = successDate;
	}
	public String getFailReason() {
		return failReason;
	}
	public void setFailReason(String failReason) {
		this.failReason = failReason;
	}
	@Override
	public String toString() {
		return "SendEmailHistoryVO [emailSendCode=" + emailSendCode + ", emailSendType=" + emailSendType
				+ ", emailSendDate=" + emailSendDate + ", recipientName=" + recipientName + ", recipientTitle="
				+ recipientTitle + ", recipientContent=" + recipientContent + ", recipientEmail=" + recipientEmail
				+ ", successYN=" + successYN + ", successDate=" + successDate + ", failReason=" + failReason + "]";
	}
	
	
	
}
