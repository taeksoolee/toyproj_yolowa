<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="#">호스팅</a>
        </li>
        <li class="breadcrumb-item active">호스팅 관리</li>
      </ol>
		<div class="box_general">
			<div class="header_box">
				<h2 class="d-inline-block">호스트 목록</h2>
				<div class="filter">
					<select id="orderby" name="orderby" class="selectbox">
						<option value="desc">최신순</option>
						<option value="asc">오래된순</option>
					</select>
				</div>
			</div>
			<div id="listGeneral" class="list_general">
				<ul>
					<li v-for="hostings in hostingLists">
						<figure><img v-bind:src="hostings.hostingImage | image" alt=""></figure>
						<small v-if="hostings.hostingCategory == 1">아파트</small>
						<small v-else-if="hostings.hostingCategory == 2">주택(펜션)</small>
						<small v-else-if="hostings.hostingCategory == 3">전문숙소</small>
						<small v-else-if="hostings.hostingCategory == 4">독특한숙소</small>
						<h4>{{hostings.hostingName}}</h4>
						<p>{{hostings.hostingDesc | replace}}</p>
						<p><a v-bind:href="hostings.hostingNo | hostcall" class="btn_1 gray"><i class="fa fa-fw fa-eye"></i> 상세보기</a> &nbsp;
							<a v-bind:href="hostings.hostingNo | modifycall" class="btn_1 gray"><i class="fa fa-fw fa-edit"></i> 수정</a> &nbsp;
							<a href="#0" class="btn_1 gray delete" v-bind:onclick="hostings.hostingNo | deleteBtn"><i class="fa fa-fw fa-remove"></i> 삭제</a></p>
						<ul class="buttons">
							<li><a v-if="hostings.hostingState == 2" class="btn_1 gray wishlist_close" v-bind:onclick="hostings.hostingNo | playBtn"><i class="fa fa-fw fa-play-circle-o"></i> 서비스 재개</a>
							<a v-else-if="hostings.hostingState == 1" class="btn_1 gray delete wishlist_close" v-bind:onclick="hostings.hostingNo | holdBtn"><i class="fa fa-fw fa-times-circle-o"></i> 서비스 일시중지</a></li>
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
					<a class="page-link" href="#" tabindex="-1">Previous</a>
				</li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item">
					<a class="page-link" href="#">Next</a>
				</li>
				!-->
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
	
	<script>
	var hosting = new Vue({
		  el: '#listGeneral',
		  data: {
			  hostingLists: {}
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
	   			hostcall: function(value) {
				      if (!value) return "";
				      value = value.toString();
				      return `${pageContext.request.contextPath }/detail?hostingNo=` + value;
				    },
			   	holdBtn: function(value) {
				      if (!value) return "";
				      value = value.toString();
				      return `modifyStateHosting(` + value + `, 2)`
				    },
			    playBtn: function(value) {
				      if (!value) return "";
				      value = value.toString();
				      return `modifyStateHosting(` + value + `, 1)`
				    },
			    deleteBtn: function(value) {
				      if (!value) return "";
				      value = value.toString();
				      return `modifyStateHosting(` + value + `, 0)`
				    },
			    modifycall: function(value) {
				      if (!value) return "";
				      value = value.toString();
				      return `${pageContext.request.contextPath }/mypage/modifylisting?hostingNo=` + value;
				    },
				replace: function(value) {
				      if (!value) return "";
				      value = value.toString();
				      return value.replace(/(<([^>]+)>)/gi, "");
				    }
			  }
	});
	
	$("#orderby").change(function() {

		order = $(".sbFocus").attr("rel");
		hostingDisplay(page);
	});
	
	var page = 1;
	var order = order = $(".sbFocus").attr("rel");
	hostingDisplay(page);
	
	//게시글 목록을 요청하여 출력하는 함수
	function hostingDisplay(pageNum) {
		page = pageNum;
		
		$.ajax({
			type: "GET",
			url: "hostingList?pageNum=" + pageNum + "&orderby=" + order + "&hostingState=" + ${hostingState},
			dataType: "json",
			success: function(json) {
				if (json.hostingList.length == 0) {
					//alert("검색된 게시글이 존재하지 않습니다.");
					location.href="/yolowa/mypage/dashboard";
					return;
				}
				
				hosting.hostingLists = json.hostingList;
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
			html += "<li class='page-item'><a class='page-link' href='javascript:hostingDisplay("+ pager.prevPage +");' tabindex='-1'>이전</a></li>";
		} else {
			html += "<li class='page-item disabled'><a class='page-link' tabindex='-1'>이전</a></li>";
		}
		
		for(var i = pager.startPage; i <= pager.endPage; i++) {
			if(pager.pageNum != i) {
				html += "<li class='page-item'><a class='page-link' href='javascript:hostingDisplay("+ i +");'>"+ i +"</a></li>";
			} else {
				html += "<li class='page-item disabled'><a class='page-link'>"+ i +"</a></li>";
			}
		}
		
		if(pager.endPage != pager.totalPage) {
			html += "<li class='page-item'><a class='page-link' href='javascript:hostingDisplay("+ pager.nextPage +");'>다음</a></li>"
		} else {
			html += "<li class='page-item disabled'><a class='page-link'>다음</a></li>";
		}
		
		$("#pageNumUl").html(html);
	}
	
	//예약 취소
	function modifyStateHosting(No, state) {
		var hostingNo = No;
		var hostingState = state;
		//console.log(reservationNo);
		
		$.ajax({
			type: "PUT",
			url: "modifyHosting",
			headers: {"content-type":"application/json", "x-HTTP-Method-override":"PUT"},
			data: JSON.stringify({"hostingNo":hostingNo, "hostingState":hostingState}),
			dataType: "text",
			success: function(text) {
				if (text == "success") {
					hostingDisplay(page);
				}
			},
			error: function(xhr) {
				alert("응답 에러코드 = " + xhr.status)
			}
		});
	}
	</script>
