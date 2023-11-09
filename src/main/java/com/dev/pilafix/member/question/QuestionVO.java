package com.dev.pilafix.member.question;

import java.sql.Date;

public class QuestionVO {
	private int qsNumber;//시퀀스 번호 250000부터 시작
	private String qsTitle;
	private String qsContent;
	private int qsWriterMemberCode; //작성자회원코드
	private Date qsRegdate; //DEFAULT NOW()
	private Date qsModifiedDate;
	private boolean qsAnswerYn;//답변여부

	
	
	
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
				+ qsModifiedDate + ", qsAnswerYn=" + qsAnswerYn + "]";
	}

	
	
	
	
	
	
	
	
	

	

	
}