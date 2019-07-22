package com.example.ezentour.model.hotel.dto;

public class HotelReviewDTO {
	private int hre_no;
	private int hre_h_no;
	private String hre_m_id;
	private String hre_comment;
	private int hre_score;
	private String hre_date;
	private String m_id;

	public HotelReviewDTO(int hre_no, int hre_h_no, String hre_m_id, String hre_comment, int hre_score, String hre_date,
			String m_id) {
		this.hre_no = hre_no;
		this.hre_h_no = hre_h_no;
		this.hre_m_id = hre_m_id;
		this.hre_comment = hre_comment;
		this.hre_score = hre_score;
		this.hre_date = hre_date;
		this.m_id = m_id;
	}

	public HotelReviewDTO() {
	}

	public int getHre_no() {
		return hre_no;
	}

	public void setHre_no(int hre_no) {
		this.hre_no = hre_no;
	}

	public int getHre_h_no() {
		return hre_h_no;
	}

	public void setHre_h_no(int hre_h_no) {
		this.hre_h_no = hre_h_no;
	}

	public String getHre_m_id() {
		return hre_m_id;
	}

	public void setHre_m_id(String hre_m_id) {
		this.hre_m_id = hre_m_id;
	}

	public String getHre_comment() {
		return hre_comment;
	}

	public void setHre_comment(String hre_comment) {
		this.hre_comment = hre_comment;
	}

	public int getHre_score() {
		return hre_score;
	}

	public void setHre_score(int hre_score) {
		this.hre_score = hre_score;
	}

	public String getHre_date() {
		return hre_date;
	}

	public void setHre_date(String hre_date) {
		this.hre_date = hre_date;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	@Override
	public String toString() {
		return "HotelReviewDTO [hre_no=" + hre_no + ", hre_h_no=" + hre_h_no + ", hre_m_id=" + hre_m_id
				+ ", hre_comment=" + hre_comment + ", hre_score=" + hre_score + ", hre_date=" + hre_date + ", m_id="
				+ m_id + "]";
	}

}
