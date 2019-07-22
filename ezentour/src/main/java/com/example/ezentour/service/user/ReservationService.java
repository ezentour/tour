package com.example.ezentour.service.user;

import java.util.List;

import com.example.ezentour.model.user.dto.ReservationDTO;

public interface ReservationService {
	public void insertReservation(ReservationDTO rDto);
	public void updateReservation(int r_no);
	public List<ReservationDTO> selectReservation(String r_m_id);
	public List<ReservationDTO> selectReservation();
	public boolean selectReservation(ReservationDTO rDto);
	public int selectReservation_no();
	public int selectReservation_money(int r_no);
	public ReservationDTO select_reservation_cancel(int r_no);
}
