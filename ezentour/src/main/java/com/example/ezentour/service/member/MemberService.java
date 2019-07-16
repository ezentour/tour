package com.example.ezentour.service.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.ezentour.model.member.dto.MemberDTO;

public interface MemberService {
	public boolean loginCheck(MemberDTO dto, HttpSession session);
	public void logout(HttpSession session);
	public MemberDTO viewMember(String m_id);
	
	// 관리자가 사용자 명단 확인
	public List<MemberDTO> memberList(); 
	
	// 관리자가 사용자 상세 정보 확인
	public MemberDTO memberDetail(String showM_id);
	
	// 회원 가입
	public void register(MemberDTO dto) throws Exception;
	
	// 로그인
	public MemberDTO login(MemberDTO dto) throws Exception;
	
	// 회원정보 수정
	public void modify(MemberDTO dto) throws Exception;
	
	// 회원 탈퇴
	public void withdrawal(MemberDTO dto) throws Exception;
	
	public int idcheck(String m_id);
	
}