package com.example.ezentour.service.home;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.example.ezentour.model.home.dao.HomeSearchDAO;
import com.example.ezentour.model.home.dto.HomeSearchDTO;
import com.example.ezentour.controller.HotelController;
import com.example.ezentour.controller.member.UserController;

@Service
public class HomeSearchServiceImpl implements HomeSearchService {
	private static final Logger LOG = LoggerFactory.getLogger(HomeSearchServiceImpl.class);
	
	@Inject
	HomeSearchDAO hDao;
	@Inject
	UserController userController;
	
	@Override
	public List<HomeSearchDTO> list(String h_address, String checkin, String checkout, int select_room, String h_type) throws ParseException {
		int i =1;
		ArrayList<String> dates = userController.dateInteval2(checkin, checkout);
		List<HomeSearchDTO> listOne = null;
		List<HomeSearchDTO> listOthers= null;
		for(String date : dates) {
			LOG.info("HomeSearchServiceImpl Check : date : " + date);
		}
		for(String date : dates) {
			if(i==1) {
				listOne = hDao.list(h_address, date, select_room, h_type); // 첫 번째 날짜 데이터 중심으로 중복안된 값들 삭제
				i++;
				continue;
			} else {
				listOthers = hDao.list(h_address,date,select_room,h_type); // 2,3,4,번째 날짜 값 출력
				listOne.retainAll(listOthers); // 출력된 값과 origin 값 즉, listOne과 비교후 중복되지 않음 값은 삭제(T값만 남게해줌)
			}
			for(HomeSearchDTO list : listOne) {
				LOG.info("HomeSearchServiceImpl Check : list : " + list.toString());
			}
		}
		return listOne;
	}

}
