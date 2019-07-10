package com.example.ezentour.model.member.dao;

import com.example.ezentour.model.member.dto.MemberDTO;

public interface MemberDAO {
	public boolean loginCheck(MemberDTO dto);
	public MemberDTO viewMember(String m_id);
}
