package com.ats.model;

public class EventSup {
	
	private int eventSupId;
	private int eventId;
	private float stallSize;
	private float priceForExh;
	private float discountedPrice;
	private	float discPer;
	private int isUsed;
	
	
	
	
	public int getEventSupId() {
		return eventSupId;
	}
	public int getEventId() {
		return eventId;
	}
	public float getStallSize() {
		return stallSize;
	}
	public float getPriceForExh() {
		return priceForExh;
	}
	public float getDiscountedPrice() {
		return discountedPrice;
	}
	public float getDiscPer() {
		return discPer;
	}
	public int getIsUsed() {
		return isUsed;
	}
	public void setEventSupId(int eventSupId) {
		this.eventSupId = eventSupId;
	}
	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	public void setStallSize(float stallSize) {
		this.stallSize = stallSize;
	}
	public void setPriceForExh(float priceForExh) {
		this.priceForExh = priceForExh;
	}
	public void setDiscountedPrice(float discountedPrice) {
		this.discountedPrice = discountedPrice;
	}
	public void setDiscPer(float discPer) {
		this.discPer = discPer;
	}
	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}
	
	@Override
	public String toString() {
		return "EventSup [eventSupId=" + eventSupId + ", eventId=" + eventId + ", stallSize=" + stallSize
				+ ", priceForExh=" + priceForExh + ", discountedPrice=" + discountedPrice + ", discPer=" + discPer
				+ ", isUsed=" + isUsed + "]";
	}
	

}
