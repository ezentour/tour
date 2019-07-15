package com.example.ezentour.model.member.dao;

import com.example.ezentour.model.member.dto.MemberDTO;

public interface MemberDAO {
	public boolean loginCheck(MemberDTO dto);
	public MemberDTO viewMember(String m_id);
	
	// 회원 가입
	public void register(MemberDTO dto) throws Exception;
	
	// 로그인
	public MemberDTO login(MemberDTO dto) throws Exception;
	
	// 회원정보 수정
	public void modify(MemberDTO dto) throws Exception;
	
	// 회원 탈퇴
	public void withdrawal(MemberDTO dto) throws Exception;
	
	// 아이디 확인
	public MemberDTO idCheck(String m_id) throws Exception;
	
}
