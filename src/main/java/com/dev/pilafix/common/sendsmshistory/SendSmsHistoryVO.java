package com.dev.pilafix.common.sendsmshistory;

import java.sql.Timestamp;

public class SendSmsHistoryVO {
	private String  shSendCode;
	private Timestamp shSendDatetime;
	private int shSendCenterCode;
	private String shRecipientName;
	private String shRecipientPhone;
	private String shRecipientContent;
	private boolean shSuccessYn;
	private Timestamp shSuccessDatetime;
	private String shFailReason;
	private String shSendCenterName;
	
	public String getShSendCode() {
		return shSendCode;
	}
	public void setShSendCode(String shSendCode) {
		this.shSendCode = shSendCode;
	}
	
	public int getShSendCenterCode() {
		return shSendCenterCode;
	}
	public void setShSendCenterCode(int shSendCenterCode) {
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
	
	
	public Timestamp getShSendDatetime() {
		return shSendDatetime;
	}
	public void setShSendDatetime(Timestamp shSendDatetime) {
		this.shSendDatetime = shSendDatetime;
	}
	public Timestamp getShSuccessDatetime() {
		return shSuccessDatetime;
	}
	public void setShSuccessDatetime(Timestamp shSuccessDatetime) {
		this.shSuccessDatetime = shSuccessDatetime;
	}
	public String getShFailReason() {
		return shFailReason;
	}
	public void setShFailReason(String shFailReason) {
		this.shFailReason = shFailReason;
	}
	public String getShSendCenterName() {
		return shSendCenterName;
	}
	public void setShSendCenterName(String shSendCenterName) {
		this.shSendCenterName = shSendCenterName;
	}

	
	
	

}