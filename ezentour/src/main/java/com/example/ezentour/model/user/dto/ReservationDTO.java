package com.example.ezentour.model.user.dto;

public class ReservationDTO {
	private Integer r_no;
	private String r_m_id;
	private int r_h_no;
	private String r_checkin;
	private String r_checkout;
	private String r_cancel;
	private int r_room;
	private String h_name;

	public int getR_room() {
		return r_room;
	}

	public void setR_room(int r_room) {
		this.r_room = r_room;
	}

	public Integer getR_no() {
		return r_no;
	}

	public void setR_no(Integer r_no) {
		this.r_no = r_no;
	}

	public String getR_m_id() {
		return r_m_id;
	}

	public void setR_m_id(String r_m_id) {
		this.r_m_id = r_m_id;
	}

	public int getR_h_no() {
		return r_h_no;
	}

	public void setR_h_no(int r_h_no) {
		this.r_h_no = r_h_no;
	}

	public String getR_checkin() {
		return r_checkin;
	}

	public void setR_checkin(String r_checkin) {
		this.r_checkin = r_checkin;
	}

	public String getR_checkout() {
		return r_checkout;
	}

	public void setR_checkout(String r_checkout) {
		this.r_checkout = r_checkout;
	}

	public String getR_cancel() {
		return r_cancel;
	}

	public void setR_cancel(String r_cancel) {
		this.r_cancel = r_cancel;
	}

	@Override
	public String toString() {
		return "ReservationDTO [r_no=" + r_no + ", r_m_id=" + r_m_id + ", r_h_no=" + r_h_no + ", r_checkin=" + r_checkin
				+ ", r_checkout=" + r_checkout + ", r_cancel=" + r_cancel + ", r_room=" + r_room + "]";
	}

	public String getH_name() {
		return h_name;
	}

	public void setH_name(String h_name) {
		this.h_name = h_name;
	}



}
