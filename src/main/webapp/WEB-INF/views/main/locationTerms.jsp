<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<div id="page">
			
	<main>
		
		<section class="hero_in general">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>위치정보서비스 이용약관</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->

		<div class="container margin_80_55">
			<div class="row" style="margin-left:150px;">
				<div class="space-top-6 space-16 text-wrap col-sm-12 col-md-9 col-lg-10">
					${locationTerms.boardContent }
    			</div>
			</div>
			<!--/row-->
		</div>

		
	</main>
	<!--/main-->
	
	<div id="toTop"></div><!-- Back to top button -->
	
	<jsp:include page="login-popup.jsp"></jsp:include>
	
	</div>
	<!-- page -->
	
	<!-- COMMON SCRIPTS -->
    <script src="${pageContext.request.contextPath }/js/common_scripts.js"></script>
    <script src="${pageContext.request.contextPath }/js/main.js"></script>
	<script src="${pageContext.request.contextPath }/assets/validate.js"></script>
	
	