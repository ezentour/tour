package com.example.ezentour.model.home.dto;

import java.util.Date;

public class HomeSearchDTO {
	private String h_address;
	private Date checkin;
	private Date checkout;
	private int hr_room;
	private String h_type;
	
	public HomeSearchDTO() {
		super();
	}

	public HomeSearchDTO(String h_address, Date checkin, Date checkout, int hr_room, String h_type) {
		super();
		this.h_address = h_address;
		this.checkin = checkin;
		this.checkout = checkout;
		this.hr_room = hr_room;
		this.h_type = h_type;
	}

	public String getH_address() {
		return h_address;
	}

	public void setH_address(String h_address) {
		this.h_address = h_address;
	}

	public Date getCheckin() {
		return checkin;
	}

	public void setCheckin(Date checkin) {
		this.checkin = checkin;
	}

	public Date getCheckout() {
		return checkout;
	}

	public void setCheckout(Date checkout) {
		this.checkout = checkout;
	}

	public int getHr_room() {
		return hr_room;
	}

	public void setHr_room(int hr_room) {
		this.hr_room = hr_room;
	}

	public String getH_type() {
		return h_type;
	}

	public void setH_type(String h_type) {
		this.h_type = h_type;
	}

	@Override
	public String toString() {
		return "HomeSearchDTO [h_address=" + h_address + ", checkin=" + checkin + ", checkout=" + checkout
				+ ", hr_room=" + hr_room + ", h_type=" + h_type + "]";
	}

}
