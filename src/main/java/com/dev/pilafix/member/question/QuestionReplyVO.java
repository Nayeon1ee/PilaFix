package com.dev.pilafix.member.question;

import java.sql.Date;

public class QuestionReplyVO {
	private int reNumber; //시퀀스 번호 700000부터 시작 
	private String reTitle;
	private String reContent;
	private String writerRoleCode; // 작성자권한코드 : ME이면 회원, CE면 센터 
	private int writerMemberCode; // 작성자회원코드
	private Date reRegdate; //DEFAULT NOW()
	//private Date reModifiedDate; // 답변에도 수정일자?
	private String reTargetPostType; //원글유형 : 문의사항or커뮤니티 
	private int reTargetPostNumber; //원글번호
	public int getReNumber() {
		return reNumber;
	}
	public void setReNumber(int reNumber) {
		this.reNumber = reNumber;
	}
	public String getReTitle() {
		return reTitle;
	}
	public void setReTitle(String reTitle) {
		this.reTitle = reTitle;
	}
	public String getReContent() {
		return reContent;
	}
	public void setReContent(String reContent) {
		this.reContent = reContent;
	}
	public String getWriterRoleCode() {
		return writerRoleCode;
	}
	public void setWriterRoleCode(String writerRoleCode) {
		this.writerRoleCode = writerRoleCode;
	}
	public int getWriterMemberCode() {
		return writerMemberCode;
	}
	public void setWriterMemberCode(int writerMemberCode) {
		this.writerMemberCode = writerMemberCode;
	}
	public Date getReRegdate() {
		return reRegdate;
	}
	public void setReRegdate(Date reRegdate) {
		this.reRegdate = reRegdate;
	}
	public String getReTargetPostType() {
		return reTargetPostType;
	}
	public void setReTargetPostType(String reTargetPostType) {
		this.reTargetPostType = reTargetPostType;
	}
	public int getReTargetPostNumber() {
		return reTargetPostNumber;
	}
	public void setReTargetPostNumber(int reTargetPostNumber) {
		this.reTargetPostNumber = reTargetPostNumber;
	}
	@Override
	public String toString() {
		return "QuestionReplyVO [reNumber=" + reNumber + ", reTitle=" + reTitle + ", reContent=" + reContent
				+ ", writerRoleCode=" + writerRoleCode + ", writerMemberCode=" + writerMemberCode + ", reRegdate="
				+ reRegdate + ", reTargetPostType=" + reTargetPostType + ", reTargetPostNumber=" + reTargetPostNumber
				+ "]";
	}
	
	
}
