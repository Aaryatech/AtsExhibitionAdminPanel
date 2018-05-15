package com.ats.model;
 

public class LoginResponse {
	
	private boolean error;
	private String msg;
	private Organiser organiser;
	public boolean isError() {
		return error;
	}
	public void setError(boolean error) {
		this.error = error;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Organiser getOrganiser() {
		return organiser;
	}
	public void setOrganiser(Organiser organiser) {
		this.organiser = organiser;
	}
	@Override
	public String toString() {
		return "LoginResponse [error=" + error + ", msg=" + msg + ", organiser=" + organiser + "]";
	}
	
	

}
