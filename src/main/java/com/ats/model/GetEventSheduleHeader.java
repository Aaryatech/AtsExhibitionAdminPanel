package com.ats.model;
 
import java.util.List;
 

public class GetEventSheduleHeader {
	 
	private int scheduleId; 
	private int eventId; 
	private String date; 
	private String dayName; 
	private int isUsed; 
	List<GetEventSheduleDetail> getEventSheduleDetailList;
	public int getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}
	public int getEventId() {
		return eventId;
	}
	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDayName() {
		return dayName;
	}
	public void setDayName(String dayName) {
		this.dayName = dayName;
	}
	public int getIsUsed() {
		return isUsed;
	}
	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}
	public List<GetEventSheduleDetail> getGetEventSheduleDetailList() {
		return getEventSheduleDetailList;
	}
	public void setGetEventSheduleDetailList(List<GetEventSheduleDetail> getEventSheduleDetailList) {
		this.getEventSheduleDetailList = getEventSheduleDetailList;
	}
	@Override
	public String toString() {
		return "GetEventSheduleHeader [scheduleId=" + scheduleId + ", eventId=" + eventId + ", date=" + date
				+ ", dayName=" + dayName + ", isUsed=" + isUsed + ", getEventSheduleDetailList="
				+ getEventSheduleDetailList + "]";
	}
	
	

}
