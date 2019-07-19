package com.example.ezentour.model.board.dto;

public class BoardCommentDTO {
	int c_no;
	String c_m_id;
	String c_content;
	int c_b_no;
	String c_regdate;
	
	public BoardCommentDTO() {}
	
	public BoardCommentDTO(int c_no, String c_m_id, String c_content, int c_b_no, String c_regdate) {
		super();
		this.c_no = c_no;
		this.c_m_id = c_m_id;
		this.c_content = c_content;
		this.c_b_no = c_b_no;
		this.c_regdate = c_regdate;
	}
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getC_m_id() {
		return c_m_id;
	}
	public void setC_m_id(String c_m_id) {
		this.c_m_id = c_m_id;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public int getC_b_no() {
		return c_b_no;
	}
	public void setC_b_no(int c_b_no) {
		this.c_b_no = c_b_no;
	}
	public String getC_regdate() {
		return c_regdate;
	}
	public void setC_regdate(String c_regdate) {
		this.c_regdate = c_regdate;
	}

	@Override
	public String toString() {
		return "BoardCommentDTO [c_no=" + c_no + ", c_m_id=" + c_m_id + ", c_content=" + c_content + ", c_b_no="
				+ c_b_no + ", c_regdate=" + c_regdate + "]";
	}
}
