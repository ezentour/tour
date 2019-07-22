package com.example.ezentour.model.home.dto;

public class HomeSearchDTO {
	private String checkin;
	private String checkout;
	private int hr_room;
	private int h_no;
	private String h_name;
	private String h_address;
	private String h_tel;
	private int h_price;
	private String h_approve;
	private String h_m_id;
	private String h_img;
	private String h_type;
	private String h_content;
	private int h_room;
	private int select_room;
	
	public HomeSearchDTO() {
		super();
	}

	public HomeSearchDTO(String checkin, String checkout, int hr_room, int h_no, String h_name, String h_address,
			String h_tel, int h_price, String h_approve, String h_m_id, String h_img, String h_type, String h_content,
			int h_room, int select_room) {
		super();
		this.checkin = checkin;
		this.checkout = checkout;
		this.hr_room = hr_room;
		this.h_no = h_no;
		this.h_name = h_name;
		this.h_address = h_address;
		this.h_tel = h_tel;
		this.h_price = h_price;
		this.h_approve = h_approve;
		this.h_m_id = h_m_id;
		this.h_img = h_img;
		this.h_type = h_type;
		this.h_content = h_content;
		this.h_room = h_room;
		this.select_room = select_room;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public int getHr_room() {
		return hr_room;
	}

	public void setHr_room(int hr_room) {
		this.hr_room = hr_room;
	}

	public int getH_no() {
		return h_no;
	}

	public void setH_no(int h_no) {
		this.h_no = h_no;
	}

	public String getH_name() {
		return h_name;
	}

	public void setH_name(String h_name) {
		this.h_name = h_name;
	}

	public String getH_address() {
		return h_address;
	}

	public void setH_address(String h_address) {
		this.h_address = h_address;
	}

	public String getH_tel() {
		return h_tel;
	}

	public void setH_tel(String h_tel) {
		this.h_tel = h_tel;
	}

	public int getH_price() {
		return h_price;
	}

	public void setH_price(int h_price) {
		this.h_price = h_price;
	}

	public String getH_approve() {
		return h_approve;
	}

	public void setH_approve(String h_approve) {
		this.h_approve = h_approve;
	}

	public String getH_m_id() {
		return h_m_id;
	}

	public void setH_m_id(String h_m_id) {
		this.h_m_id = h_m_id;
	}

	public String getH_img() {
		return h_img;
	}

	public void setH_img(String h_img) {
		this.h_img = h_img;
	}

	public String getH_type() {
		return h_type;
	}

	public void setH_type(String h_type) {
		this.h_type = h_type;
	}

	public String getH_content() {
		return h_content;
	}

	public void setH_content(String h_content) {
		this.h_content = h_content;
	}

	public int getH_room() {
		return h_room;
	}

	public void setH_room(int h_room) {
		this.h_room = h_room;
	}

	public int getSelect_room() {
		return select_room;
	}

	public void setSelect_room(int select_room) {
		this.select_room = select_room;
	}

	@Override
	public String toString() {
		return "HomeSearchDTO [checkin=" + checkin + ", checkout=" + checkout + ", hr_room=" + hr_room + ", h_no="
				+ h_no + ", h_name=" + h_name + ", h_address=" + h_address + ", h_tel=" + h_tel + ", h_price=" + h_price
				+ ", h_approve=" + h_approve + ", h_m_id=" + h_m_id + ", h_img=" + h_img + ", h_type=" + h_type
				+ ", h_content=" + h_content + ", h_room=" + h_room + ", select_room=" + select_room + "]";
	}

}
