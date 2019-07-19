package com.example.ezentour.model.price.dto;

public class PriceDTO {

	private int p_no;
	private int p_r_no;
	private int p_admin;
	private int p_hostel;
	private int p_room;

	public PriceDTO() {
		super();
	}

	public PriceDTO(int p_r_no, int p_admin) {
		super();
		this.p_r_no = p_r_no;
		this.p_admin = p_admin;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public int getP_r_no() {
		return p_r_no;
	}

	public void setP_r_no(int p_r_no) {
		this.p_r_no = p_r_no;
	}

	public int getP_admin() {
		return p_admin;
	}

	public void setP_admin(int p_admin) {
		this.p_admin = p_admin;
	}

	public int getP_hostel() {
		return p_hostel;
	}

	public void setP_hostel(int p_hostel) {
		this.p_hostel = p_hostel;
	}

	public int getP_room() {
		return p_room;
	}

	public void setP_room(int p_room) {
		this.p_room = p_room;
	}

	@Override
	public String toString() {
		return "PriceDTO [p_no=" + p_no + ", p_r_no=" + p_r_no + ", p_admin=" + p_admin + ", p_hostel=" + p_hostel
				+ ", p_room=" + p_room + "]";
	}

	public PriceDTO(int p_no, int p_r_no, int p_admin, int p_hostel, int p_room) {
		super();
		this.p_no = p_no;
		this.p_r_no = p_r_no;
		this.p_admin = p_admin;
		this.p_hostel = p_hostel;
		this.p_room = p_room;
	}

}
