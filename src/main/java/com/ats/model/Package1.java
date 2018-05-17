package com.ats.model;

public class Package1 {

	private int pkgId;
	private String pkgName;
	private int subDuration;
	private float pkgAmt;
	private int isUsed;
	public int getPkgId() {
		return pkgId;
	}
	public void setPkgId(int pkgId) {
		this.pkgId = pkgId;
	}
	public String getPkgName() {
		return pkgName;
	}
	public void setPkgName(String pkgName) {
		this.pkgName = pkgName;
	}
	public int getSubDuration() {
		return subDuration;
	}
	public void setSubDuration(int subDuration) {
		this.subDuration = subDuration;
	}
	public float getPkgAmt() {
		return pkgAmt;
	}
	public void setPkgAmt(float pkgAmt) {
		this.pkgAmt = pkgAmt;
	}
	public int getIsUsed() {
		return isUsed;
	}
	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}
	@Override
	public String toString() {
		return "Package1 [pkgId=" + pkgId + ", pkgName=" + pkgName + ", subDuration=" + subDuration + ", pkgAmt="
				+ pkgAmt + ", isUsed=" + isUsed + "]";
	}
	

}
