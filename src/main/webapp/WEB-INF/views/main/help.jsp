<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
	<div id="page">
	
	<main>
		<section class="hero_in general">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>무엇을 도와드릴까요?</h1>
					<form class="fadeInUp" method="post">
						<div id="custom-search-input">
							<div class="input-group">
								<input type="text" name="boardContent" class="search-query" placeholder="도움이 필요하신가요? 여기에 입력해주세요. ex)'아..그거 머였지?'">
								<input type="submit" class="btn_search" value="검색">
							</div>
						</div>
					</form>
				</div>
			</div>
		</section>
		<!--/hero_in-->
		<div class="container margin_60_35">
			<div class="main_title_2">
				<span><em></em></span>
				<h2>주제를 선택해주세요</h2>
				<p>아래 메뉴 중 하나를 선택하면 상세 도움말 페이지로 이동합니다.</p>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<a class="box_topic" href="faq?type=1">
						<span><i class="pe-7s-wallet"></i></span>
						<h3>예약 및 결제</h3>
						<p><small>예약, 예약 취소, 결제, 결제 취소 관련 정보를 제공합니다.</small></p>
					</a>
				</div>
				<div class="col-lg-4 col-md-6">
					<a class="box_topic" href="faq?type=2">
						<i class="pe-7s-users"></i>
						<h3>계정</h3>
						<p><small>계정등록, 계정탈퇴, 계정정지 관련 정보를 제공합니다.</small></p>
					</a>
				</div>
				<div class="col-lg-4 col-md-6">
					<a class="box_topic" href="faq?type=3">
						<i class="pe-7s-help2"></i>
						<h3>호스팅</h3>
						<p><small>호스팅 정보 등록, 수정, 시스템 관련 정보를 제공합니다.</small></p>
					</a>
				</div>
				<div class="col-lg-4 col-md-6">
					<a class="box_topic" href="faq?type=4">
						<i class="pe-7s-global"></i>
						<h3>이용 방법</h3>
						<p><small>홈페이지 기능, 이용 방법 관련 정보를 제공합니다.</small></p>
					</a>
				</div>
				<div class="col-lg-4 col-md-6">
					<a class="box_topic" href="faq?type=5">
						<i class="pe-7s-note2"></i>
						<h3>이용 약관</h3>
						<p><small>Yolowa 홈페이지 이용 약관의 정보를 제공합니다.</small></p>
					</a>
				</div>
				<div class="col-lg-4 col-md-6">
					<a class="box_topic" href="faq?type=6">
						<i class="pe-7s-comment"></i>
						<h3>안전 및 접근성</h3>
						<p><small>Yolowa 홈페이지 안전성, 접근성 정보를 제공합니다.</small></p>
					</a>
				</div>
			</div>
			<!--/row-->
		</div>
		<!-- /container -->
		<div class="bg_color_1">
			<div class="container margin_60_35">
				<div class="main_title_3">
					<span><em></em></span>
					<h2>자주 찾는 도움말</h2>
					<p>이용자분들이 자주 찾는 도움말의 목록입니다.</p>
				</div>
				<div class="list_articles add_bottom_30 clearfix">
					<ul>
					<c:forEach items="${helpBoardViewList }" var="helpBoardView">
						<li><a href="faq?boardNo=${helpBoardView.boardNo }"><i class="icon_documents_alt"></i><span>${helpBoardView.boardTitle }</span></a></li>
					</c:forEach>
					</ul>
				</div>
				<!-- /list_articles -->
			</div>
			<!-- /container -->
		</div>
		<!-- /bg_color_1 -->
	</main>
	<!--/main-->
	
	</div>
	<!-- page -->
	
	<div id="toTop"></div><!-- Back to top button -->
	
	<jsp:include page="login-popup.jsp"></jsp:include>
	
	<!-- COMMON SCRIPTS -->
    <script src="${pageContext.request.contextPath }/js/common_scripts.js"></script>
    <script src="${pageContext.request.contextPath }/js/main.js"></script>
	<script src="${pageContext.request.contextPath }/assets/validate.js"></script>
	