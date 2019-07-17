package com.example.ezentour.model.hotel.dto;

public class HotelRoomDTO {
	private int hr_h_no;
	private String hr_date;
	private int hr_room;

	public int getHr_h_no() {
		return hr_h_no;
	}

	public void setHr_h_no(int hr_h_no) {
		this.hr_h_no = hr_h_no;
	}

	public String getHr_date() {
		return hr_date;
	}

	public void setHr_date(String hr_date) {
		this.hr_date = hr_date;
	}

	public int getHr_room() {
		return hr_room;
	}

	public void setHr_room(int hr_room) {
		this.hr_room = hr_room;
	}

	public HotelRoomDTO(int hr_h_no, String hr_date, int hr_room) {
		super();
		this.hr_h_no = hr_h_no;
		this.hr_date = hr_date;
		this.hr_room = hr_room;
	}

	@Override
	public String toString() {
		return "HotelRoomDTO [hr_h_no=" + hr_h_no + ", hr_date=" + hr_date + ", hr_room=" + hr_room + "]";
	}

}
