package com.example.ezentour.dto;

public class TrafficDto {
	String congestion;
	String linkCount;
	String linkID;
	String linkLength;
	String linkSqc;
	String speed;
	String roadName;
	String startNodeId;
	String startNodeName;
	String endNodeID;
	String endNodeName;
	String travelT;
	String udType;
	
	public TrafficDto() {}
	
	public TrafficDto(String congestion, String linkCount, String linkID, String linkLength, String linkSqc,
			String speed, String roadName, String startNodeId, String startNodeName, String endNodeID,
			String endNodeName, String travelT, String udType) {
		super();
		this.congestion = congestion;
		this.linkCount = linkCount;
		this.linkID = linkID;
		this.linkLength = linkLength;
		this.linkSqc = linkSqc;
		this.speed = speed;
		this.roadName = roadName;
		this.startNodeId = startNodeId;
		this.startNodeName = startNodeName;
		this.endNodeID = endNodeID;
		this.endNodeName = endNodeName;
		this.travelT = travelT;
		this.udType = udType;
	}

	public String getCongestion() {
		return congestion;
	}

	public void setCongestion(String congestion) {
		this.congestion = congestion;
	}

	public String getLinkCount() {
		return linkCount;
	}

	public void setLinkCount(String linkCount) {
		this.linkCount = linkCount;
	}

	public String getLinkID() {
		return linkID;
	}

	public void setLinkID(String linkID) {
		this.linkID = linkID;
	}

	public String getLinkLength() {
		return linkLength;
	}

	public void setLinkLength(String linkLength) {
		this.linkLength = linkLength;
	}

	public String getLinkSqc() {
		return linkSqc;
	}

	public void setLinkSqc(String linkSqc) {
		this.linkSqc = linkSqc;
	}

	public String getSpeed() {
		return speed;
	}

	public void setSpeed(String speed) {
		this.speed = speed;
	}

	public String getRoadName() {
		return roadName;
	}

	public void setRoadName(String roadName) {
		this.roadName = roadName;
	}

	public String getStartNodeId() {
		return startNodeId;
	}

	public void setStartNodeId(String startNodeId) {
		this.startNodeId = startNodeId;
	}

	public String getStartNodeName() {
		return startNodeName;
	}

	public void setStartNodeName(String startNodeName) {
		this.startNodeName = startNodeName;
	}

	public String getEndNodeID() {
		return endNodeID;
	}

	public void setEndNodeID(String endNodeID) {
		this.endNodeID = endNodeID;
	}

	public String getEndNodeName() {
		return endNodeName;
	}

	public void setEndNodeName(String endNodeName) {
		this.endNodeName = endNodeName;
	}

	public String getTravelT() {
		return travelT;
	}

	public void setTravelT(String travelT) {
		this.travelT = travelT;
	}

	public String getUdType() {
		return udType;
	}

	public void setUdType(String udType) {
		this.udType = udType;
	}
	
}
