package com.example.ezentour.model.hotel.dto;

public class HotelDTO {
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
	
	public HotelDTO() {}
	
	public HotelDTO(int h_no, String h_name, String h_address, String h_tel, int h_price, String h_approve,
			String h_m_id, String h_img, String h_type, String h_content) {
		super();
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

	@Override
	public String toString() {
		return "HotelDTO [h_no=" + h_no + ", h_name=" + h_name + ", h_address=" + h_address + ", h_tel=" + h_tel
				+ ", h_price=" + h_price + ", h_approve=" + h_approve + ", h_m_id=" + h_m_id + ", h_img=" + h_img
				+ ", h_type=" + h_type + ", h_content=" + h_content + "]";
	}
	
}
