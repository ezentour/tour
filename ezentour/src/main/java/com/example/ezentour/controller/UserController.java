package com.example.ezentour.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.example.ezentour.dto.TrafficDto;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	private static final Logger LOG = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value = "mypage/user/main")
	public String home(Model model) throws SAXException, IOException, ParserConfigurationException {
		String url = "http://openapitraffic.daejeon.go.kr/traffic/rest/getTrafficInfoAll.do?serviceKey=ExXRx0fCNtTkIdPeHtGrzkjWMSxtnETcILU9JBsFuqhU3%2FCIlNi0QI6L8lQ8spombuCeyypgwwgwZqPJB2MBlQ%3D%3D&pageNo=1&numOfRows=10";

		// 페이지에 접근해줄 Document 객체를 생성해 주어야 한다.
		// 여기서 생성한 document 객체를 통해 파싱할 url의 요소를 읽어 들인다.
		// doc.getDocumentElement().getNodeName()를 출력하면 위 XML의 최상위 tag 값을 가져온다.
		// 여기서는 ServiceResult 가 최상위 tag값이 될 것이다.

		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
		Document doc = dBuilder.parse(url);
		doc.getDocumentElement().normalize();

		System.out.println("Root element : " + doc.getDocumentElement().getNodeName());

		// 여기는 파싱할 정보가 있는 tag에 접근하는 부분이다.
		// 여기서 파싱할 데이터는 <itemList>라는 tag안에 있기 때문에 나는 여기로 접근해야한다.
		// 그러면 nList에 <itemList> 태그가 하나씩 담기게 되고 , getLength()를 통해 리스트의 수를 확인할 수 있게된다.

		NodeList nList = doc.getElementsByTagName("TRAFFIC");

		System.out.println("파싱할 리스트 수 : " + nList.getLength());

		// 이 부분은 list에 담긴 데이터를 출력하는 부분
		// 위에 담긴 list를 반복문을 통해서 출력할 것이다
		// getTextContent() 는 전체 정보를 의미
		// getTagValue (" tag " , element ) : 입력한 tag 정보를 의미
		// getTagValue ( " tag " <- 실질적인 tag의 변수값을 넣어줘야 함 )
		// getTagValue는 따로 메소드를 만들어 준 것

		/*
		 * getTagValue("congestion", eElement), getTagValue("linkCount", eElement),
		 * getTagValue("linkID", eElement), getTagValue("linkLength", eElement),
		 * getTagValue("linkSqc", eElement), getTagValue("speed", eElement),
		 * getTagValue("roadName", eElement), getTagValue("startNodeId", eElement),
		 * getTagValue("startNodeName", eElement), getTagValue("endNodeID", eElement),
		 * getTagValue("endNodeName", eElement), getTagValue("travelT", eElement),
		 * getTagValue("udType", eElement)
		 */
		TrafficDto traffic = new TrafficDto("", "", "", "", "", "", "", "", "", "", "", "", "");
		List<TrafficDto> trafficList = new ArrayList<TrafficDto>();
		for (int temp = 0; temp < nList.getLength(); temp++) {
			Node node = nList.item(temp);
			if (node.getNodeType() == Node.ELEMENT_NODE) {
				Node nNode = nList.item(temp);

				Element eElement = (Element) nNode;
				System.out.println("startNodeName:::" + traffic.getStartNodeName()+"temp :::"+temp);
				
				  traffic.setCongestion(getTagValue("congestion", eElement));
				  System.out.println("80줄");
				  traffic.setLinkCount(getTagValue("linkCount", eElement));
				  traffic.setLinkID(getTagValue("linkID", eElement));
				  traffic.setLinkLength(getTagValue("linkLength", eElement));
				  traffic.setLinkSqc(getTagValue("linkSqc", eElement));
				  traffic.setSpeed(getTagValue("speed", eElement));
				  traffic.setRoadName(getTagValue("roadName", eElement));
				  traffic.setStartNodeId(getTagValue("startNodeId", eElement));
				  traffic.setStartNodeName(getTagValue("startNodeName", eElement));
				  traffic.setEndNodeID(getTagValue("endNodeID", eElement));
				  traffic.setEndNodeName(getTagValue("endNodeName", eElement));
				  traffic.setTravelT(getTagValue("travelT", eElement));
				  traffic.setUdType(getTagValue("udType", eElement));
				 
				  trafficList.add(traffic);
			}
		}
		model.addAttribute("trafficList", trafficList);
		System.out.println("여기");
		return "user/mypage/user_home";
	}

	@RequestMapping(value = "mypage/user/mycart")
	public String myCart() {
		return "user/mypage/mycart";
	}

	// getTagValue 메소드 인데 , 이 부분은 TagName을 가져옴으로써 nlList에 저장을 시키는 부분
	private static String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if (nValue == null) {
			return null;
		}
		return nValue.getNodeValue();
	}

}
