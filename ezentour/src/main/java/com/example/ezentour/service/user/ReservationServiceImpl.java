package com.example.ezentour.service.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.ezentour.model.user.dao.ReservationDAO;
import com.example.ezentour.model.user.dto.ReservationDTO;

@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Inject
	ReservationDAO rDao;
	
	@Override
	public void insertReservation(ReservationDTO rDto) {
		rDao.insertReservation(rDto);
	}

	@Override
	public void updateReservation(int r_no) {
		rDao.updateReservation(r_no);
	}

	@Override
	public List<ReservationDTO> selectReservation(String r_m_id) {
		return rDao.selectReservation(r_m_id);
	}

	@Override
	public List<ReservationDTO> selectReservation() {
		// TODO Auto-generated method stub
		return rDao.selectReservation();
	}

	@Override
	public boolean selectReservation(ReservationDTO rDto) {
		int count = rDao.selectReservation(rDto);
		if(count>0)
			return true;
		else
			return false;
	}

	@Override
	public int selectReservation_no() {		
		return rDao.selectReservation_no();
	}

	@Override
	public int selectReservation_money(int r_no) {		
		return rDao.selectReservation_money(r_no);
	}

	@Override
	public ReservationDTO select_reservation_cancel(int r_no) {		
		return rDao.select_reservation_cancel(r_no);
	}

	@Override
	public List<ReservationDTO> selectReservation_hostel(String m_id) {
		// TODO Auto-generated method stub
		return rDao.selectReservation_hostel(m_id);
	}

}
