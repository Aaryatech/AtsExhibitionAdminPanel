package com.ats.model;

public class OrgSubscriptionWithName {

	private int subId;
	private int orgId;
	private String fromDate;
	private String toDate;
	private String transDatetime;
	private int pkgId;
	private float pkgAmt;
	private float paidAmt;
	private float remAmt;
	private int status;
	private int isUsed;
	private String orgName;
	private String pkgName;

	public int getSubId() {
		return subId;
	}

	public void setSubId(int subId) {
		this.subId = subId;
	}

	public int getOrgId() {
		return orgId;
	}

	public void setOrgId(int orgId) {
		this.orgId = orgId;
	}

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public String getTransDatetime() {
		return transDatetime;
	}

	public void setTransDatetime(String transDatetime) {
		this.transDatetime = transDatetime;
	}

	public int getPkgId() {
		return pkgId;
	}

	public void setPkgId(int pkgId) {
		this.pkgId = pkgId;
	}

	public float getPkgAmt() {
		return pkgAmt;
	}

	public void setPkgAmt(float pkgAmt) {
		this.pkgAmt = pkgAmt;
	}

	public float getPaidAmt() {
		return paidAmt;
	}

	public void setPaidAmt(float paidAmt) {
		this.paidAmt = paidAmt;
	}

	public float getRemAmt() {
		return remAmt;
	}

	public void setRemAmt(float remAmt) {
		this.remAmt = remAmt;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getPkgName() {
		return pkgName;
	}

	public void setPkgName(String pkgName) {
		this.pkgName = pkgName;
	}

	@Override
	public String toString() {
		return "OrgSubscriptionWithName [subId=" + subId + ", orgId=" + orgId + ", fromDate=" + fromDate + ", toDate="
				+ toDate + ", transDatetime=" + transDatetime + ", pkgId=" + pkgId + ", pkgAmt=" + pkgAmt + ", paidAmt="
				+ paidAmt + ", remAmt=" + remAmt + ", status=" + status + ", isUsed=" + isUsed + ", orgName=" + orgName
				+ ", pkgName=" + pkgName + "]";
	}

}
