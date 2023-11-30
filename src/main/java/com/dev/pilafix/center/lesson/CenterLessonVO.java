package com.dev.pilafix.center.lesson;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import com.dev.pilafix.common.member.MemberVO;

public class CenterLessonVO {
	private String lsCode;
	private String lsName;
	private String lsType;
	private Date lsDate;
	private String lsTime;
	private int lsCapacity;
	private int lsCurrentApplicants;
	private int trainerMemberCode;
	private String trainerMemberName;
	private String lsContent;
	private int centerCode;
	private String centerName;
	private Date lsRegistrationDate;
	private boolean lsCloseYN;

	private String lsRegistrationDateToString;
	private String lsEndTime;
	private Timestamp lessonDatetime;
	private Timestamp lessonEndDatetime;

	private int csMemberCode;
	private String csName;

	private int groupCount;
	private int personalCount;
	private int closedGroupCount;
	private int closedPersonalCount;

	private String lsCenterName;
	private int reservedCount;
	private int attendedCount;
	private int absentCount;
	private List<MemberVO> reservedMembers;
	private String lsStartTime;
	
	
	
	public String getLsStartTime() {
		return lsStartTime;
	}

	public void setLsStartTime(String lsStartTime) {
		this.lsStartTime = lsStartTime;
=======
	private String atCode;
	private String lessonCode;

	
	
	
	public Timestamp getLessonEndDatetime() {
		return lessonEndDatetime;
	}

	public void setLessonEndDatetime(Timestamp lessonEndDatetime) {
		this.lessonEndDatetime = lessonEndDatetime;
	}

	public boolean isLsCloseYN() {
		return lsCloseYN;
	}

	public void setLsCloseYN(boolean lsCloseYN) {
		this.lsCloseYN = lsCloseYN;
	}
	
	public int getAttendedCount() {
		return attendedCount;
	}

	public void setAttendedCount(int attendedCount) {
		this.attendedCount = attendedCount;
	}

	public int getAbsentCount() {
		return absentCount;
	}

	public void setAbsentCount(int absentCount) {
		this.absentCount = absentCount;
	}

	public List<MemberVO> getReservedMembers() {
		return reservedMembers;
	}

	public void setReservedMembers(List<MemberVO> reservedMembers) {
		this.reservedMembers = reservedMembers;
	}

	public int getReservedCount() {
		return reservedCount;
	}

	public void setReservedCount(int reservedCount) {
		this.reservedCount = reservedCount;
	}

	public String getLsCenterName() {
		return lsCenterName;
	}

	public void setLsCenterName(String lsCenterName) {
		this.lsCenterName = lsCenterName;
	}

	public int getClosedGroupCount() {
		return closedGroupCount;
	}

	public void setClosedGroupCount(int closedGroupCount) {
		this.closedGroupCount = closedGroupCount;
	}

	public int getClosedPersonalCount() {
		return closedPersonalCount;
	}

	public void setClosedPersonalCount(int closedPersonalCount) {
		this.closedPersonalCount = closedPersonalCount;
	}

	public int getGroupCount() {
		return groupCount;
	}

	public void setGroupCount(int groupCount) {
		this.groupCount = groupCount;
	}

	public int getPersonalCount() {
		return personalCount;
	}

	public void setPersonalCount(int personalCount) {
		this.personalCount = personalCount;
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

	public String getTrainerMemberName() {
		return trainerMemberName;
	}

	public void setTrainerMemberName(String trainerMemberName) {
		this.trainerMemberName = trainerMemberName;
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

	public String getCenterName() {
		return centerName;
	}

	public void setCenterName(String centerName) {
		this.centerName = centerName;
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

	public String getLsRegistrationDateToString() {
		return lsRegistrationDateToString;
	}

	public void setLsRegistrationDateToString(String lsRegistrationDateToString) {
		this.lsRegistrationDateToString = lsRegistrationDateToString;
	}

	public Timestamp getLsTimeDB() {
		return lsTimeDB;
	}

	public void setLsTimeDB(Timestamp lsTimeDB) {
		this.lsTimeDB = lsTimeDB;
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

	public int getGroupCount() {
		return groupCount;
	}

	public void setGroupCount(int groupCount) {
		this.groupCount = groupCount;
	}

	public int getPersonalCount() {
		return personalCount;
	}

	public void setPersonalCount(int personalCount) {
		this.personalCount = personalCount;
	}

	public int getClosedGroupCount() {
		return closedGroupCount;
	}

	public void setClosedGroupCount(int closedGroupCount) {
		this.closedGroupCount = closedGroupCount;
	}

	public int getClosedPersonalCount() {
		return closedPersonalCount;
	}

	public void setClosedPersonalCount(int closedPersonalCount) {
		this.closedPersonalCount = closedPersonalCount;
	}

	public String getLsCenterName() {
		return lsCenterName;
	}

	public void setLsCenterName(String lsCenterName) {
		this.lsCenterName = lsCenterName;
	}

	public int getReservedCount() {
		return reservedCount;
	}

	public void setReservedCount(int reservedCount) {
		this.reservedCount = reservedCount;
	}

	public int getAttendedCount() {
		return attendedCount;
	}

	public void setAttendedCount(int attendedCount) {
		this.attendedCount = attendedCount;
	}

	public int getAbsentCount() {
		return absentCount;
	}

	public void setAbsentCount(int absentCount) {
		this.absentCount = absentCount;
	}

	public List<MemberVO> getReservedMembers() {
		return reservedMembers;
	}

	public void setReservedMembers(List<MemberVO> reservedMembers) {
		this.reservedMembers = reservedMembers;
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

	@Override
	public String toString() {
		return "CenterLessonVO [lsCode=" + lsCode + ", lsName=" + lsName + ", lsType=" + lsType + ", lsDate=" + lsDate
				+ ", lsTime=" + lsTime + ", lsCapacity=" + lsCapacity + ", lsCurrentApplicants=" + lsCurrentApplicants
				+ ", trainerMemberCode=" + trainerMemberCode + ", trainerMemberName=" + trainerMemberName
				+ ", lsContent=" + lsContent + ", centerCode=" + centerCode + ", centerName=" + centerName
				+ ", lsRegistrationDate=" + lsRegistrationDate + ", lsCloseYN=" + lsCloseYN
				+ ", lsRegistrationDateToString=" + lsRegistrationDateToString + ", lsTimeDB=" + lsTimeDB
				+ ", lsEndTime=" + lsEndTime + ", lessonDatetime=" + lessonDatetime + ", csMemberCode=" + csMemberCode
				+ ", csName=" + csName + ", groupCount=" + groupCount + ", personalCount=" + personalCount
				+ ", closedGroupCount=" + closedGroupCount + ", closedPersonalCount=" + closedPersonalCount
				+ ", lsCenterName=" + lsCenterName + ", reservedCount=" + reservedCount + ", attendedCount="
				+ attendedCount + ", absentCount=" + absentCount + ", reservedMembers=" + reservedMembers + ", atCode="
				+ atCode + ", lessonCode=" + lessonCode + "]";
	}
}