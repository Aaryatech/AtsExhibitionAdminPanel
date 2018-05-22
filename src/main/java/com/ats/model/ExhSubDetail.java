package com.ats.model;
 

public class ExhSubDetail {

	 
	private int subDetailId; 
	private int subHeaderId; 
	private String paymentDate; 
	private float paymentAmt; 
	private int paymentMode; 
	private String trNo; 
	private String bankName; 
	private String chequeDate; 
	private int isUsed;
	public int getSubDetailId() {
		return subDetailId;
	}
	public void setSubDetailId(int subDetailId) {
		this.subDetailId = subDetailId;
	}
	public int getSubHeaderId() {
		return subHeaderId;
	}
	public void setSubHeaderId(int subHeaderId) {
		this.subHeaderId = subHeaderId;
	}
	public String getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}
	public float getPaymentAmt() {
		return paymentAmt;
	}
	public void setPaymentAmt(float paymentAmt) {
		this.paymentAmt = paymentAmt;
	}
	public int getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(int paymentMode) {
		this.paymentMode = paymentMode;
	}
	public String getTrNo() {
		return trNo;
	}
	public void setTrNo(String trNo) {
		this.trNo = trNo;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getChequeDate() {
		return chequeDate;
	}
	public void setChequeDate(String chequeDate) {
		this.chequeDate = chequeDate;
	}
	public int getIsUsed() {
		return isUsed;
	}
	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}
	@Override
	public String toString() {
		return "ExhSubDetail [subDetailId=" + subDetailId + ", subHeaderId=" + subHeaderId + ", paymentDate="
				+ paymentDate + ", paymentAmt=" + paymentAmt + ", paymentMode=" + paymentMode + ", trNo=" + trNo
				+ ", bankName=" + bankName + ", chequeDate=" + chequeDate + ", isUsed=" + isUsed + "]";
	}
	
	
}
