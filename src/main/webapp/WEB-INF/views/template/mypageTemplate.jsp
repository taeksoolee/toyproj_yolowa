<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="Ansonika">
  <title>Yolowa || 마이페이지</title>
	
  <!-- Favicons-->
  <link rel="shortcut icon" href="${pageContext.request.contextPath }/img/logo/logo-title.png" type="image/x-icon">
  <link rel="apple-touch-icon" type="image/x-icon" href="${pageContext.request.contextPath }/img/apple-touch-icon-57x57-precomposed.png">
  <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="${pageContext.request.contextPath }/img/apple-touch-icon-72x72-precomposed.png">
  <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="${pageContext.request.contextPath }/img/apple-touch-icon-114x114-precomposed.png">
  <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="${pageContext.request.contextPath }/img/apple-touch-icon-144x144-precomposed.png">

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
  <link href="${pageContext.request.contextPath }/vendor/dropzone.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/css/date_picker.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/vendor/animate.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/vendor/magnific-popup.css" rel="stylesheet">
  <!-- WYSIWYG Editor -->
  <link href="${pageContext.request.contextPath }/js/editor/summernote-bs4.css" rel="stylesheet">
  <!-- Your custom styles -->
  <link href="${pageContext.request.contextPath }/css/custom_mypage.css" rel="stylesheet">
  
  <!-- vuejs 개발버전, 도움되는 콘솔 경고를 포함. -->
  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  <!-- 자바스크립트에서 시간 조작을 위한 라이브러리 -->
  <script src="${pageContext.request.contextPath }/js/moment.js"></script>
  
</head>

<body class="fixed-nav sticky-footer" id="page-top">
  
	<div id="nav">
		<tiles:insertAttribute name="nav"/>
	</div>
	
	<div id="content">
		<tiles:insertAttribute name="content"/>
	</div>
	
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
	
	<tiles:insertAttribute name="alert"/>
	<tiles:insertAttribute name="confirm"/>
	
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fa fa-angle-up"></i>
	</a>
	
</body>
</html>
