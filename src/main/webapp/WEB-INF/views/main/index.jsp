<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<div id="page">
	
	<main>
		<section class="hero_single version_3">
			<div class="wrapper">
				<div class="container">
					<div class="main_search">
						<h3>YOLOWA와 함께<br> 원하시는 숙소를 찾아보세요.</h3>
						<p>숙소를 아직 못 정하셨다구요?<br>나만의 여행 스타일에 맞는 유형의 숙소를 YOLOWA에서 둘러보세요.</p>
						<form action="listsearch" method="get">
						<div class="custom-search-input-2">
							<div class="form-group">
								<input class="form-control" type="text" placeholder="목적지" id="autocomplete" name="hostAddress">
								<i class="icon_pin_alt"></i>
							</div>
							<div class="form-group">
								<input class="form-control" type="text" name="dates" placeholder="일정">
								<i class="icon_calendar"></i>
							</div>
							
							<div class="panel-dropdown">
									<a href="#">인원 <span class="qtyTotal">1</span></a>
									<div class="panel-dropdown-content">
										<!-- Quantity Buttons -->
										<div class="qtyButtons">
											<label>숙박인원</label>
											<input type="text" name="qtyInput" value="1">
										</div>
									</div>
								</div>
							<div class="form-group text-right">
								<input type="submit" class="btn_search" value="검색">
							</div>
						</div>
						<!-- /row -->
					</form>
					</div>
					<!-- /main_search -->	
				</div>
			</div>
		</section>
		<!-- /hero_single -->

		<div class="container container-custom margin_80_0">
			<div class="main_title_2">
				<span><em></em></span>
				<h2>최고의 평점을 받은 숙소</h2>
				<p>최고의 평점을 받은 전국의 숙소를 둘러보세요.</p>
			</div>
			<div id="reccomended" class="owl-carousel owl-theme">
			<c:forEach var="indexSuperhost" items="${searchIndexSuperhost}">
				<div class="item">
					<div class="box_grid">
						<figure>
							<c:set var="image1" value="${fn:split(indexSuperhost.hosting.hostingImage,'|')}" />
							<a href="detail?hostingNo=${indexSuperhost.hosting.hostingNo }"><img src="${pageContext.request.contextPath }/img/hosting/${image1[0]}" class="img-fluid" alt="" width="800" height="533"><div class="read_more"><span>자세히</span></div></a>

							<!-- <a href="#0" class="wish_bt"></a> -->
							<a href="detail?hostingNo=${indexSuperhost.hosting.hostingNo }"><img src="${pageContext.request.contextPath }/img/tour_1.jpg" class="img-fluid" alt="" width="800" height="533"><div class="read_more"><span>자세히</span></div></a>

							<small>${fn:substring(indexSuperhost.hosting.hostingAddress, 0, 2)}</small>
						</figure>
						<div class="wrapper">
							<h3><a href="detail?hostingNo=${indexSuperhost.hosting.hostingNo }">${indexSuperhost.hosting.hostingName }</a></h3>
							<p>${fn:substring(indexSuperhost.hosting.hostingDesc, 0, 80) }...</p>
							<span class="price"> <strong>￦<fmt:formatNumber value="${indexSuperhost.hosting.hostingPrice  }" type="number"/></strong> / 1박</span>
						</div>
						<ul>
							<li>
							<c:choose>
								<c:when test="${indexSuperhost.hosting.hostingCategory == 1}"><i class="icon_clock_alt"></i> 아파트</c:when>
								<c:when test="${indexSuperhost.hosting.hostingCategory == 2}"><i class="icon_clock_alt"></i> 주택(펜션)</c:when>								
								<c:when test="${indexSuperhost.hosting.hostingCategory == 3}"><i class="icon_clock_alt"></i> 전문숙소</c:when>								
								<c:when test="${indexSuperhost.hosting.hostingCategory == 4}"><i class="icon_clock_alt"></i> 독특한숙소</c:when>								
							</c:choose>
							</li>
							<li><div class="score"><span><em>${indexSuperhost.reviewNoCount } 후기들</em></span><strong>${indexSuperhost.reviewStarAvg } 점</strong></div></li>
						</ul>
					</div>
				</div>
				<!-- /item -->
			</c:forEach>
			</div>
			<!-- /carousel -->
			<p class="btn_home_align"><a href="listsearch" class="btn_1 rounded">모두 보기</a></p>
			<hr class="large">
		</div>
		<!-- /container -->
		
		<div class="container container-custom margin_30_95">
			<section class="add_bottom_45">
				<div class="main_title_3">
					<span><em></em></span>
					<h2>서울의 유명한 숙소</h2>
					<p>한국의 종주도시인 서울의 화려한 숙소들을 둘러보세요.</p>
				</div>
				<div class="row">
				<c:forEach var="indexFamous" items="${searchIndexFamous}">
					<div class="col-xl-3 col-lg-6 col-md-6">
						<a href="detail?hostingNo=${indexFamous.hosting.hostingNo }" class="grid_item">
							<figure>
								<div class="score"><strong>${indexFamous.reviewStarAvg } 점</strong></div>
								<c:set var="image2" value="${fn:split(indexFamous.hosting.hostingImage,'|')}" />
								<img src="${pageContext.request.contextPath }/img/hosting/${image2[0]}" class="img-fluid" alt="">
								<div class="info">
								<c:choose>
									<c:when test="${indexFamous.reviewStarAvg == 1 || indexFamous.reviewStarAvg == 2}"><div class="cat_star"><i class="icon_star"></i></div></c:when>
									<c:when test="${indexFamous.reviewStarAvg == 3 || indexFamous.reviewStarAvg == 4}"><div class="cat_star"><i class="icon_star"></i><i class="icon_star"></i></div></c:when>
									<c:when test="${indexFamous.reviewStarAvg == 5 || indexFamous.reviewStarAvg == 6}"><div class="cat_star"><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i></div></c:when>
									<c:when test="${indexFamous.reviewStarAvg == 7 || indexFamous.reviewStarAvg == 8}"><div class="cat_star"><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i></div></c:when>
									<c:when test="${indexFamous.reviewStarAvg == 9 || indexFamous.reviewStarAvg == 10}"><div class="cat_star"><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i></div></c:when>
								</c:choose>
									<h3>${indexFamous.hosting.hostingName }</h3>
								</div>
							</figure>
						</a>
					</div>
					<!-- /grid_item -->
				</c:forEach>
				</div>
				<!-- /row -->
				<a href="listsearch"><strong>모두 보기 (${searchCounting.localCount }) <i class="arrow_carrot-right"></i></strong></a>
			</section>
			<!-- /section -->
			
			<section class="add_bottom_45">
				<div class="main_title_3">
					<span><em></em></span>
					<h2>최신 업데이트 숙소</h2>
					<p>방금 등록된 다양한 숙소들을 둘러보세요.</p>
				</div>
				<div class="row">
				<c:forEach var="indexLately" items="${searchIndexLately}">
					<div class="col-xl-3 col-lg-6 col-md-6">
						<a href="detail?hostingNo=${indexLately.hosting.hostingNo }" class="grid_item">
							<figure>
								<div class="score"><strong>${indexLately.reviewStarAvg } 점</strong></div>
								<c:set var="image3" value="${fn:split(indexLately.hosting.hostingImage,'|')}" />
								<img src="${pageContext.request.contextPath }/img/hosting/${image3[0]}" class="img-fluid" alt="">
								<div class="info">
									<c:choose>
									<c:when test="${indexLately.reviewStarAvg == 1 || indexLately.reviewStarAvg == 2}"><div class="cat_star"><i class="icon_star"></i></div></c:when>
									<c:when test="${indexLately.reviewStarAvg == 3 || indexLately.reviewStarAvg == 4}"><div class="cat_star"><i class="icon_star"></i><i class="icon_star"></i></div></c:when>
									<c:when test="${indexLately.reviewStarAvg == 5 || indexLately.reviewStarAvg == 6}"><div class="cat_star"><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i></div></c:when>
									<c:when test="${indexLately.reviewStarAvg == 7 || indexLately.reviewStarAvg == 8}"><div class="cat_star"><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i></div></c:when>
									<c:when test="${indexLately.reviewStarAvg == 9 || indexLately.reviewStarAvg == 10}"><div class="cat_star"><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i></div></c:when>
								</c:choose>
									<h3>${indexLately.hosting.hostingName }</h3>
								</div>
							</figure>
						</a>
					</div>
					<!-- /grid_item -->
				</c:forEach>
				</div>
				<!-- /row -->
				<a href="listsearch"><strong>모두 보기 (${searchCounting.totalCount }) <i class="arrow_carrot-right"></i></strong></a>
			</section>
			<!-- /section -->
			
			
			<div class="banner mb-0">
				<div class="wrapper d-flex align-items-center opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.3)">
					<div>
						<small>한국을 체험하세요.</small>
						<h3>YOLOWA와 함께<br>소중한 추억을 만들어보세요.</h3>
						<p>즐길거리와 먹거리 정보를 알려드릴게요.</p>
						<a href="${pageContext.request.contextPath }/adventure" class="btn_1">더 보기</a>
					</div>
				</div>
				<!-- /wrapper -->
			</div>
			<!-- /banner -->

		</div>
		<!-- /container -->

		<div class="bg_color_1">
			<div class="container margin_80_55">
				<div class="main_title_2">
					<span><em></em></span>
					<h3>뉴스와 이벤트</h3>
					<p>새로운 소식과 이벤트 그리고 다양한 주제의 칼럼들을 살펴보세요.</p>
				</div>
				<div class="row">
					<c:forEach items="${commentList4 }" var="comment">
					<div class="col-lg-6">
						<a class="box_news" href="${pageContext.request.contextPath }/blog/detail?boardNo=${comment.boardNo }&category=0">
							<figure>
							<c:if test="${empty comment.boardImage }">
								<img src="${pageContext.request.contextPath }/img/board/admin-no-board.png" alt="">
							</c:if>
							<c:if test="${not empty comment.boardImage }">
								<img src="${pageContext.request.contextPath }/img/board/${comment.boardImage}" alt="">
							</c:if>
								<figcaption>
										<c:forTokens items="${comment.boardDate }" delims="-" var="date" varStatus="s">
											<c:if test="${s.index eq 1}">
												<c:set var="month" value="${date }"/>
											</c:if>
											<c:if test="${s.index eq 2}">
												<c:if test="${fn:length(date) eq 11}">
													<c:set var="day" value="${fn:substring(date,0,2) }"/>
												</c:if>
												<c:if test="${fn:length(date) ne 11}">
													<c:set var="day" value="${fn:substring(date,0,1) }"/>
												</c:if>
											</c:if>
										</c:forTokens>
										<strong>${day }</strong>
										${month }월
								</figcaption>
							</figure>
							<h4>${comment.boardTitle }</h4>
							<!-- <p>${comment.boardContent }</p> -->
						</a>
					</div>
					</c:forEach>
					<!-- /box_news -->
				</div>
				<!-- /row -->
				<p class="btn_home_align"><a href="${pageContext.request.contextPath }/blog" class="btn_1 rounded">게시판 바로가기</a></p>
			</div>
			<!-- /container -->
		</div>
		<!-- /bg_color_1 -->

		<div class="call_section">
			<div class="container clearfix">
				<div class="col-lg-5 col-md-6 float-right wow" data-wow-offset="250">
					<div class="block-reveal">
						<div class="block-vertical"></div>
						<div class="box_1">
							<h3>다양한 숙소를 둘러보세요.</h3>
							<p>각 지역별 다양한 숙소 정보를 제공 해드리고 있습니다. 지금 바로 둘러보시겠어요?</p>
							<a href="${pageContext.request.contextPath }/listsearch" class="btn_1 rounded">전체 보기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/call_section-->
	</main>
	<!-- /main -->

	<div id="toTop"></div><!-- Back to top button -->
	
	<jsp:include page="login-popup.jsp"></jsp:include>
	
	</div>
	<!-- page -->
	
	<!-- COMMON SCRIPTS -->
    <script src="${pageContext.request.contextPath }/js/common_scripts.js"></script>
    <script src="${pageContext.request.contextPath }/js/main.js"></script>
	<script src="${pageContext.request.contextPath }/assets/validate.js"></script>
	
	<!-- DATEPICKER  -->
	<script>
	$(function() {
	  'use strict';
	  $('input[name="dates"]').daterangepicker({
		  autoUpdateInput: false,
		  locale: {
			  cancelLabel: 'Clear'
		  }
	  });
	  $('input[name="dates"]').on('apply.daterangepicker', function(ev, picker) {
		  $(this).val(picker.startDate.format('YYYY-MM-DD') + ' ~ ' + picker.endDate.format('YYYY-MM-DD'));
	  });
	  $('input[name="dates"]').on('cancel.daterangepicker', function(ev, picker) {
		  $(this).val('');
	  });
	});
	</script>
	
	<!-- INPUT QUANTITY  -->
	<script src="${pageContext.request.contextPath }/js/input_qty.js"></script>

	<!-- Autocomplete -->
    <script>
    function initMap() {
	  var input = document.getElementById('autocomplete');
	  var autocomplete = new google.maps.places.Autocomplete(input);
	 
	  autocomplete.addListener('place_changed', function() {
	    var place = autocomplete.getPlace();
	    if (!place.geometry) {
	      window.alert("Autocomplete's returned place contains no geometry");
	      return;
	    }

	    var address = '';
	    if (place.address_components) {
	      address = [
	        (place.address_components[0] && place.address_components[0].short_name || ''),
	        (place.address_components[1] && place.address_components[1].short_name || ''),
	        (place.address_components[2] && place.address_components[2].short_name || '')
	      ].join(' ');
	    } 
	  });
	}
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyALAJJ1tqK93WbNKjWpe6bVmbCmSJfjmK8&libraries=places&callback=initMap"></script>
    
	