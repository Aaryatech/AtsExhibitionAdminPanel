package com.ats.model;

public class OrgSubscription {

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
	@Override
	public String toString() {
		return "OrgSubscription [subId=" + subId + ", orgId=" + orgId + ", fromDate=" + fromDate + ", toDate=" + toDate
				+ ", transDatetime=" + transDatetime + ", pkgId=" + pkgId + ", pkgAmt=" + pkgAmt + ", paidAmt="
				+ paidAmt + ", remAmt=" + remAmt + ", status=" + status + ", isUsed=" + isUsed + "]";
	}
	
	

}
