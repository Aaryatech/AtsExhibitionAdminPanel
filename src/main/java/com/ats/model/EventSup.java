package com.ats.model;



public class EventSup  {

	
	private int eventSupId;
	
	private int eventId;
	
	private float stallSize;
	
	private float priceForExh;
	
	private float discountedPrice;
	
	private int isUsed;
	
	private float discPer;
	
	
	public int getEventSupId() {
		return eventSupId;
	}

	public int getEventId() {
		return eventId;
	}

	
	public float getPriceForExh() {
		return priceForExh;
	}

	public float getDiscountedPrice() {
		return discountedPrice;
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


	public void setPriceForExh(float priceForExh) {
		this.priceForExh = priceForExh;
	}

	public void setDiscountedPrice(float discountedPrice) {
		this.discountedPrice = discountedPrice;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	public float getStallSize() {
		return stallSize;
	}

	public void setStallSize(float stallSize) {
		this.stallSize = stallSize;
	}

	public float getDiscPer() {
		return discPer;
	}

	public void setDiscPer(float discPer) {
		this.discPer = discPer;
	}

	@Override
	public String toString() {
		return "EventSup [eventSupId=" + eventSupId + ", eventId=" + eventId + ", stallSize=" + stallSize
				+ ", priceForExh=" + priceForExh + ", discountedPrice=" + discountedPrice + ", isUsed=" + isUsed
				+ ", discPer=" + discPer + "]";
	}

	
}
