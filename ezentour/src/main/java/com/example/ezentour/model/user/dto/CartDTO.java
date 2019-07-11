package com.example.ezentour.model.user.dto;

import java.util.Date;

public class CartDTO {
	private int s_no;
	private int s_h_no;
	private String s_m_id;
	private String s_checkin;
	private String c_checkout;
	
	public CartDTO() {}
	
	public CartDTO(int s_no, int s_h_no, String s_m_id, String s_checkin, String c_checkout) {
		super();
		this.s_no = s_no;
		this.s_h_no = s_h_no;
		this.s_m_id = s_m_id;
		this.s_checkin = s_checkin;
		this.c_checkout = c_checkout;
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

	@Override
	public String toString() {
		return "CartDTO [s_no=" + s_no + ", s_h_no=" + s_h_no + ", s_m_id=" + s_m_id + ", s_checkin=" + s_checkin
				+ ", c_checkout=" + c_checkout + "]";
	}
	
}
