package com.ats.model;
 

public class Organiser {
	
	 
	private int orgId; 
	private String orgName; 
	private String orgAddress; 
	private String orgContactNo; 
	private String orgEmailId; 
	private String websiteLink; 
	private int orgType; 
	private String aboutOrg; 
	private String workAreaKeywords; 
	private String userMob; 
	private String userPassword; 
	private int isActive; 
	private int isUsed;
	public int getOrgId() {
		return orgId;
	}
	public void setOrgId(int orgId) {
		this.orgId = orgId;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getOrgAddress() {
		return orgAddress;
	}
	public void setOrgAddress(String orgAddress) {
		this.orgAddress = orgAddress;
	}
	public String getOrgContactNo() {
		return orgContactNo;
	}
	public void setOrgContactNo(String orgContactNo) {
		this.orgContactNo = orgContactNo;
	}
	public String getOrgEmailId() {
		return orgEmailId;
	}
	public void setOrgEmailId(String orgEmailId) {
		this.orgEmailId = orgEmailId;
	}
	public String getWebsiteLink() {
		return websiteLink;
	}
	public void setWebsiteLink(String websiteLink) {
		this.websiteLink = websiteLink;
	}
	public int getOrgType() {
		return orgType;
	}
	public void setOrgType(int orgType) {
		this.orgType = orgType;
	}
	public String getAboutOrg() {
		return aboutOrg;
	}
	public void setAboutOrg(String aboutOrg) {
		this.aboutOrg = aboutOrg;
	}
	public String getWorkAreaKeywords() {
		return workAreaKeywords;
	}
	public void setWorkAreaKeywords(String workAreaKeywords) {
		this.workAreaKeywords = workAreaKeywords;
	}
	public String getUserMob() {
		return userMob;
	}
	public void setUserMob(String userMob) {
		this.userMob = userMob;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	public int getIsUsed() {
		return isUsed;
	}
	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}
	@Override
	public String toString() {
		return "Organiser [orgId=" + orgId + ", orgName=" + orgName + ", orgAddress=" + orgAddress + ", orgContactNo="
				+ orgContactNo + ", orgEmailId=" + orgEmailId + ", websiteLink=" + websiteLink + ", orgType=" + orgType
				+ ", aboutOrg=" + aboutOrg + ", workAreaKeywords=" + workAreaKeywords + ", userMob=" + userMob
				+ ", userPassword=" + userPassword + ", isActive=" + isActive + ", isUsed=" + isUsed + "]";
	}
	
	

}
