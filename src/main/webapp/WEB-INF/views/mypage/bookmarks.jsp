<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="#">마이페이지</a>
        </li>
        <li class="breadcrumb-item active">북마크</li>
      </ol>
		<div class="box_general">
			<div class="header_box">
				<h2 class="d-inline-block">${loginMember.memberName }님의 북마크</h2>
				<div class="filter">
					<select id="orderby" name="orderby" class="selectbox">
						<option value="desc">최신순</option>
						<option value="asc">오래된순</option>
					</select>
				</div>
			</div>
			<div id="listGeneral" class="list_general">
				<ul>
					<li v-for="bookmarks in bookmarkLists">
						<figure><img v-bind:src="bookmarks.hosting.hostingImage | image" alt=""></figure>
						<small v-if="bookmarks.hosting.hostingCategory == 1">아파트</small>
						<small v-else-if="bookmarks.hosting.hostingCategory == 2">주택(펜션)</small>
						<small v-else-if="bookmarks.hosting.hostingCategory == 3">전문숙소</small>
						<small v-else-if="bookmarks.hosting.hostingCategory == 4">독특한숙소</small>
						<h4>{{bookmarks.hosting.hostingName}} 
						<i v-if="bookmarks.reservation.reservationState == 0" class="cancel">취소</i> 
						<i v-if="bookmarks.reservation.reservationState == 1" class="pending">대기</i> 
						<i v-if="bookmarks.reservation.reservationState == 2" class="approved">승인</i> 
						<i v-if="bookmarks.reservation.reservationState == 3" class="approved">이용완료</i></h4>
						<ul class="booking_list">
							<li><strong>체크인 시간</strong> {{bookmarks.reservation.reservationCheckIn | date}}</li>
							<li><strong>체크아웃 시간</strong>  {{bookmarks.reservation.reservationCheckOut | date}}</li>
							<li><strong>숙박 인원</strong>  {{bookmarks.reservation.reservationGuestNum }}명</li>
							<li><strong>고객 이름</strong> {{bookmarks.reservation.reservationName }}</li>
							<li><strong>지불금액</strong> ￦ {{bookmarks.reservation.reservationTotalPrice | currency }}</li>
						</ul>
						<p><a v-bind:onclick="bookmarks.hosting.hostingMemberNo | messageSendBtn" data-toggle="modal" data-target="#sendHostMessage" class="btn_1 gray"><i class="fa fa-fw fa-envelope"></i> 메세지 보내기</a> &nbsp;
							<a v-bind:href="bookmarks.hosting.hostingNo | hostcall" class="btn_1 gray"><i class="fa fa-fw fa-eye"></i> 상세보기</a> &nbsp;
							<a v-if="bookmarks.reservation.reservationState == 2" v-bind:href="bookmarks.reservation.reservationNo | invoicecall" class="btn_1 gray"><i class="fa fa-fw fa-dollar"></i> 청구서 보기</a> &nbsp;
							<a v-if="bookmarks.reservation.reservationState == 2" class="btn_1 gray" v-bind:onclick="bookmarks.reservation.reservationNo | completelBtn"><i class="fa fa-fw fa-reply"></i> 이용 완료</a></p>
						<ul class="buttons">
							<li><a v-if="bookmarks.reservation.reservationState == 1 || bookmarks.reservation.reservationState == 2" class="btn_1 gray delete wishlist_close" v-bind:onclick="bookmarks.reservation.reservationNo | canselBtn"><i class="fa fa-fw fa-times-circle-o"></i> 예약 취소</a></li>
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
	//렌더링을 위한 뷰 객체 생성
	var bookmark = new Vue({
		  el: '#listGeneral',
		  data: {
		    bookmarkLists: {}
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
	   			hostcall: function(value) {
				      if (!value) return "";
				      value = value.toString();
				      return `${pageContext.request.contextPath }/detail?hostingNo=` + value;
				    },
			    invoicecall: function(value) {
				      if (!value) return "";
				      value = value.toString();
				      return `${pageContext.request.contextPath }/invoice?reservationNo=` + value;
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
			    messageSendBtn: function(value) {
				      if (!value) return "";
				      value = value.toString();
				      return `messageSend(` + value + `)`
				    }
			  }
	});
	
	var page = 1;
	var order = $("#orderby option:selected").val();
	bookmarkDisplay(page, order);
	
	$("#orderby").change(function() {
		//alert($(this).val());
		//alert($(this).children("option:selected").text());

		order = $("#orderby option:selected").val();
		if (order == "desc") {
			$("#orderby option:selected").val("asc");
		} else {
			$("#orderby option:selected").val("desc");
		}
		//console.log(order);
		//console.log(this.value);
		bookmarkDisplay(page, order);
	});
	
	
	//게시글 목록을 요청하여 출력하는 함수
	function bookmarkDisplay(pageNum) {
		page = pageNum;
		orderby = order
		
		$.ajax({
			type: "GET",
			url: "bookmarkList?pageNum=" + pageNum + "&orderby=" + orderby,
			dataType: "json",
			success: function(json) {
				if (json.bookmarkList.length == 0) {
					console.log("검색된 게시글이 존재하지 않습니다.");
					return;
				}
				
				bookmark.bookmarkLists = json.bookmarkList;
				//console.log(json);
				pageDisplay(json.pager);
			},
			error: function(xhr) {
				alert("응답 에러코드 = " + xhr.status)
			}
		});
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
					bookmarkDisplay(page);
				}
			},
			error: function(xhr) {
				alert("응답 에러코드 = " + xhr.status)
			}
		});
	}
	
	//사용완료
	function completeReservation(No) {
		var reservationState = 3;
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
					bookmarkDisplay(page);
				}
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
			//html += "<li class='page-item'><a class='page-link' href='javascript:bookmarkDisplay(1);' tabindex='-1'>처음</a></li>";
			html += "<li class='page-item'><a class='page-link' href='javascript:bookmarkDisplay("+ pager.prevPage +");' tabindex='-1'>이전</a></li>";
		} else {
			html += "<li class='page-item disabled'><a class='page-link' tabindex='-1'>이전</a></li>";
		}
		
		for(var i = pager.startPage; i <= pager.endPage; i++) {
			if(pager.pageNum != i) {
				html += "<li class='page-item'><a class='page-link' href='javascript:bookmarkDisplay("+ i +");'>"+ i +"</a></li>";
			} else {
				html += "<li class='page-item disabled'><a class='page-link'>"+ i +"</a></li>";
			}
		}
		
		if(pager.endPage != pager.totalPage) {
			html += "<li class='page-item'><a class='page-link' href='javascript:boardDisplay("+ pager.nextPage +");'>다음</a></li>"
		} else {
			html += "<li class='page-item disabled'><a class='page-link'>다음</a></li>";
		}
		
		$("#pageNumUl").html(html);
	}
	
	
	</script>