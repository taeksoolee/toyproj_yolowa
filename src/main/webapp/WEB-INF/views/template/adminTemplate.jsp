<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="yolowa">
		
	<!-- Favicons-->
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/img/logo/logo-title.png" type="image/x-icon">
	<link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="img/apple-touch-icon-114x114-precomposed.png">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="img/apple-touch-icon-144x144-precomposed.png">
	
	<!-- GOOGLE WEB FONT -->
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800" rel="stylesheet">
	
	<!-- Bootstrap core CSS-->
	<link href="${pageContext.request.contextPath }/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- Main styles -->
	<link href="${pageContext.request.contextPath }/css/admin.css" rel="stylesheet">
	<!-- Icon fonts-->
	<link href="${pageContext.request.contextPath }/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<!-- Plugin styles -->
	<link href="${pageContext.request.contextPath }/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
	<!-- Your custom styles -->
	<link href="${pageContext.request.contextPath }/css/admin/custom.css" rel="stylesheet">
	
	 <!-- WYSIWYG Editor -->
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/editor/summernote-bs4.css">
	
	 <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/vendor/chart.js/Chart.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/datatables/jquery.dataTables.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/datatables/dataTables.bootstrap4.js"></script>
	<script src="${pageContext.request.contextPath }/vendor/jquery.selectbox-0.2.js"></script>
	<script src="${pageContext.request.contextPath }/vendor/retina-replace.min.js"></script>
	<script src="${pageContext.request.contextPath }/vendor/jquery.magnific-popup.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/js/admin.js"></script>
	<!-- Custom scripts for this page-->
    <script src="${pageContext.request.contextPath }/js/admin-charts.js"></script>
    <!-- vuejs 개발버전, 도움되는 콘솔 경고를 포함. -->
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<!-- vuejs 상용버전, 속도와 용량이 최적화됨. -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/vue"></script> -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	
    
 	<title>Yolowa || 관리자</title>
</head>

<body class="fixed-nav sticky-footer" id="page-top">
	<tiles:insertAttribute name="exit"/>
	<tiles:insertAttribute name="alert"/>
	<tiles:insertAttribute name="confirm"/>
	<tiles:insertAttribute name="memberDetail"/>
	<tiles:insertAttribute name="hostingDetail"/>

	<div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	
	<div id="content">
		<tiles:insertAttribute name="content"/>
	</div>
	
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</body>
</html>

