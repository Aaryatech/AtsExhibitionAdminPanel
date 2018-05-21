package com.ats.model;

public class GetFloarMap{
	

    private int floarMapId;
	
	private int eventId;
	
	private String eventName;
	
    private String floarMap1;
    
    private String floarMap2;
    
    private String floarMap3;
    
    private String floarMap4;
    
    private int isUsed;

	public int getFloarMapId() {
		return floarMapId;
	}

	public int getEventId() {
		return eventId;
	}

	public String getEventName() {
		return eventName;
	}

	public String getFloarMap1() {
		return floarMap1;
	}

	public String getFloarMap2() {
		return floarMap2;
	}

	public String getFloarMap3() {
		return floarMap3;
	}

	public String getFloarMap4() {
		return floarMap4;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setFloarMapId(int floarMapId) {
		this.floarMapId = floarMapId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public void setFloarMap1(String floarMap1) {
		this.floarMap1 = floarMap1;
	}

	public void setFloarMap2(String floarMap2) {
		this.floarMap2 = floarMap2;
	}

	public void setFloarMap3(String floarMap3) {
		this.floarMap3 = floarMap3;
	}

	public void setFloarMap4(String floarMap4) {
		this.floarMap4 = floarMap4;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	@Override
	public String toString() {
		return "GetFloarMap [floarMapId=" + floarMapId + ", eventId=" + eventId + ", eventName=" + eventName
				+ ", floarMap1=" + floarMap1 + ", floarMap2=" + floarMap2 + ", floarMap3=" + floarMap3 + ", floarMap4="
				+ floarMap4 + ", isUsed=" + isUsed + "]";
	}

    

}
