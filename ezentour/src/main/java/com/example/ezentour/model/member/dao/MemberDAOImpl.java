package com.example.ezentour.model.member.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.example.ezentour.model.member.dao.MemberDAO;
import com.example.ezentour.model.member.dto.MemberDTO;
import com.example.ezentour.service.member.MemberService;

@Repository // Spring에서 관리하는 dao bean으로 설정 
public class MemberDAOImpl implements MemberDAO {
	private static final Logger LOG = LoggerFactory.getLogger(MemberDAOImpl.class);
	
	@Inject // mybatis 실행을 위한 SqlSession 객체를 주입시킴
	SqlSession sqlSession;
	
	@Override
	public boolean loginCheck(MemberDTO dto) {
		String name	= sqlSession.selectOne("member.login_check",dto);
		// 조건식 ? true일 때의 값 : false일 때의 값
		return (name == null) ? false : true; 
	}

	@Override
	public MemberDTO viewMember(String m_id) {
		return sqlSession.selectOne("member.viewMember", m_id);
	}
	
	// 관리자가 사용자 명단 확인
	@Override
	public List<MemberDTO> memberList() {
		return sqlSession.selectList("member.member_list");
	}
	
	// 관리자가 사용자 상세 정보 확인
	@Override
	public MemberDTO memberDetail(String showM_id) {
		return sqlSession.selectOne("member.member_detail", showM_id);
	}
	
	// 관리자가 사용자 정보 수정
	public void memberUpdate(MemberDTO dto) {
		sqlSession.update("member.member_update", dto);
	}

	// 관리자가 사용자 탈퇴시키기
	public void memberDelete(String showM_id) {
		sqlSession.delete("member.member_delete", showM_id);
	}
		
		
	// 회원 가입
	@Override
	public void register(MemberDTO dto) throws Exception {
		sqlSession.insert("member.register", dto);
	}
		
	// 로그인
	@Override
	public MemberDTO login(MemberDTO dto) throws Exception {
		return null;
	}
		
	// 회원정보 수정
	@Override
	public void modify(MemberDTO dto) throws Exception {
		sqlSession.update("member.modify", dto);
	}
		
	// 회원 탈퇴
	@Override
	public void withdrawal(MemberDTO dto) throws Exception {
		sqlSession.delete("member.withdrawal", dto);
	}
	
	@Override
	public int idcheck(String m_id) {
		return sqlSession.selectOne("member.checkid", m_id);
	}
	
}