package com.ats.model;
 

public class GetEventSheduleDetail { 
	
	private int scheduleDetailId; 
	private int scheduleId; 
	private String topic; 
	private String fromTime; 
	private String toTime; 
	private String venue; 
	private String speaker; 
	private String remark; 
	private int seatsAvailable; 
	private int isUsed;
	public int getScheduleDetailId() {
		return scheduleDetailId;
	}
	public void setScheduleDetailId(int scheduleDetailId) {
		this.scheduleDetailId = scheduleDetailId;
	}
	public int getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getFromTime() {
		return fromTime;
	}
	public void setFromTime(String fromTime) {
		this.fromTime = fromTime;
	}
	public String getToTime() {
		return toTime;
	}
	public void setToTime(String toTime) {
		this.toTime = toTime;
	}
	public String getVenue() {
		return venue;
	}
	public void setVenue(String venue) {
		this.venue = venue;
	}
	public String getSpeaker() {
		return speaker;
	}
	public void setSpeaker(String speaker) {
		this.speaker = speaker;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getSeatsAvailable() {
		return seatsAvailable;
	}
	public void setSeatsAvailable(int seatsAvailable) {
		this.seatsAvailable = seatsAvailable;
	}
	public int getIsUsed() {
		return isUsed;
	}
	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}
	@Override
	public String toString() {
		return "GetEventSheduleDetail [scheduleDetailId=" + scheduleDetailId + ", scheduleId=" + scheduleId + ", topic="
				+ topic + ", fromTime=" + fromTime + ", toTime=" + toTime + ", venue=" + venue + ", speaker=" + speaker
				+ ", remark=" + remark + ", seatsAvailable=" + seatsAvailable + ", isUsed=" + isUsed + "]";
	}
	
	

}
