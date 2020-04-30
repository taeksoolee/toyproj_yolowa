<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<div id="page">
	
	<main>
		
		<section class="hero_in hotels">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>검색 결과</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->

		<div class="container margin_60_35">
			<!-- /custom-search-input-2 -->
			<div id="hostingContainer" class="isotope-wrapper">
			<div v-for="hostings in hostingList">
			<div class="box_list isotope-item latest" >
				<div class="row no-gutters">
					<div class="col-lg-5">
						<figure>
							<small>{{hostings.hosting.hostingAddress | subLocal}}</small>
							<a v-bind:href="hostings.hosting.hostingNo | hostcall">
							<img v-bind:src="hostings.hosting.hostingImage | image" class="img-fluid" alt="" width="800" height="533">
							<div class="read_more"><span>자세히</span></div></a>
						</figure>
					</div>
					<div class="col-lg-7">
						<div class="wrapper">
							
							<div class="cat_star">
							<template v-if="hostings.reviewStarAvg == 1 || hostings.reviewStarAvg == 2">
								<i class="icon_star"></i>
							</template>
							<template v-if="hostings.reviewStarAvg == 3 || hostings.reviewStarAvg == 4">
								<i class="icon_star"></i><i class="icon_star"></i>
							</template>
							<template v-else-if="hostings.reviewStarAvg == 5 || hostings.reviewStarAvg == 6">
								<i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i>
							</template>
							<template v-else-if="hostings.reviewStarAvg == 7 || hostings.reviewStarAvg == 8">
								<i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i>
							</template>
							<template v-else-if="hostings.reviewStarAvg == 9 || hostings.reviewStarAvg == 10">
								<i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i>
							</template>
							
							</div>
							<h3><a v-bind:href="hostings.hosting.hostingNo | hostcall">{{hostings.hosting.hostingName}}</a></h3>
							<p>{{hostings.hosting.hostingDesc | replace}}</p>
							<span class="price"> <strong>￦{{hostings.hosting.hostingPrice | currency}}</strong> / 1박</span>
						</div>
						<ul>
							<li><i class="ti-eye"></i> {{hostings.hosting.hostingViewCount}} 조회</li>
							<li><div class="score"><span><em>{{hostings.reviewNoCount}} 후기들</em></span><strong>{{hostings.reviewStarAvg}}</strong></div></li>
						</ul>
					</div>
				</div>
			</div>
			</div>
			<!-- /box_list -->
			</div>
			<!-- /isotope-wrapper -->
			
			<p id="expandPageBtn" class="text-center add_top_60"><a href="#0" class="btn_1 rounded">더 보기</a></p>
		
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
							<h4>Payments and Refunds</h4>
							<p>Qui ea nemore eruditi, magna prima possit eu mei.</p>
						</a>
					</div>
					<div class="col-md-4">
						<a href="#0" class="boxed_list">
							<i class="pe-7s-note2"></i>
							<h4>Quality Standards</h4>
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
	
	<script>
	//렌더링을 위한 뷰 객체 생성
	var host = new Vue({
		  el: '#hostingContainer',
		  data: {
		    hostingList: {}
		  },
		  filters: {
			    image: function(value) {
			      if (!value) return "";
			      value = value.split('|');
			      return `${pageContext.request.contextPath }/img/hosting/` + value[0];
			    	},
			    date: function(value) {
				      if (!value) return "";
				      value = value.toString();
				      return moment(value).format("YYYY년 MM월 DD일");
				    },
			    currency: function(value) {
		   			 if (!value) return 0
		   			 return value.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
		   			},
		   		subLocal: function(value) {
					if (!value) return 0
					return value.substring(0,2)
				},
				hostcall: function(value) {
				      if (!value) return "";
				      value = value.toString();
				      return `${pageContext.request.contextPath }/detail?hostingNo=` + value;
				    },
			    replace: function(value) {
				      if (!value) return "";
				      value = value.toString();
				      return value.replace(/(<([^>]+)>)/gi, "");
				    }
			  }
		})
  	
	//더보기 버튼
	$("#expandPageBtn").click(function() {
		baseEndRow += 6;
		hostingDisplay(baseEndRow);
	});
	
	//var address = `${address}`;
	
	//var test = "te,e,s,t";
	//test2 = test.split(",");
	//alert(test2[0]);
	
	var hostAddress = `${hostAddress}`;
	//alert(hostAddress);
	//alert(address);
	
	var baseEndRow = 6;
	hostingDisplay(baseEndRow);
	//"&dates="+dates+"&qtyInput="+qtyInput+"
	//리뷰 목록을 요청하여 출력하는 함수
	function hostingDisplay(endRow) {
		endRow = baseEndRow;
		//alert(hostAddress)
		$.ajax({
			type: "GET",
			url: "listsearchDisplay?hostAddress="+hostAddress+"&endRow="+endRow,
			dataType: "json",
			success: function(json) {
				if (json.hostingList.length == 0) {
					console.log("검색된 게시글이 존재하지 않습니다.");
					showAlert("경고메세지", "검색된 메세지가 없습니다.");
					location.href="${pageContext.request.contextPath }/";
					return;
				}
				host.hostingList = json.hostingList;
				console.log(host.hostingList);
				//console.log("삽입완료");
				$("#hostingContainer").removeAttr("style");
			},
			error: function(xhr) {
				alert("응답 에러코드 = " + xhr.status)
			}
		});
	}
	
  	</script>