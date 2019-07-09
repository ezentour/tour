package com.example.ezentour.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TourController {
	private static final Logger LOG = LoggerFactory.getLogger(TourController.class);

	@RequestMapping(value = "tour/main")
	public String home() {		
		return "tour/tour_home";
	}
	
	@RequestMapping("Tour/PublicData.do")
	public void home(HttpServletRequest request, HttpServletResponse response, @RequestParam String option) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
		String serviceKey = "3A8G5CF0DP0%2BcOm6xmM2GGsCidJezKufwyXK36vCO7TsJr9lOhf%2FUuM4MBZXFy8wcOSKaf8P%2FsX0VS%2BAD%2FWqCw%3D%3D";
		String parameter = "";
		String code = option;
//	        serviceKey = URLEncoder.encode(serviceKey,"utf-8");
		PrintWriter out = response.getWriter();		
		parameter = parameter + "&" + "contentTypeId=12";
		parameter = parameter + "&" + "cat1=" + option;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=B";
		parameter = parameter + "&" + "numOfRows=1000";
		parameter = parameter + "&" + "_type=json";

		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		System.out.println(addr);
		InputStream in = url.openStream();

		ByteArrayOutputStream bos1 = new ByteArrayOutputStream();
		IOUtils.copy(in, bos1);
		in.close();
		bos1.close();

//        out.println(addr);

		String data = bos1.toString();
		out.println(data);

		byte[] b = data.getBytes("UTF-8");
		String s = new String(b, "UTF-8");

		JSONObject json = new JSONObject();
		json.put("data", s);
	}
}
