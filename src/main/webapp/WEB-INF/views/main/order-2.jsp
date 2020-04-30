<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<div id="page">
	
	<main>
		<div class="hero_in cart_section last">
			<div class="wrapper">
				<div class="container">
					<div class="bs-wizard clearfix">
						<div class="bs-wizard-step">
							<div class="text-center bs-wizard-stepnum">접수중</div>
							<div class="progress">
								<div class="progress-bar"></div>
							</div>
							<a href="cart-1.jsp" class="bs-wizard-dot"></a>
						</div>

						<div class="bs-wizard-step">
							<div class="text-center bs-wizard-stepnum">결제</div>
							<div class="progress">
								<div class="progress-bar"></div>
							</div>
							<a href="cart-2.jsp" class="bs-wizard-dot"></a>
						</div>

						<div class="bs-wizard-step active">
							<div class="text-center bs-wizard-stepnum">완료!</div>
							<div class="progress">
								<div class="progress-bar"></div>
							</div>
							<a href="#0" class="bs-wizard-dot"></a>
						</div>
					</div>
					<!-- End bs-wizard -->
					<div id="confirm">
						<h4>결제 완료!</h4>
						<p>빠른 결제 진행을 원하신다면 호스트에게 메세지를 남겨주세요.</p>
					</div>
				</div>
			</div>
		</div>
		<!--/hero_in-->
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

