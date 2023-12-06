package com.dev.pilafix.common.member;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class CenterVO {
	private int ctCode;
	private String ctName;
	private String ctPhoneNumber1;
	private String ctPhoneNumber2;
	private String ctPhoneNumber3;
	private String ctAddress1;
	private String ctAddress2;
	private String ctAddress3;
	private String ownerName;
	private String businessRegistrationNumber;
	private String ownerPhoneNumber1;
	private String ownerPhoneNumber2;
	private String ownerPhoneNumber3;
	private String ownerEmail;
	private Date contractStartDate;
	private Date contractEndDate;
	private boolean contractExpiryYn;
	private boolean contractRevokeYn;
	private Date ctRegistrationDate;
	private String ctId;
	private String ctPassword;
	private String roleCode;
	private MultipartFile multipart;
	private String businessRegistrationFilePath;
	
	//뱃지에서 사용하려고 추가
	private String memberCount;
	private String trainerCount;
	private String questionCount;
	
	// 통계에서 사용
	private int paymentCount;
	private String amountCount;
	private String centerMemberCount;
	private String lsName;
	
	// 수업명
	private String category;
	private int totalCount;

	
	public String getMemberCount() {
		return memberCount;
	}
	public void setMemberCount(String memberCount) {
		this.memberCount = memberCount;
	}
	public String getTrainerCount() {
		return trainerCount;
	}
	public void setTrainerCount(String trainerCount) {
		this.trainerCount = trainerCount;
	}
	public String getQuestionCount() {
		return questionCount;
	}
	public void setQuestionCount(String questionCount) {
		this.questionCount = questionCount;
	}
	public int getCtCode() {
		return ctCode;
	}
	public void setCtCode(int ctCode) {
		this.ctCode = ctCode;
	}
	public String getCtName() {
		return ctName;
	}
	public void setCtName(String ctName) {
		this.ctName = ctName;
	}
	public String getCtPhoneNumber1() {
		return ctPhoneNumber1;
	}
	public void setCtPhoneNumber1(String ctPhoneNumber1) {
		this.ctPhoneNumber1 = ctPhoneNumber1;
	}
	public String getCtPhoneNumber2() {
		return ctPhoneNumber2;
	}
	public void setCtPhoneNumber2(String ctPhoneNumber2) {
		this.ctPhoneNumber2 = ctPhoneNumber2;
	}
	public String getCtPhoneNumber3() {
		return ctPhoneNumber3;
	}
	public void setCtPhoneNumber3(String ctPhoneNumber3) {
		this.ctPhoneNumber3 = ctPhoneNumber3;
	}
	public String getCtAddress1() {
		return ctAddress1;
	}
	public void setCtAddress1(String ctAddress1) {
		this.ctAddress1 = ctAddress1;
	}
	public String getCtAddress2() {
		return ctAddress2;
	}
	public void setCtAddress2(String ctAddress2) {
		this.ctAddress2 = ctAddress2;
	}
	public String getCtAddress3() {
		return ctAddress3;
	}
	public void setCtAddress3(String ctAddress3) {
		this.ctAddress3 = ctAddress3;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getBusinessRegistrationNumber() {
		return businessRegistrationNumber;
	}
	public void setBusinessRegistrationNumber(String businessRegistrationNumber) {
		this.businessRegistrationNumber = businessRegistrationNumber;
	}
	public String getOwnerPhoneNumber1() {
		return ownerPhoneNumber1;
	}
	public void setOwnerPhoneNumber1(String ownerPhoneNumber1) {
		this.ownerPhoneNumber1 = ownerPhoneNumber1;
	}
	public String getOwnerPhoneNumber2() {
		return ownerPhoneNumber2;
	}
	public void setOwnerPhoneNumber2(String ownerPhoneNumber2) {
		this.ownerPhoneNumber2 = ownerPhoneNumber2;
	}
	public String getOwnerPhoneNumber3() {
		return ownerPhoneNumber3;
	}
	public void setOwnerPhoneNumber3(String ownerPhoneNumber3) {
		this.ownerPhoneNumber3 = ownerPhoneNumber3;
	}
	public String getOwnerEmail() {
		return ownerEmail;
	}
	public void setOwnerEmail(String ownerEmail) {
		this.ownerEmail = ownerEmail;
	}
	public Date getContractStartDate() {
		return contractStartDate;
	}
	public void setContractStartDate(Date contractStartDate) {
		this.contractStartDate = contractStartDate;
	}
	public Date getContractEndDate() {
		return contractEndDate;
	}
	public void setContractEndDate(Date contractEndDate) {
		this.contractEndDate = contractEndDate;
	}
	public boolean isContractExpiryYn() {
		return contractExpiryYn;
	}
	public void setContractExpiryYn(boolean contractExpiryYn) {
		this.contractExpiryYn = contractExpiryYn;
	}
	public boolean isContractRevokeYn() {
		return contractRevokeYn;
	}
	public void setContractRevokeYn(boolean contractRevokeYn) {
		this.contractRevokeYn = contractRevokeYn;
	}
	public Date getCtRegistrationDate() {
		return ctRegistrationDate;
	}
	public void setCtRegistrationDate(Date ctRegistrationDate) {
		this.ctRegistrationDate = ctRegistrationDate;
	}
	public String getCtId() {
		return ctId;
	}
	public void setCtId(String ctId) {
		this.ctId = ctId;
	}
	public String getCtPassword() {
		return ctPassword;
	}
	public void setCtPassword(String ctPassword) {
		this.ctPassword = ctPassword;
	}
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	public MultipartFile getMultipart() {
		return multipart;
	}
	public void setMultipart(MultipartFile multipart) {
		this.multipart = multipart;
	}
	public String getBusinessRegistrationFilePath() {
		return businessRegistrationFilePath;
	}
	public void setBusinessRegistrationFilePath(String businessRegistrationFilePath) {
		this.businessRegistrationFilePath = businessRegistrationFilePath;
	}
	
	public int getPaymentCount() {
		return paymentCount;
	}
	public void setPaymentCount(int paymentCount) {
		this.paymentCount = paymentCount;
	}
	public String getAmountCount() {
		return amountCount;
	}
	public void setAmountCount(String amountCount) {
		this.amountCount = amountCount;
	}
	
	public String getCenterMemberCount() {
		return centerMemberCount;
	}
	public void setCenterMemberCount(String centerMemberCount) {
		this.centerMemberCount = centerMemberCount;
	}
	
	public String getLsName() {
		return lsName;
	}
	public void setLsName(String lsName) {
		this.lsName = lsName;
	}
	

	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	@Override
	public String toString() {
		return "CenterVO [ctCode=" + ctCode + ", ctName=" + ctName + ", ctPhoneNumber1=" + ctPhoneNumber1
				+ ", ctPhoneNumber2=" + ctPhoneNumber2 + ", ctPhoneNumber3=" + ctPhoneNumber3 + ", ctAddress1="
				+ ctAddress1 + ", ctAddress2=" + ctAddress2 + ", ctAddress3=" + ctAddress3 + ", ownerName=" + ownerName
				+ ", businessRegistrationNumber=" + businessRegistrationNumber + ", ownerPhoneNumber1="
				+ ownerPhoneNumber1 + ", ownerPhoneNumber2=" + ownerPhoneNumber2 + ", ownerPhoneNumber3="
				+ ownerPhoneNumber3 + ", ownerEmail=" + ownerEmail + ", contractStartDate=" + contractStartDate
				+ ", contractEndDate=" + contractEndDate + ", contractExpiryYn=" + contractExpiryYn
				+ ", contractRevokeYn=" + contractRevokeYn + ", ctRegistrationDate=" + ctRegistrationDate + ", ctId="
				+ ctId + ", ctPassword=" + ctPassword + ", roleCode=" + roleCode + ", multipart=" + multipart
				+ ", businessRegistrationFilePath=" + businessRegistrationFilePath + ", memberCount=" + memberCount
				+ ", trainerCount=" + trainerCount + ", questionCount=" + questionCount + ", paymentCount="
				+ paymentCount + ", amountCount=" + amountCount + ", centerMemberCount=" + centerMemberCount
				+ ", lsName=" + lsName + ", category=" + category + ", totalCount=" + totalCount
				+ "]";
	}
	
	
	
	
}