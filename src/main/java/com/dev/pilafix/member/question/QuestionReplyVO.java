package com.dev.pilafix.member.question;

import java.sql.Date;

public class QuestionReplyVO {
	private int reNumber; //������ ��ȣ 700000���� ���� 
	private String reTitle;
	private String reContent;
	private String writerRoleCode; // �ۼ��ڱ����ڵ� : ME�̸� ȸ��, CE�� ���� 
	private int writerMemberCode; // �ۼ���ȸ���ڵ�
	private Date reRegdate; //DEFAULT NOW()
	//private Date reModifiedDate; // �亯���� ��������?
	private String reTargetPostType; //�������� : ���ǻ���orĿ�´�Ƽ 
	private int reTargetPostNumber; //���۹�ȣ
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
