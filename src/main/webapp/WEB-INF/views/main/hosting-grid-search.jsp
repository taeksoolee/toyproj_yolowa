<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<div id="page">
	
	<main>
		
		<section class="hero_in hotels">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>상세 검색 페이지</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->
		
		<div class="filters_listing sticky_horizontal">
			<div class="container">
				<ul class="clearfix">
					<li>
						<div class="switch-field">
							<input type="radio" id="all" name="listing_filter" value="all" checked data-filter="*" class="selected">
							<label for="all">모두</label>
							<input type="radio" id="popular" name="listing_filter" value="popular" data-filter=".popular">
							<label for="popular">조회순</label>
							<input type="radio" id="latest" name="listing_filter" value="latest" data-filter=".latest">
							<label for="latest">최신순</label>
						</div>
					</li>
					<li>
						<a class="btn_map" data-toggle="collapse" href="#collapseMap" aria-expanded="false" aria-controls="collapseMap" data-text-swap="지도 숨기기" data-text-original="지도 보기">지도 보기</a>
					</li>
				</ul>
			</div>
			<!-- /container -->
		</div>
		<!-- /filters -->
		
		<div class="collapse" id="collapseMap">
			<div id="map" class="map"></div>
		</div>
		<!-- End Map -->

		<div class="container margin_60_35">
			<div class="row">
				<aside class="col-lg-3">
					<div class="custom-search-input-2 inner-2">
						<div class="form-group">
							<input class="form-control" type="text" placeholder="검색어...">
							<i class="icon_search"></i>
						</div>
						<div class="form-group">
							<input class="form-control" type="text" placeholder="장소">
							<i class="icon_pin_alt"></i>
						</div>
						<input type="submit" class="btn_search" value="Search">
					</div>
					<!-- /custom-search-input-2 -->
					<div id="filters_col">
						<a data-toggle="collapse" href="#collapseFilters" aria-expanded="false" aria-controls="collapseFilters" id="filters_col_bt">기본 필터 </a>
						<div class="collapse show" id="collapseFilters">
						
							<div class="filter_type">
                                <h6>요금</h6>
                                <input type="text" id="range" name="range" value="">
                            </div>
							<div class="filter_type">
								<h6>별 등급 </h6>
								<ul>
									<li>
										<label><span class="cat_star"><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i></span> <small>(25)</small></label>
										<input type="checkbox" class="js-switch">
									</li>
									<li>
										<label><span class="cat_star"><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i></span> <small>(25)</small></label>
										<input type="checkbox" class="js-switch">
									</li>
									<li>
										<label><span class="cat_star"><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i></span> <small>(25)</small></label>
										<input type="checkbox" class="js-switch">
									</li>
								</ul>
							</div>
							<div class="filter_type">
								<h6>숙소 유형</h6>
								 <ul>
                                    <li>
                                        <label>아파트</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>주택(펜션)</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>전문숙소</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>독특한 숙소</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                </ul>
							</div>
							
						</div>
						<!--/collapse -->
					</div>
					<!--/filters col-->
					
					<!-- 추가된 필터 -->
					<div id="filters_col">
						<a data-toggle="collapse" href="#collapseFilters2" aria-expanded="false" aria-controls="collapseFilters" id="filters_col_bt">상세 필터 </a>
						<div class="collapse" id="collapseFilters2">														
							<div class="filter_type">
								<h6>사유지</h6>
								 <ul>
                                    <li>
                                        <label>공동사용 여부</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                </ul>
							</div>
							<div class="filter_type">
								<h6>허용 숫자 </h6>
								<ul>
									<li>
										<input class="form-control" type="number" placeholder="침대 갯수">
									</li>
									<li>
										<input class="form-control" type="number" placeholder="방 갯수">
									</li>
									<li>
										<input class="form-control" type="number" placeholder="욕실 갯수">
									</li>
								</ul>
							</div>
							<div class="filter_type">
								<h6>규칙</h6>
								 <ul>
                                    <li>
                                        <label>어린이 숙박(0~12) 적합</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>반려동물 허용</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>흡연 가능</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>행사나 파티 허용</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                </ul>
							</div>
						</div>
						<!--/collapse -->
					</div>
					<!--/filters col-->
					
					<!-- 추가된 필터2 -->
					<div id="filters_col">
						<a data-toggle="collapse" href="#collapseFilters3" aria-expanded="false" aria-controls="collapseFilters" id="filters_col_bt">편의시설 필터 </a>
						<div class="collapse" id="collapseFilters3">														
							<div class="filter_type">
								<h6>편의시설</h6>
								 <ul>
                                    <li>
                                        <label>위생용품</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>무선인터넷</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>TV</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>난방</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>에어컨</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>다리미</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>샴푸</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>헤어드라이어</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>조식 제공</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>책상(작업공간)</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>벽난로</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>옷장(서랍장)</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                </ul>
							</div>
						</div>
						<!--/collapse -->
					</div>
					<!--/filters col-->
					
					<!-- 추가된 필터3 -->
					<div id="filters_col">
						<a data-toggle="collapse" href="#collapseFilters4" aria-expanded="false" aria-controls="collapseFilters" id="filters_col_bt">설비 필터 </a>
						<div class="collapse" id="collapseFilters4">														
							<div class="filter_type">
								<h6>설비</h6>
								 <ul>
                                    <li>
                                        <label>단독 사용 거실</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>주방</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>세탁기</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>건조기</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>주차장</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>헬스장</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>수영장</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>엘리베이터</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                </ul>
							</div>
							<div class="filter_type">
								<h6>안전설비</h6>
								 <ul>
                                    <li>
                                        <label>연기 감지기</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>일산화탄소 감지기</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>구급상자</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                    <li>
                                        <label>소화기</label>
                                        <input type="checkbox" class="js-switch">
                                    </li>
                                </ul>
							</div>
						</div>
						<!--/collapse -->
					</div>
					<!--/filters col-->
					
				</aside>
				<!-- /aside -->
				
				<div class="col-lg-9">
					<div class="isotope-wrapper">
						<div id="hostingContainer" class="row">
							<div class="col-md-6 isotope-item popular">
								<div class="box_grid">
									<figure>
										<a href="#0" class="wish_bt"></a>
										<a href="hotel-detail.jsp"><img src="${pageContext.request.contextPath }/img/hotel_1.jpg" class="img-fluid" alt="" width="800" height="533"><div class="read_more"><span>자세히</span></div></a>
										<small>서울(지역)</small>
									</figure>
									<div class="wrapper">
										<div class="cat_star"><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i></div>
										<h3><a href="hotel-detail.jsp">숙소 이름</a></h3>
										<p>(숙소설명)Id placerat tacimates definitionem sea, prima quidam vim no. Duo nobis persecuti cu.</p>
										<span class="price"> <strong>￦54,000</strong> / 1박</span>
									</div>
									<ul>
										<li><i class="ti-eye"></i> 164 조회</li>
										<li><div class="score"><span>Superb<em>350 후기들</em></span><strong>8.9</strong></div></li>
									</ul>
								</div>
							</div>
							<!-- /box_grid -->
						</div>
						<!-- /row -->
				</div>
				<!-- /isotope-wrapper -->
			
				<p class="text-center"><a id="expandPageBtn" href="" class="btn_1 rounded add_top_30">더 보기</a></p>
				</div>
				<!-- /col -->
			</div>		
		</div>
		<!-- /container -->
		
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
	
	<!-- Map -->
	<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyALAJJ1tqK93WbNKjWpe6bVmbCmSJfjmK8"></script>
	<script src="${pageContext.request.contextPath }/js/markerclusterer.js"></script>
	<script src="${pageContext.request.contextPath }/js/map_hotels.js"></script>
	<script src="${pageContext.request.contextPath }/js/infobox.js"></script>
	
	<!-- Masonry Filtering -->
	<script src="${pageContext.request.contextPath }/js/isotope.min.js"></script>
	<script>
	$(window).on('load', function(){
	  var $container = $('.isotope-wrapper');
	  $container.isotope({ itemSelector: '.isotope-item', layoutMode: 'masonry' });
	});

	$('.filters_listing').on( 'click', 'input', 'change', function(){
	  var selector = $(this).attr('data-filter');
	  $('.isotope-wrapper').isotope({ filter: selector });
	});
	</script>
	
	<!-- Range Slider -->
	<script>
		 $("#range").ionRangeSlider({
            hide_min_max: true,
            keyboard: true,
            min: 10000,
            max: 1000000,
            from: 10000,
            to: 450000,
            type: 'double',
            step: 1,
            prefix: "￦ ",
            grid: false
        });
	</script>
  	
  	<script>
	//렌더링을 위한 뷰 객체 생성
	var review = new Vue({
		  el: '#hostingContainer',
		  data: {
		    hostingList: {}
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
  	
	//더보기 버튼
	$("#expandPageBtn").click(function() {
		baseEndRow += 6;
		hostingDisplay(baseEndRow);
	});
  	
	hostingPerson = ${qtyInput};
	hostingPriceMin = 10000;
	hostingPriceMax = 80000;
  	
	starAvgFive = "";
	starAvgFour = "";
	starAvgThree = "";
	categoryFour = "";
	categoryThree = "";
	categoryTwo = "";
	categoryOne = "";
	
	hostingAddress = "";
	hostingName = "";
	
	hostingPrivate = "";
	hostingBed = "";
	hostingRoom = "";
	hostingBathroom = "";
	
	hostingRule = "";
	hostingAmenities = "";
	hostingFacilities = "";
	hostingSafety = "";
	
	var baseEndRow = 6;
	hostingDisplay(baseEndRow);
	
	//리뷰 목록을 요청하여 출력하는 함수
	function hostingDisplay(endRow) {
		endRow = baseEndRow;
		$.ajax({
			type: "GET",
			url: "gridsearchDisplay?endRow="+endRow+"&hostingPerson="+hostingPerson+"&hostingPriceMin="+hostingPriceMin+"&hostingPriceMax="+hostingPriceMax
					+"&starAvgFive="+starAvgFive+"&starAvgFour="+starAvgFour+"&starAvgThree="+starAvgThree+"&categoryFour="+categoryFour+"&categoryThree="+categoryThree
					+"&categoryTwo="+categoryTwo+"&categoryOne="+categoryOne+"&hostingAddress="+hostingAddress+"&hostingName="+hostingName
					+"&hostingPrivate="+hostingPrivate+"&hostingBed="+hostingBed+"&hostingRoom="+hostingRoom+"&hostingBathroom="+hostingBathroom
					+"&hostingRule="+hostingRule+"&hostingAmenities="+hostingAmenities+"&hostingFacilities="+hostingFacilities+"&hostingSafety="+hostingSafety,
			dataType: "json",
			success: function(json) {
				if (json.length == 0) {
					console.log("검색된 게시글이 존재하지 않습니다.");
					return;
				}
				//review.reviewList = json;
				console.log(json);
				//console.log("삽입완료");
				
			},
			error: function(xhr) {
				alert("응답 에러코드 = " + xhr.status)
			}
		});
	}
  	</script>
