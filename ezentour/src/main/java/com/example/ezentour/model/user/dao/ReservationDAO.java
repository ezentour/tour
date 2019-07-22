package com.example.ezentour.model.user.dao;

import java.util.List;

import com.example.ezentour.model.user.dto.ReservationDTO;

public interface ReservationDAO {
	public void insertReservation(ReservationDTO rDto);
	public void updateReservation(int r_no);
	public List<ReservationDTO> selectReservation(String r_m_id);
	public List<ReservationDTO> selectReservation();
}
