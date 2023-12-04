package com.dev.pilafix.center.lesson;

import java.sql.Date;

public class DataListVO {
	private String lsCode;
	private String lsName;
	private String lsType;
	private Date lsDate;
	private String lsTime;
	private int lsCapacity;
	private int lsCurrentApplicants;
	private int trainerMemberCode;
	private String lsContent;
	private int centerCode;
	private Date lsRegistrationDate;
	private boolean lsCloseYN;

	public DataListVO() {

	}
	

	public DataListVO(String lsCode, String lsName, String lsType, Date lsDate, String lsTime, int lsCapacity,
			int trainerMemberCode, String lsContent, int centerCode) {
		super();
		this.lsCode = lsCode;
		this.lsName = lsName;
		this.lsType = lsType;
		this.lsDate = lsDate;
		this.lsTime = lsTime;
		this.lsCapacity = lsCapacity;
		this.trainerMemberCode = trainerMemberCode;
		this.lsContent = lsContent;
		this.centerCode = centerCode;
	}



	public DataListVO(String lsCode, String lsName, String lsType, Date lsDate, String lsTime, int lsCapacity,
			int lsCurrentApplicants, int trainerMemberCode, String lsContent, int centerCode, Date lsRegistrationDate,
			boolean lsCloseYN) {
		super();
		this.lsCode = lsCode;
		this.lsName = lsName;
		this.lsType = lsType;
		this.lsDate = lsDate;
		this.lsTime = lsTime;
		this.lsCapacity = lsCapacity;
		this.lsCurrentApplicants = lsCurrentApplicants;
		this.trainerMemberCode = trainerMemberCode;
		this.lsContent = lsContent;
		this.centerCode = centerCode;
		this.lsRegistrationDate = lsRegistrationDate;
		this.lsCloseYN = lsCloseYN;
	}

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

	public Date getLsDate() {
		return lsDate;
	}

	public void setLsDate(Date lsDate) {
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

	public int getLsCurrentApplicants() {
		return lsCurrentApplicants;
	}

	public void setLsCurrentApplicants(int lsCurrentApplicants) {
		this.lsCurrentApplicants = lsCurrentApplicants;
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

	public boolean isLsCloseYN() {
		return lsCloseYN;
	}

	public void setLsCloseYN(boolean lsCloseYN) {
		this.lsCloseYN = lsCloseYN;
	}

	@Override
	public String toString() {
		return "dataListVO [lsCode=" + lsCode + ", lsName=" + lsName + ", lsType=" + lsType + ", lsDate=" + lsDate
				+ ", lsTime=" + lsTime + ", lsCapacity=" + lsCapacity + ", lsCurrentApplicants=" + lsCurrentApplicants
				+ ", trainerMemberCode=" + trainerMemberCode + ", lsContent=" + lsContent + ", centerCode=" + centerCode
				+ ", lsRegistrationDate=" + lsRegistrationDate + ", lsCloseYN=" + lsCloseYN + "]";
	}

}
