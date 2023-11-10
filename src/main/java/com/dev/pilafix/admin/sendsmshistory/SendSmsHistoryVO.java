package com.dev.pilafix.admin.sendsmshistory;

import java.util.Date;

public class SendSmsHistoryVO {
	private int shSendCode;
	private Date shSendDatetime;
	private String shSendCenterCode;
	private String shRecipientName;
	private String shRecipientPhone;
	private String shRecipientContent;
	private boolean shSuccessYn;
	private Date shSuccessDatetime;
	private String shFailReason;
	public int getShSendCode() {
		return shSendCode;
	}
	public void setShSendCode(int shSendCode) {
		this.shSendCode = shSendCode;
	}
	public Date getShSendDatetime() {
		return shSendDatetime;
	}
	public void setShSendDatetime(Date shSendDatetime) {
		this.shSendDatetime = shSendDatetime;
	}
	public String getShSendCenterCode() {
		return shSendCenterCode;
	}
	public void setShSendCenterCode(String shSendCenterCode) {
		this.shSendCenterCode = shSendCenterCode;
	}
	public String getShRecipientName() {
		return shRecipientName;
	}
	public void setShRecipientName(String shRecipientName) {
		this.shRecipientName = shRecipientName;
	}
	public String getShRecipientPhone() {
		return shRecipientPhone;
	}
	public void setShRecipientPhone(String shRecipientPhone) {
		this.shRecipientPhone = shRecipientPhone;
	}
	public String getShRecipientContent() {
		return shRecipientContent;
	}
	public void setShRecipientContent(String shRecipientContent) {
		this.shRecipientContent = shRecipientContent;
	}
	public boolean isShSuccessYn() {
		return shSuccessYn;
	}
	public void setShSuccessYn(boolean shSuccessYn) {
		this.shSuccessYn = shSuccessYn;
	}
	public Date getShSuccessDatetime() {
		return shSuccessDatetime;
	}
	public void setShSuccessDatetime(Date shSuccessDatetime) {
		this.shSuccessDatetime = shSuccessDatetime;
	}
	public String getShFailReason() {
		return shFailReason;
	}
	public void setShFailReason(String shFailReason) {
		this.shFailReason = shFailReason;
	}
	@Override
	public String toString() {
		return "SendSmsHistoryVO [shSendCode=" + shSendCode + ", shSendCenterCode=" + shSendCenterCode
				+ ", shRecipientName=" + shRecipientName + ", shRecipientPhone=" + shRecipientPhone
				+ ", shRecipientContent=" + shRecipientContent + ", shSuccessYn=" + shSuccessYn + ", shFailReason="
				+ shFailReason + "]";
	}
	
	


}
