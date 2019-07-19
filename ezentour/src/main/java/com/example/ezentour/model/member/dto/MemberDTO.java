package com.example.ezentour.model.member.dto;

public class MemberDTO {
	private String m_id;
	private String m_password;
	private String m_name;
	private String m_tel;
	private String m_email;
	private String m_field;
	private String m_hashed;

	public MemberDTO(String m_id, String m_password, String m_name, String m_tel, String m_email, String m_field,
			String m_hashed) {
		this.m_id = m_id;
		this.m_password = m_password;
		this.m_name = m_name;
		this.m_tel = m_tel;
		this.m_email = m_email;
		this.m_field = m_field;
		this.m_hashed = m_hashed;
	}

	public MemberDTO() {
		
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_password() {
		return m_password;
	}

	public void setM_password(String m_password) {
		this.m_password = m_password;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_field() {
		return m_field;
	}

	public void setM_field(String m_field) {
		this.m_field = m_field;
	}

	public String getM_hashed() {
		return m_hashed;
	}

	public void setM_hashed(String m_hashed) {
		this.m_hashed = m_hashed;
	}

	@Override
	public String toString() {
		return "MemberDTO [m_id=" + m_id + ", m_password=" + m_password + ", m_name=" + m_name + ", m_tel=" + m_tel
				+ ", m_email=" + m_email + ", m_field=" + m_field + ", m_hashed=" + m_hashed + "]";
	}

}
