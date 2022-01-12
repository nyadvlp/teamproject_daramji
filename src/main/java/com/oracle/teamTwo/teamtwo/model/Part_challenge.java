package com.oracle.teamTwo.teamtwo.model;

public class Part_challenge {

	private String user_id_email;
	private int chg_num;
	private int batting_point;
	private double chg_days;
	private double confirm_count;

	public String getUser_id_email() {
		return user_id_email;
	}

	public void setUser_id_email(String user_id_email) {
		this.user_id_email = user_id_email;
	}

	public int getChg_num() {
		return chg_num;
	}

	public void setChg_num(int chg_num) {
		this.chg_num = chg_num;
	}

	public int getBatting_point() {
		return batting_point;
	}

	public void setBatting_point(int batting_point) {
		this.batting_point = batting_point;
	}

	public double getConfirm_count() {
		return confirm_count;
	}

	public void setConfirm_count(double confirm_count) {
		this.confirm_count = confirm_count;
	}

	public double getChg_days() {
		return chg_days;
	}

	public void setChg_days(double chg_days) {
		this.chg_days = chg_days;
	}


}
