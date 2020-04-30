<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
	
	<div id="page">
	
	<main>
		
		<section class="hero_in tours">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>위시 리스트</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->

		<div class="container margin_60_35">
			
		<div class="wrapper-grid">
			<div class="row">
				<c:forEach items="${wishList }" var="wishListItem">
					<div class="col-xl-4 col-lg-6 col-md-6" id="hosting_div_${wishListItem.HOSTING_NO}">
						<div class="box_grid">
							<figure>
								<a href="#0" class="wish_bt liked" data-hosting-no="${wishListItem.HOSTING_NO}"></a>
								<a href="${pageContext.request.contextPath }/tour-detail.jsp"><img src="${pageContext.request.contextPath }/img/${ wishListItem.HOSTING_IMAGE}" class="img-fluid" alt="" width="800" height="533"></a>
								<small>${wishListItem.HOSTING_ADDRESS} </small>
								<div class="read_more"><span>자세히</span></div>
							</figure>
							<div class="wrapper">
								<h3><a href="${pageContext.request.contextPath }/tour-detail.jsp">${wishListItem.HOSTING_NAME} </a></h3>    
								<p>${wishListItem.HOSTING_DESC}</p>								
								<span class="price"> <strong>￦${wishListItem.HOSTING_PRICE}</strong> / 1박
								</span>
							</div>
							<ul>
								<li><i class="icon_clock_alt"></i>
									<c:choose>
										<c:when test="${ wishListItem.HOSTING_CATEGORY == 1}">아파트</c:when>
										<c:when test="${ wishListItem.HOSTING_CATEGORY == 2}">주택(펜션)</c:when>
										<c:when test="${ wishListItem.HOSTING_CATEGORY == 3}">전문숙소</c:when>
										<c:when test="${ wishListItem.HOSTING_CATEGORY == 4}">독특한숙소</c:when>
									</c:choose>
								</li>
								<li><div class="score"><span>Superb<em>${wishListItem.CTN} 후기들</em></span><strong>${wishListItem.AVG}</strong></div></li>
							</ul>
						</div>
					</div>
				</c:forEach>
				<%-- <div class="col-xl-4 col-lg-6 col-md-6">
					<div class="box_grid">
						<figure>
							<a href="#0" class="wish_bt liked"></a>
							<a href="tour-detail.jsp"><img src="${pageContext.request.contextPath }/img/tour_1.jpg" class="img-fluid" alt="" width="800" height="533"></a>
							<small>서울(지역명)</small>
							<div class="read_more"><span>자세히</span></div>
						</figure>
						<div class="wrapper">
							<h3><a href="tour-detail.jsp">숙소 이름</a></h3>    
							<p>(숙소설명)Id placerat tacimates definitionem sea, prima quidam vim no. Duo nobis persecuti cu.</p>
							<span class="price"> <strong>￦54,000</strong> / 1박
							</span>
						</div>
						<ul>
							<li><i class="icon_clock_alt"></i> 아파트(숙소종류)</li>
							<li><div class="score"><span>Superb<em>350 후기들</em></span><strong>8.9</strong></div></li>
						</ul>
					</div>
				</div>
				<!-- /box_grid -->
				<div class="col-xl-4 col-lg-6 col-md-6">
					<div class="box_grid">
						<figure>
							<a href="#0" class="wish_bt liked"></a>
							<a href="tour-detail.jsp"><img src="${pageContext.request.contextPath }/img/tour_2.jpg" class="img-fluid" alt="" width="800" height="533"></a>
							<small>제주(지역명)</small>
							<div class="read_more"><span>Read more</span></div>
						</figure>
						<div class="wrapper">
							<h3><a href="tour-detail.jsp">Notredam</a></h3>
							<p>Id placerat tacimates definitionem sea, prima quidam vim no. Duo nobis persecuti cu.</p>
							<span class="price">From <strong>$124</strong> /per person</span>
						</div>
						<ul>
							<li><i class="icon_clock_alt"></i> 1h 30min</li>
							<li><div class="score"><span>Good<em>350 Reviews</em></span><strong>7.0</strong></div></li>
						</ul>
					</div>
				</div>
				<!-- /box_grid -->
				<div class="col-xl-4 col-lg-6 col-md-6">
					<div class="box_grid">
						<figure>
							<a href="#0" class="wish_bt liked"></a>
							<a href="tour-detail.jsp"><img src="${pageContext.request.contextPath }/img/tour_3.jpg" class="img-fluid" alt="" width="800" height="533"></a>
							<small>부산(지역명)</small>
							<div class="read_more"><span>Read more</span></div>
						</figure>
						<div class="wrapper">
							<h3><a href="tour-detail.jsp">Versailles</a></h3>
							<p>Id placerat tacimates definitionem sea, prima quidam vim no. Duo nobis persecuti cu.</p>
							<span class="price">From <strong>$25</strong> /per person</span>
						</div>
						<ul>
							<li><i class="icon_clock_alt"></i> 1h 30min</li>
							<li><div class="score"><span>Good<em>350 Reviews</em></span><strong>7.0</strong></div></li>
						</ul>
					</div>
				</div>
				<!-- /box_grid -->
				<div class="col-xl-4 col-lg-6 col-md-6">
					<div class="box_grid">
						<figure>
							<a href="#0" class="wish_bt liked"></a>
							<a href="tour-detail.jsp"><img src="${pageContext.request.contextPath }/img/tour_4.jpg" class="img-fluid" alt="" width="800" height="533"></a>
							<small>제주(지역명)</small>
							<div class="read_more"><span>Read more</span></div>
						</figure>
						<div class="wrapper">
							<h3><a href="tour-detail.jsp">Pompidue Museum</a></h3>
							<p>Id placerat tacimates definitionem sea, prima quidam vim no. Duo nobis persecuti cu.</p>
							<span class="price">From <strong>$45</strong> /per person</span>
						</div>
						<ul>
							<li><i class="icon_clock_alt"></i> 2h 30min</li>
							<li><div class="score"><span>Superb<em>350 Reviews</em></span><strong>9.0</strong></div></li>
						</ul>
					</div>
				</div>
				<!-- /box_grid -->
				<div class="col-xl-4 col-lg-6 col-md-6">
					<div class="box_grid">
						<figure>
							<a href="#0" class="wish_bt liked"></a>
							<a href="tour-detail.jsp"><img src="${pageContext.request.contextPath }/img/tour_5.jpg" class="img-fluid" alt="" width="800" height="533"></a>
							<small>Walking</small>
							<div class="read_more"><span>Read more</span></div>
						</figure>
						<div class="wrapper">
							<h3><a href="tour-detail.jsp">Tour Eiffel</a></h3>
							<p>Id placerat tacimates definitionem sea, prima quidam vim no. Duo nobis persecuti cu.</p>
							<span class="price">From <strong>$65</strong> /per person</span>
						</div>
						<ul>
							<li><i class="icon_clock_alt"></i> 1h 30min</li>
							<li><div class="score"><span>Good<em>350 Reviews</em></span><strong>7.5</strong></div></li>
						</ul>
					</div>
				</div>
				<!-- /box_grid -->
				<div class="col-xl-4 col-lg-6 col-md-6">
					<div class="box_grid">
						<figure>
							<a href="#0" class="wish_bt liked"></a>
							<a href="tour-detail.jsp"><img src="${pageContext.request.contextPath }/img/tour_6.jpg" class="img-fluid" alt="" width="800" height="533"></a>
							<small>Museum</small>
							<div class="read_more"><span>Read more</span></div>
						</figure>
						<div class="wrapper">
							<h3><a href="tour-detail.jsp">Louvre Museum</a></h3>
							<p>Id placerat tacimates definitionem sea, prima quidam vim no. Duo nobis persecuti cu.</p>
							<span class="price">From <strong>$95</strong> /per person</span>
						</div>
						<ul>
							<li><i class="icon_clock_alt"></i> 1h 30min</li>
							<li><div class="score"><span>Good<em>350 Reviews</em></span><strong>7.8</strong></div></li>
						</ul>
					</div>
				</div> --%>
				<!-- /box_grid -->
			</div>
			<!-- /row -->
			</div>
			<!-- /isotope-wrapper -->
						
		</div>
		<!-- /container -->
		
		<%--
		<div class="bg_color_1">
			<div class="container margin_60_35">
				<div class="row">
					<div class="col-md-4">
						<a href="#0" class="boxed_list">
							<i class="pe-7s-help2"></i>
							<h4>Need Help? Contact us</h4>
							<p>Cum appareat maiestatis interpretaris et, et sit.</p>
						</a>
					</div>
					<div class="col-md-4">
						<a href="#0" class="boxed_list">
							<i class="pe-7s-wallet"></i>
							<h4>Payments</h4>
							<p>Qui ea nemore eruditi, magna prima possit eu mei.</p>
						</a>
					</div>
					<div class="col-md-4">
						<a href="#0" class="boxed_list">
							<i class="pe-7s-note2"></i>
							<h4>Cancel Policy</h4>
							<p>Hinc vituperata sed ut, pro laudem nonumes ex.</p>
						</a>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /bg_color_1 -->
		 --%>
		
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
	
	<script type>
		$('.wish_bt.liked').on('click', function (c) {
			if(confirm("삭제하시겠습니까?")){
				$.ajax({
					type: "DELETE",
					url: "/yolowa/wishlist?hostingNo=" + this.dataset.hostingNo,
					success: function(data) {
						$('#hosting_div_'+data).fadeOut('slow');
					},
					error: function(xhr) {
						alert("에러코드 = " + xhr.status)
					}
				}); 
			} else {
				return false;
			}
		});
	</script>
	
	