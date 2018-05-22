package com.ats.model;
 

public class ExhSubHeaderWithExhName {
	 
	private int subHeaderId; 
	private int exhId; 
	private String exhName; 
	private String fromDate; 
	private String toDate; 
	private int paymentStatus; 
	private float totolAmt; 
	private float paidAmt; 
	private float remAmt; 
	private int isUsed;
	 
	public int getSubHeaderId() {
		return subHeaderId;
	}
	public void setSubHeaderId(int subHeaderId) {
		this.subHeaderId = subHeaderId;
	}
	public int getExhId() {
		return exhId;
	}
	public void setExhId(int exhId) {
		this.exhId = exhId;
	}
	public String getExhName() {
		return exhName;
	}
	public void setExhName(String exhName) {
		this.exhName = exhName;
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
	public int getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(int paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	public float getTotolAmt() {
		return totolAmt;
	}
	public void setTotolAmt(float totolAmt) {
		this.totolAmt = totolAmt;
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
	public int getIsUsed() {
		return isUsed;
	}
	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}
	@Override
	public String toString() {
		return "ExhSubHeaderWithExhName [subHeaderId=" + subHeaderId + ", exhId=" + exhId + ", exhName=" + exhName
				+ ", fromDate=" + fromDate + ", toDate=" + toDate + ", paymentStatus=" + paymentStatus + ", totolAmt="
				+ totolAmt + ", paidAmt=" + paidAmt + ", remAmt=" + remAmt + ", isUsed=" + isUsed + "]";
	}
	
	

}
