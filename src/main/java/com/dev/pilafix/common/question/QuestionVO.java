package com.dev.pilafix.common.question;

import java.sql.Date;

public class QuestionVO {
	private int qsNumber;//시퀀스 번호 250000부터 시작
	private String qsTitle;
	private String qsContent;
	private int qsWriterMemberCode; //작성자회원코드
	private Date qsRegdate; //DEFAULT NOW()
	private Date qsModifiedDate;
	private boolean qsAnswerYn;//답변여부
    private String qstWriterName; // 문의사항 작성자 이름
    private String connectedCenterName1; // 연동된 센터1 이름
    private String connectedCenterName2; // 연동된 센터2 이름
    private String connectedCenterName3; // 연동된 센터3 이름
    private int selectedCenterCode; // 사용자가 선택한 센터 코드
	private int centerCode; //tbl_question에 추가된 컬럼
	
    
    

	public int getCenterCode() {
		return centerCode;
	}
	public void setCenterCode(int centerCode) {
		this.centerCode = centerCode;
	}
	public int getSelectedCenterCode() {
		return selectedCenterCode;
	}
	public void setSelectedCenterCode(int selectedCenterCode) {
		this.selectedCenterCode = selectedCenterCode;
	}
	public String getConnectedCenterName1() {
		return connectedCenterName1;
	}
	public void setConnectedCenterName1(String connectedCenterName1) {
		this.connectedCenterName1 = connectedCenterName1;
	}
	public String getConnectedCenterName2() {
		return connectedCenterName2;
	}
	public void setConnectedCenterName2(String connectedCenterName2) {
		this.connectedCenterName2 = connectedCenterName2;
	}
	public String getConnectedCenterName3() {
		return connectedCenterName3;
	}
	public void setConnectedCenterName3(String connectedCenterName3) {
		this.connectedCenterName3 = connectedCenterName3;
	}
	public String getQstWriterName() {
		return qstWriterName;
	}
	public void setQstWriterName(String qstWriterName) {
		this.qstWriterName = qstWriterName;
	}
	public int getQsNumber() {
		return qsNumber;
	}
	public void setQsNumber(int qsNumber) {
		this.qsNumber = qsNumber;
	}
	public String getQsTitle() {
		return qsTitle;
	}
	public void setQsTitle(String qsTitle) {
		this.qsTitle = qsTitle;
	}
	public String getQsContent() {
		return qsContent;
	}
	public void setQsContent(String qsContent) {
		this.qsContent = qsContent;
	}
	public int getQsWriterMemberCode() {
		return qsWriterMemberCode;
	}
	public void setQsWriterMemberCode(int qsWriterMemberCode) {
		this.qsWriterMemberCode = qsWriterMemberCode;
	}
	public Date getQsRegdate() {
		return qsRegdate;
	}
	public void setQsRegdate(Date qsRegdate) {
		this.qsRegdate = qsRegdate;
	}
	public boolean isQsAnswerYn() {
		return qsAnswerYn;
	}
	public void setQsAnswerYn(boolean qsAnswerYn) {
		this.qsAnswerYn = qsAnswerYn;
	}
	public Date getQsModifiedDate() {
		return qsModifiedDate;
	}
	public void setQsModifiedDate(Date qsModifiedDate) {
		this.qsModifiedDate = qsModifiedDate;
	}
	@Override
	public String toString() {
		return "QuestionVO [qsNumber=" + qsNumber + ", qsTitle=" + qsTitle + ", qsContent=" + qsContent
				+ ", qsWriterMemberCode=" + qsWriterMemberCode + ", qsRegdate=" + qsRegdate + ", qsModifiedDate="
				+ qsModifiedDate + ", qsAnswerYn=" + qsAnswerYn + ", qstWriterName=" + qstWriterName
				+ ", connectedCenterName1=" + connectedCenterName1 + ", connectedCenterName2=" + connectedCenterName2
				+ ", connectedCenterName3=" + connectedCenterName3 + ", selectedCenterCode=" + selectedCenterCode
				+ ", centerCode=" + centerCode + "]";
	}
	
}