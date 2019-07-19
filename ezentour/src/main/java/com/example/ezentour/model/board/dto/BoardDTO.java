package com.example.ezentour.model.board.dto;

import java.util.Date;

public class BoardDTO {
	private int b_no;
	private String b_title;
	private String b_content;
	private String b_m_id;
	private Date b_regdate;
	
	public BoardDTO() {
		super();
	}

	public BoardDTO(int b_no, String b_title, String b_content, String b_m_id, Date b_regdate) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_m_id = b_m_id;
		this.b_regdate = b_regdate;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_m_id() {
		return b_m_id;
	}

	public void setB_m_id(String b_m_id) {
		this.b_m_id = b_m_id;
	}

	public Date getB_regdate() {
		return b_regdate;
	}

	public void setB_regdate(Date b_regdate) {
		this.b_regdate = b_regdate;
	}

	@Override
	public String toString() {
		return "BoardDTO [b_no=" + b_no + ", b_title=" + b_title + ", b_content=" + b_content + ", b_m_id=" + b_m_id
				+ ", b_regdate=" + b_regdate + "]";
	}
}
