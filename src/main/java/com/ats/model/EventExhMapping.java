package com.ats.model;
 

public class EventExhMapping {
	 
	private int mapId; 
	private int exhId; 
	private int eventId; 
	private String eventName; 
	private String stallNo;
	private int isUsed;
	
	public String getStallNo() {
		return stallNo;
	}
	public void setStallNo(String stallNo) {
		this.stallNo = stallNo;
	}
	public int getMapId() {
		return mapId;
	}
	public void setMapId(int mapId) {
		this.mapId = mapId;
	}
	public int getExhId() {
		return exhId;
	}
	public void setExhId(int exhId) {
		this.exhId = exhId;
	}
	public int getEventId() {
		return eventId;
	}
	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public int getIsUsed() {
		return isUsed;
	}
	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}
	@Override
	public String toString() {
		return "EventExhMapping [mapId=" + mapId + ", exhId=" + exhId + ", eventId=" + eventId + ", eventName="
				+ eventName + ", stallNo=" + stallNo + ", isUsed=" + isUsed + "]";
	}
    
	

}
