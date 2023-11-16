package com.dev.pilafix.center.lesson;

import java.util.Date;

public class CenterLessonVO {
	private String lsCode;
	private String lsName;
	private String lsType;
	private String lsDate;
	private String lsTime;
	private int lsCapacity;
	private int lsCurrentApplication;
	private int trainerMemberCode;
	private String lsContent;
	private int centerCode;
	private Date lsRegistrationDate;
	private boolean lsColseYN;
	private String lsRegistrationDateToString;

	private int csMemberCode;
	private String csName;

	public String getLsCode() {
		return lsCode;
	}

	public void setLsCode(String lsCode) {
		this.lsCode = lsCode;
	}

	public String getLsName() {
		return lsName;
	}

	public void setLsName(String lsName) {
		this.lsName = lsName;
	}

	public String getLsType() {
		return lsType;
	}

	public void setLsType(String lsType) {
		this.lsType = lsType;
	}

	public String getLsDate() {
		return lsDate;
	}

	public void setLsDate(String lsDate) {
		this.lsDate = lsDate;
	}

	public String getLsTime() {
		return lsTime;
	}

	public void setLsTime(String lsTime) {
		this.lsTime = lsTime;
	}

	public int getLsCapacity() {
		return lsCapacity;
	}

	public void setLsCapacity(int lsCapacity) {
		this.lsCapacity = lsCapacity;
	}

	public int getLsCurrentApplication() {
		return lsCurrentApplication;
	}

	public void setLsCurrentApplication(int lsCurrentApplication) {
		this.lsCurrentApplication = lsCurrentApplication;
	}

	public int getTrainerMemberCode() {
		return trainerMemberCode;
	}

	public void setTrainerMemberCode(int trainerMemberCode) {
		this.trainerMemberCode = trainerMemberCode;
	}

	public String getLsContent() {
		return lsContent;
	}

	public void setLsContent(String lsContent) {
		this.lsContent = lsContent;
	}

	public int getCenterCode() {
		return centerCode;
	}

	public void setCenterCode(int centerCode) {
		this.centerCode = centerCode;
	}

	public Date getLsRegistrationDate() {
		return lsRegistrationDate;
	}

	public void setLsRegistrationDate(Date lsRegistrationDate) {
		this.lsRegistrationDate = lsRegistrationDate;
	}

	public boolean isLsColseYN() {
		return lsColseYN;
	}

	public void setLsColseYN(boolean lsColseYN) {
		this.lsColseYN = lsColseYN;
	}

	public String getLsRegistrationDateToString() {
		return lsRegistrationDateToString;
	}

	public void setLsRegistrationDateToString(String lsRegistrationDateToString) {
		this.lsRegistrationDateToString = lsRegistrationDateToString;
	}

	public int getCsMemberCode() {
		return csMemberCode;
	}

	public void setCsMemberCode(int csMemberCode) {
		this.csMemberCode = csMemberCode;
	}

	public String getCsName() {
		return csName;
	}

	public void setCsName(String csName) {
		this.csName = csName;
	}

	@Override
	public String toString() {
		return "CenterLessonVO [lsCode=" + lsCode + ", lsName=" + lsName + ", lsType=" + lsType + ", lsDate=" + lsDate
				+ ", lsTime=" + lsTime + ", lsCapacity=" + lsCapacity + ", lsCurrentApplication=" + lsCurrentApplication
				+ ", trainerMemberCode=" + trainerMemberCode + ", lsContent=" + lsContent + ", centerCode=" + centerCode
				+ ", lsRegistrationDate=" + lsRegistrationDate + ", lsColseYN=" + lsColseYN
				+ ", lsRegistrationDateToString=" + lsRegistrationDateToString + ", csMemberCode=" + csMemberCode
				+ ", csName=" + csName + "]";
	}

}