package com.dev.pilafix.center.member_trainer_manage;

public class TicketInfoVO {
	private String tkCode; // Ƽ���ڵ� 
	private String tkName; // Ƽ�ϸ�
	private String tkUsageCount; // ���Ƚ��
	
	public String getTkCode() {
		return tkCode;
	}
	public void setTkCode(String tkCode) {
		this.tkCode = tkCode;
	}
	public String getTkName() {
		return tkName;
	}
	public void setTkName(String tkName) {
		this.tkName = tkName;
	}
	public String getTkUsageCount() {
		return tkUsageCount;
	}
	public void setTkUsageCount(String tkUsageCount) {
		this.tkUsageCount = tkUsageCount;
	}
	@Override
	public String toString() {
		return "TicketInfoVO [tkCode=" + tkCode + ", tkName=" + tkName + ", tkUsageCount=" + tkUsageCount + "]";
	}
	
	
	
}
