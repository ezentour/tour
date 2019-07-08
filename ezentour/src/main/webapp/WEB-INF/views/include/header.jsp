<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


<!-- Favicon -->
<link rel="icon" href="${path}/resources/img/core-img/favicon.png">
<!-- Stylesheet -->
<link rel="stylesheet" href="${path}/resources/style.css">
<!-- Font -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<style>
	body		{ font-family: 'NanumSquare', sans-serif; }
	.normal		{ font-weight: 400 }
	.bold		{ font-weight: 700 }
	.bolder		{ font-weight: 800 }
	.light		{ font-weight: 300 }
	.h1-title   { font-family: 'NanumSquare', sans-serif; color: white; }
	.h1-title-main   { font-family: 'NanumSquare', sans-serif; color: white; font-size: 60px; }
	.breadcrumb-content .breadcrumb .breadcrumb-item + .breadcrumb-item::before {
     font-family: "FontAwesome";
     font-weight: 900;
     content: '\f105';
     color: #ffffff; }
</style>