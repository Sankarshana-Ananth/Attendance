package com.PricolAttendance.spring.model;

public class User {
	private String userName;
	private String password;
	private int month=-1;
	private int year=-1;

	public String getUserName() {
		return userName;
	}

	public String getPassword(){return password;}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getMonth(){
		return month;
	}

	public int getYear(){
		return year;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public void setYear(int year) {
		this.year = year;
	}
}
