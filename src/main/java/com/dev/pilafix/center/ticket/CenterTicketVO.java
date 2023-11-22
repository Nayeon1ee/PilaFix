package com.dev.pilafix.center.ticket;

import java.util.Date;

public class CenterTicketVO {
	private String tkCode;
	private String tkName;
	private String tkLessonType;
	private int tkCapacity;
	private int tkUsageNumMonth;
	private int tkUsageCount;
	private String tkDescription;
	private int tkPrice;
	private boolean purchaseAvailableYN;
	private int centerCode;
	private Date RegistrationDate;
	private String tkPriceAddDot; //원화 표시시 사용하려고 만듬

	
	public String getTkPriceAddDot() {
		return tkPriceAddDot;
	}

	public void setTkPriceAddDot(String tkPriceAddDot) {
		this.tkPriceAddDot = tkPriceAddDot;
	}

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

	public String getTkLessonType() {
		return tkLessonType;
	}

	public void setTkLessonType(String tkLessonType) {
		this.tkLessonType = tkLessonType;
	}

	public int getTkCapacity() {
		return tkCapacity;
	}

	public void setTkCapacity(int tkCapacity) {
		this.tkCapacity = tkCapacity;
	}

	public int getTkUsageNumMonth() {
		return tkUsageNumMonth;
	}

	public void setTkUsageNumMonth(int tkUsageNumMonth) {
		this.tkUsageNumMonth = tkUsageNumMonth;
	}

	public int getTkUsageCount() {
		return tkUsageCount;
	}

	public void setTkUsageCount(int tkUsageCount) {
		this.tkUsageCount = tkUsageCount;
	}

	public String getTkDescription() {
		return tkDescription;
	}

	public void setTkDescription(String tkDescription) {
		this.tkDescription = tkDescription;
	}

	public int getTkPrice() {
		return tkPrice;
	}

	public void setTkPrice(int tkPrice) {
		this.tkPrice = tkPrice;
	}

	public boolean isPurchaseAvailableYN() {
		return purchaseAvailableYN;
	}

	public void setPurchaseAvailableYN(boolean purchaseAvailableYN) {
		this.purchaseAvailableYN = purchaseAvailableYN;
	}

	public int getCenterCode() {
		return centerCode;
	}

	public void setCenterCode(int centerCode) {
		this.centerCode = centerCode;
	}

	public Date getRegistrationDate() {
		return RegistrationDate;
	}

	public void setRegistrationDate(Date registrationDate) {
		RegistrationDate = registrationDate;
	}

	@Override
	public String toString() {
		return "CenterTicketVO [tkCode=" + tkCode + ", tkName=" + tkName + ", tkLessonType=" + tkLessonType
				+ ", tkCapacity=" + tkCapacity + ", tkUsageNumMonth=" + tkUsageNumMonth + ", tkUsageCount="
				+ tkUsageCount + ", tkDescription=" + tkDescription + ", tkPrice=" + tkPrice + ", purchaseAvailableYN="
				+ purchaseAvailableYN + ", centerCode=" + centerCode + ", RegistrationDate=" + RegistrationDate
				+ ", tkPriceAddDot=" + tkPriceAddDot + "]";
	}

	

}