package com.dev.pilafix.member.attend;

import java.sql.Date;

public class AttendVO {
	private String atCode;
	private String lessonCode;
	private Date atDate;
	private int atMember1Code;
	private boolean atAttendance1Yn;
	private int atMember2Code;
	private boolean atAttendance2Yn;
	private int atMember3Code;
	private boolean atAttendance3Yn;
	private int atMember4Code;
	private boolean atAttendance4Yn;
	private int atMember5Code;
	private boolean atAttendance5Yn;	
	private int atMember6Code;
	private boolean atAttendance6Yn;
    private String member1Name;
    private String member2Name;
    private String member3Name;
    private String member4Name;
    private String member5Name;
    private String member6Name;
	private boolean atCheckYn;
	
	
	public boolean isAtCheckYn() {
		return atCheckYn;
	}
	public void setAtCheckYn(boolean atCheckYn) {
		this.atCheckYn = atCheckYn;
	}
	private int csMemberCode;
	private String csName;
	
	
	
	
	public String getMember1Name() {
		return member1Name;
	}
	public void setMember1Name(String member1Name) {
		this.member1Name = member1Name;
	}
	public String getMember2Name() {
		return member2Name;
	}
	public void setMember2Name(String member2Name) {
		this.member2Name = member2Name;
	}
	public String getMember3Name() {
		return member3Name;
	}
	public void setMember3Name(String member3Name) {
		this.member3Name = member3Name;
	}
	public String getMember4Name() {
		return member4Name;
	}
	public void setMember4Name(String member4Name) {
		this.member4Name = member4Name;
	}
	public String getMember5Name() {
		return member5Name;
	}
	public void setMember5Name(String member5Name) {
		this.member5Name = member5Name;
	}
	public String getMember6Name() {
		return member6Name;
	}
	public void setMember6Name(String member6Name) {
		this.member6Name = member6Name;
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
	public String getAtCode() {
		return atCode;
	}
	public void setAtCode(String atCode) {
		this.atCode = atCode;
	}
	public String getLessonCode() {
		return lessonCode;
	}
	public void setLessonCode(String lessonCode) {
		this.lessonCode = lessonCode;
	}
	public int getAtMember1Code() {
		return atMember1Code;
	}
	public void setAtMember1Code(int atMember1Code) {
		this.atMember1Code = atMember1Code;
	}
	public boolean isAtAttendance1Yn() {
		return atAttendance1Yn;
	}
	public void setAtAttendance1Yn(boolean atAttendance1Yn) {
		this.atAttendance1Yn = atAttendance1Yn;
	}
	public int getAtMember2Code() {
		return atMember2Code;
	}
	public void setAtMember2Code(int atMember2Code) {
		this.atMember2Code = atMember2Code;
	}
	public boolean isAtAttendance2Yn() {
		return atAttendance2Yn;
	}
	public void setAtAttendance2Yn(boolean atAttendance2Yn) {
		this.atAttendance2Yn = atAttendance2Yn;
	}
	public int getAtMember3Code() {
		return atMember3Code;
	}
	public void setAtMember3Code(int atMember3Code) {
		this.atMember3Code = atMember3Code;
	}
	public boolean isAtAttendance3Yn() {
		return atAttendance3Yn;
	}
	public void setAtAttendance3Yn(boolean atAttendance3Yn) {
		this.atAttendance3Yn = atAttendance3Yn;
	}
	public int getAtMember4Code() {
		return atMember4Code;
	}
	public void setAtMember4Code(int atMember4Code) {
		this.atMember4Code = atMember4Code;
	}
	public boolean isAtAttendance4Yn() {
		return atAttendance4Yn;
	}
	public void setAtAttendance4Yn(boolean atAttendance4Yn) {
		this.atAttendance4Yn = atAttendance4Yn;
	}
	public int getAtMember5Code() {
		return atMember5Code;
	}
	public void setAtMember5Code(int atMember5Code) {
		this.atMember5Code = atMember5Code;
	}
	public boolean isAtAttendance5Yn() {
		return atAttendance5Yn;
	}
	public void setAtAttendance5Yn(boolean atAttendance5Yn) {
		this.atAttendance5Yn = atAttendance5Yn;
	}
	public int getAtMember6Code() {
		return atMember6Code;
	}
	public void setAtMember6Code(int atMember6Code) {
		this.atMember6Code = atMember6Code;
	}
	public boolean isAtAttendance6Yn() {
		return atAttendance6Yn;
	}
	public void setAtAttendance6Yn(boolean atAttendance6Yn) {
		this.atAttendance6Yn = atAttendance6Yn;
	}
	
	
	public Date getAtDate() {
		return atDate;
	}
	public void setAtDate(Date atDate) {
		this.atDate = atDate;
	}
	@Override
	public String toString() {
		return "AttendVO [atCode=" + atCode + ", lessonCode=" + lessonCode + ", atDate=" + atDate + ", atMember1Code="
				+ atMember1Code + ", atAttendance1Yn=" + atAttendance1Yn + ", atMember2Code=" + atMember2Code
				+ ", atAttendance2Yn=" + atAttendance2Yn + ", atMember3Code=" + atMember3Code + ", atAttendance3Yn="
				+ atAttendance3Yn + ", atMember4Code=" + atMember4Code + ", atAttendance4Yn=" + atAttendance4Yn
				+ ", atMember5Code=" + atMember5Code + ", atAttendance5Yn=" + atAttendance5Yn + ", atMember6Code="
				+ atMember6Code + ", atAttendance6Yn=" + atAttendance6Yn + ", member1Name=" + member1Name
				+ ", member2Name=" + member2Name + ", member3Name=" + member3Name + ", member4Name=" + member4Name
				+ ", member5Name=" + member5Name + ", member6Name=" + member6Name + ", atCheckYn=" + atCheckYn
				+ ", csMemberCode=" + csMemberCode + ", csName=" + csName + "]";
	}

	
	
	


}
