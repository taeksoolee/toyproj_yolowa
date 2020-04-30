<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<div id="page" class="theia-exception">
	
	<main>
		<section class="hero_in hotels_detail">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>${hostingDetail.hosting.hostingName }</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->

		<div class="bg_color_1">
			<nav class="secondary_nav sticky_horizontal">
				<div class="container">
					<ul class="clearfix">
						<li><a href="#description" class="active">숙소 설명</a></li>
						<li><a href="#reviews">후기</a></li>
						<li><a href="#sidebar">예약</a></li>
						<li><a href="#">${hostingDetail.member.memberName }님의 마이페이지</a></li>
						<li></li>
					</ul>
				</div>
			</nav>
			<div class="container margin_60_35">
				<div class="row">
					<div class="col-lg-8">
						<section id="description">
							<h2>숙소 설명</h2>
							<p>
							<c:choose> 
								<c:when test="${hostingDetail.hosting.hostingCategory == 1}">아파트 ·</c:when> 
								<c:when test="${hostingDetail.hosting.hostingCategory == 2}">주택(펜션) ·</c:when> 
								<c:when test="${hostingDetail.hosting.hostingCategory == 3}">전문숙소 ·</c:when> 
								<c:when test="${hostingDetail.hosting.hostingCategory == 4}">독특한숙소 ·</c:when> 
							</c:choose>
							<c:choose> 
								<c:when test="${hostingDetail.hosting.hostingCategory == 1}">개인실 · </c:when> 
								<c:when test="${hostingDetail.hosting.hostingCategory == 2}">룸쉐어 ·</c:when> 
							</c:choose>
							인원 ${hostingDetail.hosting.hostingPerson}명 · 
							침실 ${hostingDetail.hosting.hostingRoom}개 · 
							침대 ${hostingDetail.hosting.hostingBed}개 · 
							욕실 ${hostingDetail.hosting.hostingBathroom}개</p>
							<p>${hostingDetail.hosting.hostingDesc }</p>
							
							<!-- /row -->
							<hr>
							<h3>숙소 이미지</h3>
							<div id="instagram-feed-hotel" class="clearfix">
									
							<!-- 이미지 출력 -->
							<div class="instagram_gallery">
							<!-- 
							<c:forEach var="image" items="images">
							<a href="" target="_blank">	
								<img src="${pageContext.request.contextPath }/img/hosting/" alt="hotelwailea instagram image 0" style="margin:1% 1%;width:14.666666666666666%;float:left;"></a>							
							</c:forEach>
							 -->
							 <c:forTokens var="img" items="${hostingDetail.hosting.hostingImage }" delims="|">
							 	<a href="${pageContext.request.contextPath }/img/hosting/${img }" target="_blank">	
									<img src="${pageContext.request.contextPath }/img/hosting/${img }" alt="hotelwailea instagram image 0" style="margin:1% 1%;width:14.666666666666666%;float:left;"></a>
							 </c:forTokens>
							</div>
							</div>
							<hr>
							
							<c:set var="a1" value="${fn:substring(hostingDetail.hosting.hostingAmenities,0,1)}"/>
							<c:set var="a2" value="${fn:substring(hostingDetail.hosting.hostingAmenities,1,2)}"/>
							<c:set var="a3" value="${fn:substring(hostingDetail.hosting.hostingAmenities,2,3)}"/>
							<c:set var="a4" value="${fn:substring(hostingDetail.hosting.hostingAmenities,3,4)}"/>
							<c:set var="a5" value="${fn:substring(hostingDetail.hosting.hostingAmenities,4,5)}"/>
							<c:set var="a6" value="${fn:substring(hostingDetail.hosting.hostingAmenities,5,6)}"/>
							<c:set var="a7" value="${fn:substring(hostingDetail.hosting.hostingAmenities,6,7)}"/>
							<c:set var="a8" value="${fn:substring(hostingDetail.hosting.hostingAmenities,7,8)}"/>
							<c:set var="a9" value="${fn:substring(hostingDetail.hosting.hostingAmenities,8,9)}"/>
							<c:set var="a10" value="${fn:substring(hostingDetail.hosting.hostingAmenities,9,10)}"/>
							<c:set var="a11" value="${fn:substring(hostingDetail.hosting.hostingAmenities,10,11)}"/>
							<c:set var="a12" value="${fn:substring(hostingDetail.hosting.hostingAmenities,11,12)}"/>
							
							<div class="room_type first">
								<div class="row">
									<div class="col-md-12">
										<h4>편의 시설</h4>
										<p></p>
										<ul class="hotel_facilities">
										<c:if test="${a1 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/a1.jpg" alt="" style="width: 25px; height: 25px">위생용품</li>
										</c:if>
										<c:if test="${a2 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/hotel_facilites_icon_4.svg" alt="">무선 인터넷</li>
										</c:if>
										<c:if test="${a3 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/a3.png" alt="" style="width: 25px; height: 25px">TV</li>
										</c:if>
										<c:if test="${a4 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/a4.svg" alt="" style="width: 25px; height: 25px">난방</li>
										</c:if>
										<c:if test="${a5 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/hotel_facilites_icon_7.svg" alt="">에어컨</li>
										</c:if>
										<c:if test="${a6 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/a6.png" alt="" style="width: 25px; height: 25px">다리미</li>
										</c:if>
										<c:if test="${a7 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/a7.svg" alt="" style="width: 25px; height: 25px">샴푸</li>
										</c:if>
										<c:if test="${a8 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/hotel_facilites_icon_8.svg" alt="">헤어드라이</li>
										</c:if>
										<c:if test="${a9 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/hotel_facilites_icon_1.svg" alt="">조식제공</li>
										</c:if>
										<c:if test="${a10 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/a10.svg" alt="" style="width: 25px; height: 25px">책상</li>
										</c:if>
										<c:if test="${a11 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/a11.svg" alt="" style="width: 25px; height: 25px">벽난로</li>
										</c:if>
										<c:if test="${a12 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/a12.svg" alt="" style="width: 25px; height: 25px">옷장</li>
										</c:if>
										</ul>
									</div>
								</div>
								<!-- /row -->
							</div>
							<!-- /rom_type -->
							
							<c:set var="f1" value="${fn:substring(hostingDetail.hosting.hostingFacilities,0,1)}"/>
							<c:set var="f2" value="${fn:substring(hostingDetail.hosting.hostingFacilities,1,2)}"/>
							<c:set var="f3" value="${fn:substring(hostingDetail.hosting.hostingFacilities,2,3)}"/>
							<c:set var="f4" value="${fn:substring(hostingDetail.hosting.hostingFacilities,3,4)}"/>
							<c:set var="f5" value="${fn:substring(hostingDetail.hosting.hostingFacilities,4,5)}"/>
							<c:set var="f6" value="${fn:substring(hostingDetail.hosting.hostingFacilities,5,6)}"/>
							<c:set var="f7" value="${fn:substring(hostingDetail.hosting.hostingFacilities,6,7)}"/>
							<c:set var="f8" value="${fn:substring(hostingDetail.hosting.hostingFacilities,7,8)}"/>
							
							<c:set var="s1" value="${fn:substring(hostingDetail.hosting.hostingSafety,0,1)}"/>
							<c:set var="s2" value="${fn:substring(hostingDetail.hosting.hostingSafety,1,2)}"/>
							<c:set var="s3" value="${fn:substring(hostingDetail.hosting.hostingSafety,2,3)}"/>
							<c:set var="s4" value="${fn:substring(hostingDetail.hosting.hostingSafety,3,4)}"/>
							
							<div class="room_type gray">
								<div class="row">
									<div class="col-md-12">
										<h4>설비</h4>
										<p></p>
										<ul class="hotel_facilities">
										<c:if test="${f1 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/f1.svg" alt="" style="width: 25px; height: 25px">거실</li>
										</c:if>
										<c:if test="${f2 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/f2.png" alt="" style="width: 25px; height: 25px">주방</li>
										</c:if>
										<c:if test="${f3 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/f3.svg" alt="" style="width: 25px; height: 25px">세탁기</li>
										</c:if>
										<c:if test="${f4 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/f4.png" alt="" style="width: 25px; height: 25px">건조기</li>
										</c:if>
										<c:if test="${f5 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/f5.svg" alt="" style="width: 25px; height: 25px">주차장</li>
										</c:if>
										<c:if test="${f6 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/f6.svg" alt="" style="width: 25px; height: 25px">헬스장</li>
										</c:if>
										<c:if test="${f7 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/hotel_facilites_icon_9.svg" alt="" style="width: 25px; height: 25px">수영장</li>
										</c:if>
										<c:if test="${f8 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/f8.jpg" alt="" style="width: 25px; height: 25px">엘리베이터</li>
										</c:if>
											
										<c:if test="${s1 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/s1.svg" alt="" style="width: 25px; height: 25px">연기 감지기</li>
										</c:if>
										<c:if test="${s2 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/s2.svg" alt="" style="width: 25px; height: 25px">일산화탄소 감지기</li>
										</c:if>
										<c:if test="${s3 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/s3.jpg" alt="" style="width: 25px; height: 25px">구급상자</li>
										</c:if>
										<c:if test="${s4 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/s4.png" alt="" style="width: 25px; height: 25px">소화기</li>
										</c:if>
											
										</ul>
									</div>
								</div>
								<!-- /row -->
							</div>
							<!-- /rom_type -->
							
							<c:set var="r1" value="${fn:substring(hostingDetail.hosting.hostingRule,0,1)}"/>
							<c:set var="r2" value="${fn:substring(hostingDetail.hosting.hostingRule,1,2)}"/>
							<c:set var="r3" value="${fn:substring(hostingDetail.hosting.hostingRule,2,3)}"/>
							<c:set var="r4" value="${fn:substring(hostingDetail.hosting.hostingRule,3,4)}"/>
							
							<div class="room_type last">
								<div class="row">
									<div class="col-md-12">
										<h4>이용규칙 및 세부사항</h4>
										<p>${hostingDetail.hosting.hostingRuleDetail }</p>
										<ul class="hotel_facilities">
										<c:if test="${r1 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/b1.jpg" alt="" style="width: 25px; height: 25px">아이 적합</li>
										</c:if>
										<c:if test="${r2 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/b2.png" alt="" style="width: 25px; height: 25px">애완동물 허용</li>
										</c:if>
										<c:if test="${r3 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/b3.svg" alt="" style="width: 25px; height: 25px">흡연 가능</li>
										</c:if>
										<c:if test="${r4 == 1}">
											<li><img src="${pageContext.request.contextPath }/img/b4.svg" alt="" style="width: 25px; height: 25px">파티 가능</li>
										</c:if>
										</ul>
									</div>
								</div>
								<!-- /row -->
							</div>
							<!-- /rom_type -->

						</section>
						<!-- /section -->
					
						<section id="reviews">
							<h2>후기</h2>
							<div class="reviews-container">
								<div class="row">
									<div class="col-lg-3">
										<div id="review_summary">
											<strong>{{starCounts.starAvg}} 점</strong>
											<small>{{starCounts.starTotal}}개의 후기.</small>
										</div>
									</div>
									<div class="col-lg-9">
										<div class="row">
											<div class="col-lg-10 col-9">
												<div class="progress">
													<div id="barFive" class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</div>
											<div class="col-lg-2 col-3"><small><strong>5 stars</strong></small></div>
										</div>
										<!-- /row -->
										<div class="row">
											<div class="col-lg-10 col-9">
												<div class="progress">
													<div id="barFour" class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</div>
											<div class="col-lg-2 col-3"><small><strong>4 stars</strong></small></div>
										</div>
										<!-- /row -->
										<div class="row">
											<div class="col-lg-10 col-9">
												<div class="progress">
													<div id="barThree" class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</div>
											<div class="col-lg-2 col-3"><small><strong>3 stars</strong></small></div>
										</div>
										<!-- /row -->
										<div class="row">
											<div class="col-lg-10 col-9">
												<div class="progress">
													<div id="barTwo" class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</div>
											<div class="col-lg-2 col-3"><small><strong>2 stars</strong></small></div>
										</div>
										<!-- /row -->
										<div class="row">
											<div class="col-lg-10 col-9">
												<div class="progress">
													<div id="barOne" class="progress-bar" role="progressbar" style="width: 0" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</div>
											<div class="col-lg-2 col-3"><small><strong>1 stars</strong></small></div>
										</div>
										<!-- /row -->
									</div>
								</div>
								<!-- /row -->
							</div>

							<hr v-if="reviewList != null">

							<div v-if="reviewList != null" id="reviewsContainer" class="reviews-container">

								<div class="review-box clearfix" v-for="reviews in reviewList">
									<figure class="rev-thumb">
										<img v-if="reviews.writerImage == null" src="${pageContext.request.contextPath }/img/avatar.jpg">
										<img v-if="reviews.writerImage != null" v-bind:src="reviews.writerImage | image">
									</figure>
									<div class="rev-content">
										<div class="rating">
											<template v-if="reviews.review.reviewStar == 1 || reviews.review.reviewStar == 2">
												<i class="icon_star voted"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i>
											</template>
											<template v-else-if="reviews.review.reviewStar == 3 || reviews.review.reviewStar == 4">
												<i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i>
											</template>
											<template v-else-if="reviews.review.reviewStar == 5 || reviews.review.reviewStar == 6">
												<i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star"></i><i class="icon_star"></i>
											</template>
											<template v-else-if="reviews.review.reviewStar == 7 || reviews.review.reviewStar == 8">
												<i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star"></i>
											</template>
											<template v-else-if="reviews.review.reviewStar == 9 || reviews.review.reviewStar == 10">
												<i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i>
											</template>
										</div>
										<div class="rev-info">
											{{reviews.writerName}} – {{reviews.review.reviewDate | date}}:
										</div>
										<div class="rev-text">
											<p>
												{{reviews.review.reviewContent}}
											</p>
										</div>
									</div>
								</div>
								<!-- /review-box -->
							</div>
							<!-- /review-container -->
							<p v-if="reviewList != null" class="text-center add_top_60" style="margin-top: 20px; margin-bottom: 20px;"><a id="expandPageBtn" class="btn_1 rounded">더 보기</a></p>
							
						</section>
						<!-- /section -->
						<hr>

							<div class="add-review">
								<h5>후기 남기기</h5>
								<form>
									<div class="row">
										<div class="form-group col-md-6">
											<label>등급 </label>
											<div class="custom-select-form">
											<select id="rating_review" class="wide">
												<option value="1">1 (최소)</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5" selected>5 (평균)</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
												<option value="9">9</option>
												<option value="10">10 (최고)</option>
											</select>
											</div>
										</div>
										<div class="form-group col-md-12">
											<label>당신의 후기</label>
											<textarea id="review_text" class="form-control" style="height:130px;"></textarea>
										</div>
										<div class="form-group col-md-12 add_top_20">
											<input type="button" value="후기 등록" class="btn_1" id="submitReview">
										</div>
									</div>
								</form>
							</div>
					</div>
					<!-- /col -->
					
					<aside class="col-lg-4" id="sidebar">
						<div class="box_detail booking">
							<div id="price" class="price">
								<span>￦<fmt:formatNumber value="${hostingDetail.hosting.hostingPrice  }" type="number"/> <small>/ 1박</small></span>
								<div class="score">
								<span><em>{{starCounts.starTotal}} 후기들</em></span>
								<strong>{{starCounts.starAvg}} 점</strong></div>
							</div>

							<div class="form-group">
								<c:if test="${loginMember.memberNo != null}">
									<input id="dates" class="form-control" type="text" name="dates" placeholder=" 일정" value="${dates }" readonly="readonly" autocomplete="off" style="background:white;">
									<i class="icon_calendar"></i>
								</c:if>
								<c:if test="${loginMember.memberNo == null}">
									<input class="form-control" type="text" name="text" placeholder=" 로그인 후 이용바랍니다." readonly="readonly" style="background:white;">
									<i class="icon_calendar"></i>
								</c:if>
							</div>
							
							<div class="panel-dropdown">
								<a href="#">인원 <span class="qtyTotal">1</span></a>
								<div class="panel-dropdown-content right">
									<div class="qtyButtons">
										<label>숙박인원</label>
										<input id="guestNum" type="text" name="qtyInput" value="${qtyInput }">
									</div>
								</div>
							</div>
							<form id="order" method="post" action="order1">
							<input id="host" type="hidden" name="reservationHostingNo" value="${hostingDetail.hosting.hostingNo }">
							<input id="checkIn" type="hidden" name="reservationCheckIn" value="">
							<input id="checkOut" type="hidden" name="reservationCheckOut" value="">
							<input id="reservationCommission" type="hidden" name="reservationCommission" value="">
							<input id="reservationTotalPrice" type="hidden" name="reservationTotalPrice" value="">
							<input id="reservationGuestNum" type="hidden" name="reservationGuestNum" value="">
							<c:if test="${loginMember.memberNo != null}">
							<button id="orderBtn" class=" add_top_30 btn_1 full-width purchase">예약하기</button>
							</c:if>
							<c:if test="${loginMember.memberNo == null}">
							<button id="orderBtn" class=" add_top_30 btn_1 full-width purchase" style="display:none;">예약하기</button>
							<!-- <a class=" add_top_30 btn_1 full-width purchase">예약하기</a> -->
							</c:if>
							</form>
							<c:if test="${loginMember.memberNo != null}">
								<c:if test="${empty wishlist }">
									<a id="addWishlistBt" class="btn_1 full-width outline wishlist"><i class="icon_heart"></i> 위시리스트 추가</a>
								</c:if>
							</c:if>
							<c:if test="${loginMember.memberNo == null}">
								<a id="addWishlistBt" class="btn_1 full-width outline wishlist" style="display:none;"><i class="icon_heart"></i> 위시리스트 추가</a>
							</c:if>
							<div class="text-center"><small>이 단계에서는 요금이 지불되지 않습니다.</small></div>
						</div>
						<ul class="share-buttons">
							<li><a class="twitter-share" data-toggle="modal" data-target="#sendHostMessage"><i class="social_twitter"></i> 문의</a></li>
							<li><a class="gplus-share" data-toggle="modal" data-target="#sendHostClaim"><i class="social_googleplus"></i> 신고</a></li>
						</ul>
					</aside>
				</div>
				<!-- /row -->

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
	
	<!-- Map -->
	<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyALAJJ1tqK93WbNKjWpe6bVmbCmSJfjmK8"></script>
	<script src="${pageContext.request.contextPath }/js/map_single_hotel.js"></script>
	<script src="${pageContext.request.contextPath }/js/infobox.js"></script>
	
	<!-- DATEPICKER  -->
	<script>
	var price = new Vue({
		el: '#price',
		data: {
			starCounts: {}
		}
	});
	
	//별 카운팅 뷰 객체
	var starCalc = new Vue({
		el: '#review_summary',
		data: {
			starCounts: {}
		}
	});
	
	//렌더링을 위한 뷰 객체 생성
	var review = new Vue({
		  el: '#reviewsContainer',
		  data: {
		    reviewList: {}
		  },
		  filters: {
			    image: function(value) {
			      if (!value) return "";
			      value = value.toString();
			      return `${pageContext.request.contextPath }/img/member/` + value;
			    	},
			    date: function(value) {
				      if (!value) return "";
				      value = value.toString();
				      return moment(value).format("YYYY년 MM월 DD일");
				    }
			  }
		})
	
	$(function() {
	  $('input[name="dates"]').daterangepicker({
		  autoUpdateInput: false,
		  opens: 'left',
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
	
	//리뷰 목록을 위한 변수
	var baseEndRow = 3;
	var hostingNo = ${hostingDetail.hosting.hostingNo};
	reviewDisplay(baseEndRow);
	countStar();
	
	//리뷰 목록을 요청하여 출력하는 함수
	function reviewDisplay(endRow) {
		endRow = baseEndRow;
		$.ajax({
			type: "GET",
			url: "detailReviewDisplay?hostingNo="+hostingNo+"&endRow="+endRow,
			dataType: "json",
			success: function(json) {
				if (json.length == 0) {
					console.log("검색된 게시글이 존재하지 않습니다.");
					return;
				}
				review.reviewList = json;
				//console.log(json);
				//console.log("삽입완료");
				
			},
			error: function(xhr) {
				alert("응답 에러코드 = " + xhr.status)
			}
		});
	}
	
	//스타 카운팅
	function countStar() {
		$.ajax({
			type: "GET",
			url: "detailStarCount?hostingNo="+hostingNo,
			dataType: "json",
			success: function(json) {
				if (json.length == 0) {
					console.log("검색된 객체가 존재하지 않습니다.");
					return;
				}
				
				starCalc.starCounts = json;
				price.starCounts = json;
				$("#barFive").attr('style', "width:"+json.starFive / json.starTotal * 100 + "%");
				$("#barFour").attr('style', "width:"+json.starFour / json.starTotal * 100 + "%");
				$("#barThree").attr('style', "width:"+json.starThree / json.starTotal * 100 + "%");
				$("#barTwo").attr('style', "width:"+json.starTwo / json.starTotal * 100 + "%");
				$("#barOne").attr('style', "width:"+json.starOne / json.starTotal * 100 + "%");
				//console.log("삽입완료");
				
			},
			error: function(xhr) {
				alert("응답 에러코드 = " + xhr.status)
			}
		});
	}
	
	//더보기 버튼
	$("#expandPageBtn").click(function() {
		baseEndRow += 10;
		reviewDisplay(baseEndRow);
		countStar();
	});
	
	//리뷰 입력
	$("#submitReview").click(function() {
		reviewHostingNo = ${hostingDetail.hosting.hostingNo};
		reviewWriterNo = ${loginMember.memberNo}
		reviewContent = $("#review_text").val();
		reviewStar = $("#rating_review").val();
		
		//console.log();
		
		if (reviewWriterNo == "") {
			alert("로그인 해주세요");
			return;
		}
		
		if (reviewContent == "") {
			alert("내용을 입력해 주세요.");
			return;
		}
		
		$.ajax({
			type: "POST",
			url: "writeHostReview",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({"reviewHostingNo":reviewHostingNo, 
				"reviewWriterNo":reviewWriterNo, "reviewContent":reviewContent, "reviewStar":reviewStar}),
			dataType: "text",
			success: function(text) {
				if (text == "success") {
					//console.log("리뷰 등록 성공.");
					$("#review_text").val("");
				}
				reviewDisplay(baseEndRow);
				countStar();
			},
			error: function(xhr) {
				alert("응답 에러코드 = " + xhr.status)
			}
		});
	});
	
	//전달값 계산 및 예약 실행 스크립트
	$("#orderBtn").click(function() {
		dates = $("#dates").val().split('~');
		
		//게스트 숫자 전달
		$("#reservationGuestNum").val($("#guestNum").val());

		//날짜 계산을 위한 
		checkIn = dates[0];
		checkOut = dates[1];
		
		$("#checkIn").val(checkIn);
		$("#checkOut").val(checkOut);
		
		day = moment(checkOut).diff(moment(checkIn),"day");
		totalPrice = day * ${hostingDetail.hosting.hostingPrice};
		$("#reservationTotalPrice").val(day * ${hostingDetail.hosting.hostingPrice});
		$("#reservationCommission").val(parseInt(totalPrice * 8 / 100));
		
		if ($("#checkIn").val() == "" || $("#checkOut").val() == "" || $("#reservationGuestNum").val() == "") {
			showAlert('오류메시지', '날짜를 선택해주세요.', ()=>{
			});
				return false;
		}
		
		$("#order").submit();
		//console.log(commission);
		
	});
	
	//
	$("#addWishlistBt").click(function() {
		hostingNo = ${hostingDetail.hosting.hostingNo};
		
		//console.log();
		
		$.ajax({
			type: "GET",
			url: "addWishlist?hostingNo=" + hostingNo,
			dataType: "text",
			success: function(text) {
				if (text == "success") {
					console.log("위시리스트 등록 성공.");
				}
			},
			error: function(xhr) {
				alert("응답 에러코드 = " + xhr.status)
			}
		});
		
		showAlert('알림메시지', '위시리스트에 등록되었습니다.', ()=>{
			location.reload();
		});
	});
	</script>
	
	<%-- <c:if test="${loginMember.memberNo == null}">
	<script type="text/javascript">
	$("#orderBtn").click(function() {
		
		
		
			showAlert('오류메시지', '로그인 후 이용해주세요.', ()=>{
				return false;
			});
		}
			
	});
	</script>
	</c:if> --%>
	
	<!-- INPUT QUANTITY  -->
	<script src="${pageContext.request.contextPath }/js/input_qty.js"></script>
	
