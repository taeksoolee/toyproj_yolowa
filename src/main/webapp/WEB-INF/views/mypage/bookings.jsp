<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="#">호스팅</a>
        </li>
        <li class="breadcrumb-item active">예약 현황</li>
      </ol>
		<div class="box_general">
			<div class="header_box">
				<h2 class="d-inline-block">예약 목록</h2>
				<div class="filter">
					<select id="orderby" class="selectbox">
						<option value="Any status">모든 상태</option>
						<option value="Pending">대기</option>
						<option value="Approved">승인</option>
						<option value="complete">이용완료</option>
						<option value="Cancelled">취소</option>
					</select>
				</div>
			</div>
			<div id="listGeneral" class="list_general">
				<ul>
					<li v-for="bookings in bookingLists">
						<figure><img v-bind:src="bookings.hosting.hostingImage | image" alt=""></figure>
						<h4>{{bookings.hosting.hostingName}}  
						<i class="pending" v-if="bookings.reservation.reservationState == 1">대기</i> 
						<i class="cancel" v-if="bookings.reservation.reservationState == 0">취소</i> 
						<i class="approved" v-if="bookings.reservation.reservationState == 2">승인</i> 
						<i class="approved" v-if="bookings.reservation.reservationState == 3">이용완료</i> </h4>
						<ul class="booking_list">
							<li><strong>체크인 시간</strong> {{bookings.reservation.reservationCheckIn | date}}</li>
							<li><strong>체크아웃 시간</strong> {{bookings.reservation.reservationCheckOut | date}}</li>
							<li><strong>숙박 인원</strong> {{bookings.reservation.reservationGuestNum }}명</li>
							<li><strong>고객 이름</strong> {{bookings.reservation.reservationName }}</li>
							<li><strong>지불금액</strong> ￦ {{bookings.reservation.reservationTotalPrice | currency }}</li>
						</ul>
						<p><a v-bind:onclick="bookings.reservation.reservationMemberNo | messageSendBtn" data-toggle="modal" data-target="#sendHostMessage" class="btn_1 gray"><i class="fa fa-fw fa-envelope"></i> 메세지 보내기</a> &nbsp;
						<a v-bind:href="bookings.reservation.reservationMemberNo | gestcall" class="btn_1 gray"><i class="fa fa-fw fa-eye"></i> 게스트 프로필</a> &nbsp;
						<a v-if="bookings.reservation.reservationState == 2 || bookings.reservation.reservationState == 3" v-bind:onclick="bookings.reservation.reservationMemberNo | reviewSendBtn" data-toggle="modal" data-target="#sendGuestReview" class="btn_1 gray"><i class="fa fa-fw fa-reply"></i> 게스트 후기작성</a></p>  
						<ul class="buttons">
							<li><a v-if="bookings.reservation.reservationState == 1" v-bind:onclick="bookings.reservation.reservationNo | completelBtn" class="btn_1 gray approve"><i class="fa fa-fw fa-check-circle-o"></i> 수락</a></li>
							<li><a v-if="bookings.reservation.reservationState == 1 || bookings.reservation.reservationState == 2" v-bind:onclick="bookings.reservation.reservationNo | canselBtn" class="btn_1 gray delete"><i class="fa fa-fw fa-times-circle-o"></i> 취소</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<!-- /box_general-->
		<nav aria-label="...">
			<ul id="pageNumUl" class="pagination pagination-sm add_bottom_30">
				<!-- 
				<li class="page-item disabled">
					<a class="page-link" href="#" tabindex="-1">이전</a>
				</li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item">
					<a class="page-link" href="#">다음</a>
				</li>
				 -->
			</ul>
		</nav>
		<!-- /pagination-->
	  </div>
	  <!-- /container-fluid-->
   	</div>
    <!-- /container-wrapper-->

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/vendor/chart.js/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/datatables/jquery.dataTables.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/datatables/dataTables.bootstrap4.js"></script>
	<script src="${pageContext.request.contextPath }/vendor/jquery.selectbox-0.2.js"></script>
	<script src="${pageContext.request.contextPath }/vendor/retina-replace.min.js"></script>
	<script src="${pageContext.request.contextPath }/vendor/jquery.magnific-popup.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/js/admin.js"></script>
	
	<script type="text/javascript">
	var booking = new Vue({
		  el: '#listGeneral',
		  data: {
		    bookingLists: {}
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
	   			gestcall: function(value) {
				      if (!value) return "";
				      value = value.toString();
				      return `${pageContext.request.contextPath }/mypage/reviews?memberNo=` + value;
				    },
			   	canselBtn: function(value) {
				      if (!value) return "";
				      value = value.toString();
				      return `canselReservation(` + value + `)`
				    },
				completelBtn: function(value) {
				      if (!value) return "";
				      value = value.toString();
				      return `completeReservation(` + value + `)`
				    },
				reviewSendBtn: function(value) {
				      if (!value) return "";
				      value = value.toString();
				      return `reviewSend(` + value + `)`
				    },
			    messageSendBtn: function(value) {
				      if (!value) return "";
				      value = value.toString();
				      return `messageSend(` + value + `)`
				    }
			  }
	});
	
	$("#orderby").change(function() {

		order = $(".sbFocus").attr("rel");
		bookingDisplay(page);
	});
	
	var page = 1;
	var order = order = $(".sbFocus").attr("rel");
	bookingDisplay(page);
	
	//게시글 목록을 요청하여 출력하는 함수
	function bookingDisplay(pageNum) {
		page = pageNum;
		//console.log(pageNum);
		
		if (order == "Any status") {
			reservationState = 4;
		} else if (order == "complete") {
			reservationState = 3;
		} else if (order == "Approved") {
			reservationState = 2;
		} else if (order == "Pending") {
			reservationState = 1;
		} else if (order == "Cancelled") {
			reservationState = 0;
		}
		
		//console.log(order);
		
		$.ajax({
			type: "GET",
			url: "bookingList?pageNum=" + pageNum + "&reservationState=" + reservationState,
			dataType: "json",
			success: function(json) {
				if (json.bookingList.length == 0) {
					alert("검색된 게시글이 존재하지 않습니다.");
					return;
				}
				
				booking.bookingLists = json.bookingList;
				//console.log(json);
				pageDisplay(json.pager);
			},
			error: function(xhr) {
				alert("응답 에러코드 = " + xhr.status)
			}
		});
	}
	
	//페이지 번호를 출력하기 위한 함수
	function pageDisplay(pager) {
		var html = "";
		if(pager.startPage>pager.blockSize) {
			html += "<li class='page-item'><a class='page-link' href='javascript:bookingDisplay("+ pager.prevPage +");' tabindex='-1'>이전</a></li>";
		} else {
			html += "<li class='page-item disabled'><a class='page-link' tabindex='-1'>이전</a></li>";
		}
		
		for(var i = pager.startPage; i <= pager.endPage; i++) {
			if(pager.pageNum != i) {
				html += "<li class='page-item'><a class='page-link' href='javascript:bookingDisplay("+ i +");'>"+ i +"</a></li>";
			} else {
				html += "<li class='page-item disabled'><a class='page-link'>"+ i +"</a></li>";
			}
		}
		
		if(pager.endPage != pager.totalPage) {
			html += "<li class='page-item'><a class='page-link' href='javascript:bookingDisplay("+ pager.nextPage +");'>다음</a></li>"
		} else {
			html += "<li class='page-item disabled'><a class='page-link'>다음</a></li>";
		}
		
		$("#pageNumUl").html(html);
	}
	
	//예약 취소
	function canselReservation(No) {
		var reservationState = 0;
		var reservationNo = No;
		//console.log(reservationNo);
		
		$.ajax({
			type: "PUT",
			url: "modifyReservationState",
			headers: {"content-type":"application/json", "x-HTTP-Method-override":"PUT"},
			data: JSON.stringify({"reservationState":reservationState, "reservationNo":reservationNo}),
			dataType: "text",
			success: function(text) {
				if (text == "success") {
					bookingDisplay(page);
				}
			},
			error: function(xhr) {
				alert("응답 에러코드 = " + xhr.status)
			}
		});
	}
	
	//수락
	function completeReservation(No) {
		var reservationState = 2;
		var reservationNo = No;
		//console.log(reservationNo);
		
		$.ajax({
			type: "PUT",
			url: "modifyReservationState",
			headers: {"content-type":"application/json", "x-HTTP-Method-override":"PUT"},
			data: JSON.stringify({"reservationState":reservationState, "reservationNo":reservationNo}),
			dataType: "text",
			success: function(text) {
				if (text == "success") {
					bookingDisplay(page);
				}
			},
			error: function(xhr) {
				alert("응답 에러코드 = " + xhr.status)
			}
		});
	}
	</script>