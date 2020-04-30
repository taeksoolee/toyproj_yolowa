<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
    <meta name="author" content="Ansonika">
    <title>YOLOWA || 여행중이세요? YOLOWA와 함께 숙소 예약 또는 호스팅을 시작해보세요.</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/img/logo/logo-title.png" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="${pageContext.request.contextPath }/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="${pageContext.request.contextPath }/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="${pageContext.request.contextPath }/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="${pageContext.request.contextPath }/img/apple-touch-icon-144x144-precomposed.png">

    <!-- GOOGLE WEB FONT -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/css/vendors.css" rel="stylesheet">

    <!-- YOUR CUSTOM-->
    <link href="${pageContext.request.contextPath }/css/custom.css" rel="stylesheet">
    
    <!-- SPECIFIC CSS -->
    <link href="${pageContext.request.contextPath }/css/blog.css" rel="stylesheet">
    
    <!-- vuejs 개발버전, 도움되는 콘솔 경고를 포함. -->
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<!-- 자바스크립트에서 시간 조작을 위한 라이브러리 -->
	<script src="${pageContext.request.contextPath }/js/moment.js"></script>

</head>

<body>
	<div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	
	
	
	<div id="content">
		<tiles:insertAttribute name="content"/>
	</div>
	
	
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
	
	<tiles:insertAttribute name="alert"/>
	<tiles:insertAttribute name="confirm"/>
	
</body>
</html>