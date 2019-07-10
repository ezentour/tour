package com.example.ezentour.service.member;

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
	private static final Logger LOG = LoggerFactory.getLogger(MemberService.class);

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
			LOG.trace("접속id: " + session.getAttribute("m_id") + ", 접속자: " + session.getAttribute("m_name"));
			//System.out.println(session.getAttribute("m_id"));
			//System.out.println(session.getAttribute("m_name"));
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

}
