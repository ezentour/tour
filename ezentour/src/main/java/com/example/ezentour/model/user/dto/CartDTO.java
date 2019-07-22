package com.example.ezentour.model.user.dto;

public class CartDTO {
	private int s_no;
	private int s_h_no;
	private String s_m_id;
	private String s_checkin;
	private String c_checkout;
	private String h_name;
	private int h_room;
	private String h_img;
	private String m_id;
	private int h_no;
	
	public CartDTO() {}
	
	public CartDTO(int s_h_no, String s_m_id, String s_checkin,String c_checkout) {
		super();
		this.s_h_no = s_h_no;
		this.s_m_id = s_m_id;
		this.s_checkin = s_checkin;
		this.c_checkout = c_checkout;
	}
	
	public CartDTO(int s_no,String h_name,String s_checkin,String c_checkout,String h_img,String m_id) {
		super();
		this.s_no = s_no;
		this.h_name = h_name;
		this.s_checkin = s_checkin;
		this.c_checkout = c_checkout;
		this.h_img = h_img;
		this.m_id = m_id;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public int getS_h_no() {
		return s_h_no;
	}

	public void setS_h_no(int s_h_no) {
		this.s_h_no = s_h_no;
	}

	public String getS_m_id() {
		return s_m_id;
	}

	public void setS_m_id(String s_m_id) {
		this.s_m_id = s_m_id;
	}

	public String getS_checkin() {
		return s_checkin;
	}

	public void setS_checkin(String s_checkin) {
		this.s_checkin = s_checkin;
	}

	public String getC_checkout() {
		return c_checkout;
	}

	public void setC_checkout(String c_checkout) {
		this.c_checkout = c_checkout;
	}

	public String getH_name() {
		return h_name;
	}

	public void setH_name(String h_name) {
		this.h_name = h_name;
	}

	public String getH_img() {
		return h_img;
	}

	public void setH_img(String h_img) {
		this.h_img = h_img;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	@Override
	public String toString() {
		return "CartDTO [s_no=" + s_no + ", s_h_no=" + s_h_no + ", s_m_id=" + s_m_id + ", s_checkin=" + s_checkin
				+ ", c_checkout=" + c_checkout + ", h_name=" + h_name + ", h_img=" + h_img + ", m_id=" + m_id + "]";
	}

	public int getH_no() {
		return h_no;
	}

	public void setH_no(int h_no) {
		this.h_no = h_no;
	}

	public int getH_room() {
		return h_room;
	}

	public void setH_room(int h_room) {
		this.h_room = h_room;
	}

}
