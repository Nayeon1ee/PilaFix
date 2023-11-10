package com.dev.pilafix.center.question_reply;

import java.sql.Date;
import java.util.List;

import com.dev.pilafix.member.question.QuestionVO;

public class QuestionReplyVO {

	private int reNumber; // �亯��ȣ ������ 700���� ����
	private String reTitle; // �亯����
	private String reContent; // �亯����
	private String writerRoleCode; // �ۼ��ڱ����ڵ� : ME�̸� ȸ��, CE�� ���� 
	private int writerMemberCode; // �ۼ���ȸ���ڵ�
	private Date reRegdate; // �ۼ��Ͻ� DEFAULT NOW()
	private String reTargetPostType; // �������� : ���ǻ���orĿ�´�Ƽ
	//FAQ:FAQ, ��������_����:INFO_C, ��������_��:INFO_W, ���ǻ���:QST, Ŀ�´�Ƽ:CMT, �亯:REP
	private int reTargetPostNumber; // ���۹�ȣ
	
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
