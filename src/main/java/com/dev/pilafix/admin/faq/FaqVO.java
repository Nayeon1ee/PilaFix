package com.dev.pilafix.admin.faq;

import java.util.Date;

public class FaqVO {
	private int fq_number;
	private String fq_title;
	private String fq_content;
	private String fq_writer_member_code;
	
	private Date fq_regDate;
	private boolean fq_open_yn;
	
	public int getFq_number() {
		return fq_number;
	}
	public void setFq_number(int fq_number) {
		this.fq_number = fq_number;
	}
	public String getFq_title() {
		return fq_title;
	}
	public void setFq_title(String fq_title) {
		this.fq_title = fq_title;
	}
	public String getFq_content() {
		return fq_content;
	}
	public void setFq_content(String fq_content) {
		this.fq_content = fq_content;
	}
	public String getFq_writer_member_code() {
		return fq_writer_member_code;
	}
	public void setFq_writer_member_code(String fq_writer_member_code) {
		this.fq_writer_member_code = fq_writer_member_code;
	}
	
	public Date getFq_regDate() {
		return fq_regDate;
	}
	public void setFq_regDate(Date fq_regDate) {
		this.fq_regDate = fq_regDate;
	}
	public boolean isFq_open_yn() {
		return fq_open_yn;
	}
	public void setFq_open_yn(boolean fq_open_yn) {
		this.fq_open_yn = fq_open_yn;
	}
	@Override
	public String toString() {
		return "FaqVO [fq_number=" + fq_number + ", fq_title=" + fq_title + ", fq_content=" + fq_content
				+ ", fq_writer_member_code=" + fq_writer_member_code + ", fq_regDate=" + fq_regDate + ", fq_open_yn="
				+ fq_open_yn + "]";
	}
	

}
