package com.example.ezentour.service.hotel;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.ezentour.controller.member.UserController;
import com.example.ezentour.model.hotel.dao.HotelDAO;
import com.example.ezentour.model.hotel.dto.HotelDTO;

@Service
public class HotelServiceImpl implements HotelService {
	@Inject
	HotelDAO hotelDao;
	@Inject
	UserController userController;
	@Inject
	HotelRoomService hotelroomService;
	
	@Override
	public HotelDTO viewHotel(int h_no) {
		return hotelDao.viewHotel(h_no);
	}

	@Override
	public void insertHotel(HotelDTO hDto) {
		hotelDao.insertHotel(hDto);
		
	}

	@Override
	public List<HotelDTO> listHotel(String h_m_id) {		
		return hotelDao.listHotel(h_m_id);
	}

	@Override
	public void updateHotel(HotelDTO hDto) {
		hotelDao.updateHotel(hDto);
	}

	@Override
	public void deleteHotel(int h_no) {
		hotelDao.deleteHotel(h_no);
	}

	@Override
	public List<HotelDTO> listHotel() {
		return hotelDao.listHotel();
	}

	@Override
	public List<HotelDTO> Hotel_approve(String approve) {
		// TODO Auto-generated method stub
		return hotelDao.Hotel_approve(approve);
	}

	@Override
	public void updateHotel_approve(int h_no) {
		hotelDao.updateHotel_approve(h_no);
		
	}

	@Override
	public int selectHotel_room(int h_no) {
		HotelDTO hDto = hotelDao.selectHotel_room(h_no);
		int room = hDto.getH_room();		
		return room;
	}
	
	@Override
	public List<HotelDTO> dateListHotel(String h_address, int h_room, String h_type) {
		return hotelDao.dateListHotel(h_address, h_room, h_type);
	}

	@Override
	public HotelDTO selectHotel_room(int h_no, String h_address, String h_type) {
		return hotelDao.selectHotel_room(h_no, h_address, h_type);
	}; 
	
	@Override
	public HotelDTO selectHotel_roomPrice(int h_no,String h_type) {
		return hotelDao.selectHotel_roomPrice(h_no, h_type);
	}; 

	@Override
	public List<HotelDTO> priceSearchList(int minPrice, int maxPrice, int select_room, String checkIn, String checkOut, String hotelType) throws ParseException {
		boolean insert = true;
		// 가격, 주소에 따른 호텔 리스트 출력
		List<HotelDTO> ListPriceAdr = hotelDao.priceSearchList(minPrice, maxPrice);

		// 빈 리스트 생성
		ArrayList<HotelDTO> hlist = new ArrayList<HotelDTO>();

		// 체크인 체크아웃 날짜 기간
		ArrayList<String> dates = userController.dateInteval2(checkIn, checkOut);
		// 각 호텔 루프 돌면서
		for (HotelDTO hDto : ListPriceAdr) {
			// 한개의 호텔이 지역과 유형이 먼저 충족한지 체크
			HotelDTO shDto = selectHotel_roomPrice(hDto.getH_no(),hotelType);
			// 충족한 데이터가 있으면
			if (shDto != null) {
				// 체크인 체크아웃 루프 돌기
				for (String date : dates) {
					// 예약 되어있는 방 테이블에 존재시
					if (hotelroomService.selectone(hDto.getH_no(), date) > 0) {
						String result = hotelroomService.RoomCheck(hDto.getH_no(), date, select_room);
						// 가능하면 리스트 삽입할수 있도록 true
						if (result.equals("true")) {
							insert = true;
						} else {
							insert = false;
						}
					} else { // 존재안할 시 전체 호텔 방 개수와 내가 선택한 방개수 비교
						if (hDto.getH_room() >= select_room) {
							insert = true;
						} else
							insert = false;
					}
				}
				// 조건 충족한 데이터는 빈 리스트에 추가
				if (insert) {
					hlist.add(shDto);
				}
			}
		}
		return hlist;
	};
	
	@Override
	public List<HotelDTO> priceSearch(int minPrice, int maxPrice){
		return hotelDao.priceSearchList(minPrice, maxPrice);
	}
}
