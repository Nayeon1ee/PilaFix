package com.dev.pilafix.member.schedule;

import java.sql.Date;
import java.sql.Timestamp;

public class MyScheduleVO {
	private String lsCode;
	private String lsName;
	private String lsType;
	private Date lsDate;
	private String lsTime;
	private String lsEndTime;
	private Timestamp lessonDatetime;
	private int trainerMemberCode;
	private String trainerMemberName;
	private int centerCode;
	private String centerName;
	private boolean lsColseYN;
	private String rsCode;
	private Date rsDatetime; //예약일자 
	
	private boolean atAttendanceYn;
	
	
	
	public boolean isAtAttendanceYn() {
		return atAttendanceYn;
	}
	public void setAtAttendanceYn(boolean atAttendanceYn) {
		this.atAttendanceYn = atAttendanceYn;
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
	public String getLsEndTime() {
		return lsEndTime;
	}
	public void setLsEndTime(String lsEndTime) {
		this.lsEndTime = lsEndTime;
	}
	public Timestamp getLessonDatetime() {
		return lessonDatetime;
	}
	public void setLessonDatetime(Timestamp lessonDatetime) {
		this.lessonDatetime = lessonDatetime;
	}
	public int getTrainerMemberCode() {
		return trainerMemberCode;
	}
	public void setTrainerMemberCode(int trainerMemberCode) {
		this.trainerMemberCode = trainerMemberCode;
	}
	public String getTrainerMemberName() {
		return trainerMemberName;
	}
	public void setTrainerMemberName(String trainerMemberName) {
		this.trainerMemberName = trainerMemberName;
	}
	public int getCenterCode() {
		return centerCode;
	}
	public void setCenterCode(int centerCode) {
		this.centerCode = centerCode;
	}
	public String getCenterName() {
		return centerName;
	}
	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}
	public boolean isLsColseYN() {
		return lsColseYN;
	}
	public void setLsColseYN(boolean lsColseYN) {
		this.lsColseYN = lsColseYN;
	}
	public String getRsCode() {
		return rsCode;
	}
	public void setRsCode(String rsCode) {
		this.rsCode = rsCode;
	}
	public Date getRsDatetime() {
		return rsDatetime;
	}
	public void setRsDatetime(Date rsDatetime) {
		this.rsDatetime = rsDatetime;
	}
	@Override
	public String toString() {
		return "MyScheduleVO [lsCode=" + lsCode + ", lsName=" + lsName + ", lsType=" + lsType + ", lsDate=" + lsDate
				+ ", lsTime=" + lsTime + ", lsEndTime=" + lsEndTime + ", lessonDatetime=" + lessonDatetime
				+ ", trainerMemberCode=" + trainerMemberCode + ", trainerMemberName=" + trainerMemberName
				+ ", centerCode=" + centerCode + ", centerName=" + centerName + ", lsColseYN=" + lsColseYN + ", rsCode="
				+ rsCode + ", atAttendanceYn=" + atAttendanceYn + "]";
	}
	

	
	
	
	
	
	


	
}
