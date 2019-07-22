package com.example.ezentour.model.user.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.ezentour.model.user.dto.ReservationDTO;

@Repository
public class ReservationDAOImpl implements ReservationDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insertReservation(ReservationDTO rDto) {
		sqlSession.insert("reservation.insert", rDto);
	}

	@Override
	public void updateReservation(int r_no) {
		sqlSession.update("reservation.update", r_no);
	}

	@Override
	public List<ReservationDTO> selectReservation(String r_m_id) {
		return sqlSession.selectList("reservation.select_r_m_id", r_m_id);
	}

	@Override
	public List<ReservationDTO> selectReservation() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reservation.selectAll");
	}

	@Override
	public int selectReservation(ReservationDTO rDto) {
		int count = sqlSession.selectOne("reservation.select_myreservation", rDto);
			return count;
	}

	@Override
	public int selectReservation_no() {	
		return sqlSession.selectOne("reservation.select_r_no");
	}

	@Override
	public int selectReservation_money(int r_no) {
		return sqlSession.selectOne("reservation.select_reservation_money", r_no);
	}

	@Override
	public ReservationDTO select_reservation_cancel(int r_no) {		
		return sqlSession.selectOne("reservation.select_reservation_cancel", r_no);
	}

	@Override
	public List<ReservationDTO> selectReservation_hostel(String m_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reservation.select_hostel_reservation", m_id);
	}

}
