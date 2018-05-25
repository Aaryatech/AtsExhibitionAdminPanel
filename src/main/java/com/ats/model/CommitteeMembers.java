package com.ats.model;
 

public class CommitteeMembers {
	
	 
	private int memId; 
	private int orgId; 
	private String memberName; 
	private String designation; 
	private String contactNo; 
	private String emailId; 
	private String companyName; 
	private String remark; 
	private int isUsed;
	private String image;
	
	public int getMemId() {
		return memId;
	}
	public void setMemId(int memId) {
		this.memId = memId;
	}
	public int getOrgId() {
		return orgId;
	}
	public void setOrgId(int orgId) {
		this.orgId = orgId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getIsUsed() {
		return isUsed;
	}
	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "CommitteeMembers [memId=" + memId + ", orgId=" + orgId + ", memberName=" + memberName + ", designation="
				+ designation + ", contactNo=" + contactNo + ", emailId=" + emailId + ", companyName=" + companyName
				+ ", remark=" + remark + ", isUsed=" + isUsed + ", image=" + image + "]";
	}
	
	

}
