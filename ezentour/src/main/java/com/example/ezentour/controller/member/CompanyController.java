package com.example.ezentour.controller.member;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.ezentour.model.hotel.dto.HotelDTO;
import com.example.ezentour.model.user.dto.ReservationDTO;
import com.example.ezentour.service.hotel.HotelService;
import com.example.ezentour.service.user.ReservationService;

import oracle.net.aso.h;

@Controller
public class CompanyController {
	private static final Logger LOG = LoggerFactory.getLogger(CompanyController.class);

	@Resource(name = "uploadHotel_img")
	String uploadHotel_img;

	@Inject
	HotelService hotelService;
	
	@Inject
	ReservationService reservationService;

	@RequestMapping(value = "mypage/company/hotel_list.do")
	public ModelAndView hotel_list(ModelAndView mav, HttpSession session) {
		String h_m_id = (String) session.getAttribute("m_id");

		List<HotelDTO> list = hotelService.listHotel(h_m_id);
		mav.setViewName("company/mypage/hotel_list");
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "mypage/company/hotel_insert")
	public String hotelInsertMain() {
		return "company/mypage/hotel_insert";
	}

	@RequestMapping(value = "mypage/company/hotel_insert.do")
	public String hotelInsert(@ModelAttribute HotelDTO hDto, HttpSession session, MultipartFile file)
			throws IOException, Exception {
		String savedName = file.getOriginalFilename();
		savedName = uploadFile(savedName, file.getBytes());
		hDto.setH_img(savedName);

		String h_m_id = (String) session.getAttribute("m_id");
		hDto.setH_m_id(h_m_id);

		System.out.println(hDto.toString());
		hotelService.insertHotel(hDto);
		return "redirect:hotel_list.do";
	}

	@RequestMapping(value = "mypage/company/hotel_detail.do")
	public String hotel_list_detail(@RequestParam int h_no, Model model) {
		model.addAttribute("hotel", hotelService.viewHotel(h_no));
		return "company/mypage/hotel_detail";
	}

	@RequestMapping(value = "mypage/company/hotel_update.do")
	public String update(MultipartFile file, @ModelAttribute HotelDTO hDto) throws IOException, Exception {
		String savedName = file.getOriginalFilename();
		System.out.println("파일이름" + savedName);

		HotelDTO hdto2 = hotelService.viewHotel(hDto.getH_no());
		System.out.println(hdto2.toString());
		hDto.setH_m_id(hdto2.getH_m_id());

		if (savedName.equals("")) {
			System.out.println("원래 url : " + hdto2.getH_img());
			hDto.setH_img(hdto2.getH_img());
			hotelService.updateHotel(hDto);
			return "redirect:hotel_list.do";
		} else {
			savedName = uploadFile(savedName, file.getBytes());
			hDto.setH_img(savedName);
			hotelService.updateHotel(hDto);
			return "redirect:hotel_list.do";
		}

	}

	@RequestMapping(value = "mypage/company/hotel_delete.do")
	public String delete(@ModelAttribute HotelDTO hDto) {
		hotelService.deleteHotel(hDto.getH_no());
		return "redirect:hotel_list.do";
	}

	@RequestMapping(value = "mypage/company/reservation")
	public ModelAndView reservation(ModelAndView mav, HttpSession session) {
		String m_id = (String) session.getAttribute("m_id");

		List<ReservationDTO> list = reservationService.selectReservation_hostel(m_id);
		mav.setViewName("company/mypage/reservation");
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("mypage/company/josogo.do")
	public String main(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		return "company/mypage/jusoPopup";
	}

	// 파일 이름이 중복되지 않도록 처리
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		// uuid 생성(Universal Unique IDentifier, 범용 고유 식별자)
		String savedName = originalName;
		File target = new File(uploadHotel_img, savedName);
		// 임시 디렉토리에 저장된 업로드된 파일을 지정된 디렉토리에 복사
		// FileCopyUtils.copy(바이트 배열, 파일객체)
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
}
