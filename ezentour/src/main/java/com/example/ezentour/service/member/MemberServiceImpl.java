package com.example.ezentour.service.member;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.example.ezentour.model.member.dao.MemberDAO;
import com.example.ezentour.model.member.dto.MemberDTO;
import com.example.ezentour.service.member.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	private static final Logger LOG = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Inject
	MemberDAO memberDao;

	@Override
	public boolean loginCheck(MemberDTO dto, HttpSession session) {
		boolean result=memberDao.loginCheck(dto);
		if(result) { //로그인 성공
			//세션변수에 값 저장
			MemberDTO dto2 = viewMember(dto.getM_id());
			//setAttribute(변수명,값)
			session.setAttribute("m_id", dto.getM_id());
			session.setAttribute("m_name", dto2.getM_name());
			session.setAttribute("m_field", dto2.getM_field());			
			LOG.info("접속id: " + session.getAttribute("m_id") + ", 접속자: " + session.getAttribute("m_name"));
		} 
		return result;
	}

	@Override
	public void logout(HttpSession session) {
		// 세션 초기화
		session.invalidate();
	}

	@Override
	public MemberDTO viewMember(String m_id) {
		return memberDao.viewMember(m_id);
	}
	
	@Override
	public List<MemberDTO> memberList() {
		return memberDao.memberList();
	}
	
	// 관리자가 사용자 상세 정보 확인
	public MemberDTO memberDetail(String showM_id) {
			return memberDao.memberDetail(showM_id);
	}
	
	// 회원 가입
	@Override
	public void register(MemberDTO dto) throws Exception {
		memberDao.register(dto);
	}
		
	// 로그인
	@Override
	public MemberDTO login(MemberDTO dto) throws Exception {
		return null;
	}
		
	// 회원정보 수정
	@Override
	public void modify(MemberDTO dto) throws Exception {
		
	}
		
	// 회원 탈퇴
	@Override
	public void withdrawal(MemberDTO dto) throws Exception {
		memberDao.withdrawal(dto);
	}
	
	@Override
	public int idcheck(String m_id) {
		return memberDao.idcheck(m_id);
	}
		
}
