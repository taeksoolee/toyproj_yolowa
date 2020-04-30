<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="#">마이페이지</a>
        </li>
        <li class="breadcrumb-item active">${member.memberName } 님의 마이페이지</li>
      </ol>
      
      <div class="box_general">
			<div class="header_box version_2" style="margin-bottom: 0px;">
				<h2><i class="fa fa-user"></i>프로필 정보</h2>
			</div>
			<div class="list_general">
				<ul>
					<li>
						<span>가입일 : ${member.memberJoinDate } </span>
						<c:if test="${member.memberImage != null }">
						<figure><img src="${pageContext.request.contextPath }/img/member/${member.memberImage}"></figure>
						</c:if>
						<c:if test="${member.memberImage == null }">
						<figure><img src="${pageContext.request.contextPath }/img/avatar.jpg"></figure>
						</c:if>
						<h4>${member.memberName }
						
						<c:if test="${member.memberNo != loginMember.memberNo}">
						<input id="messageReceiverNo" type="hidden" value="${member.memberNo }">
						<a href="" data-toggle="modal" data-target="#sendHostMessage"><i class="sendMessageBt">메세지 보내기</i></a> 
						
						<input type="hidden" id="claimSuspectNo" value="${member.memberNo }">
						<a href="" data-toggle="modal" data-target="#sendHostClaim"><i class="unread">신고하기</i></a>
						</c:if>
						</h4>
						
						<c:if test="${member.memberProfile == null }">
						<div><p>소개 : 안녕하세요! ${member.memberName }입니다.</p></div>							
						</c:if>
						<c:if test="${member.memberProfile != null }">
						<div><p>소개 : ${member.memberProfile }</p></div>
						</c:if>
					</li>
				</ul>
			</div>
		</div>
		<!-- /box_general-->
      
		<div class="box_general">
			<div class="header_box">
				<h2 class="d-inline-block">후기</h2>
			</div>
			<div id="reviewsContainer" class="list_general reviews">
				<ul>
					<li v-for="reviews in reviewList" v-if="reviews.review.reviewNo == reviews.review.reviewRef">
						<span>{{reviews.review.reviewDate | date}}</span>
						<figure><img src="${pageContext.request.contextPath }/img/item_1.jpg" alt=""></figure>
						<h4>{{reviews.writerName}}</h4>
						
						<p>{{reviews.review.reviewContent}}</p>
						<p class="inline-popups"><a href="" data-toggle="modal" data-target="#reSendGuestReview" v-on:click="greet(reviews.review.reviewMemberNo, reviews.review.reviewNo)" class="btn_1 gray"><i class="fa fa-fw fa-reply"></i> 후기에 답글 달기</a></p>
					</li>
					<li v-for="reviews in reviewList" v-if="reviews.review.reviewNo != reviews.review.reviewRef" style="margin-left: 50px;">
						<span>{{reviews.review.reviewDate | date}}</span>
						<figure><img src="${pageContext.request.contextPath }/img/item_1.jpg" alt=""></figure>
						<h4>{{reviews.writerName}}</h4>
						
						<p>{{reviews.review.reviewContent}}</p>
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
	
	<script>
	var review = new Vue({
		  el: '#reviewsContainer',
		  data: {
		    reviewList: {}
		  },
		  filters: {
			    image: function(value) {
			      if (!value) return "";
			      value = value.toString();
			      return `${pageContext.request.contextPath }/img/` + value;
			    	},
			    date: function(value) {
				      if (!value) return "";
				      value = value.toString();
				      return moment(value).format("YYYY년 MM월 DD일");
				    }
			  },
		  methods: { 
			  greet: function (value, value2) { 
				reviewMemberNo = value;
				reviewRef = value2;
			 }
		  }
		})
	
	
	var page = 1;
	reviewDisplay(page);
	
	//리뷰 목록을 요청하여 출력하는 함수
	function reviewDisplay(pageNum) {
		page = pageNum;
		memberNo = ${member.memberNo};
		//console.log(pageNum);
		//console.log(memberNo);
		
		$.ajax({
			type: "GET",
			url: "guestReviewList?pageNum="+pageNum+"&memberNo="+memberNo,
			dataType: "json",
			success: function(json) {
				if (json.length == 0) {
					console.log("검색된 게시글이 존재하지 않습니다.");
					return;
				}
				review.reviewList = json.reviewList;
				//console.log(json);
				//console.log("삽입완료");
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
			html += "<li class='page-item'><a class='page-link' href='javascript:reviewDisplay("+ pager.prevPage +");' tabindex='-1'>이전</a></li>";
		} else {
			html += "<li class='page-item disabled'><a class='page-link' tabindex='-1'>이전</a></li>";
		}
		
		for(var i = pager.startPage; i <= pager.endPage; i++) {
			if(pager.pageNum != i) {
				html += "<li class='page-item'><a class='page-link' href='javascript:reviewDisplay("+ i +");'>"+ i +"</a></li>";
			} else {
				html += "<li class='page-item disabled'><a class='page-link'>"+ i +"</a></li>";
			}
		}
		
		if(pager.endPage != pager.totalPage) {
			html += "<li class='page-item'><a class='page-link' href='javascript:reviewDisplay("+ pager.nextPage +");'>다음</a></li>"
		} else {
			html += "<li class='page-item disabled'><a class='page-link'>다음</a></li>";
		}
		
		$("#pageNumUl").html(html);
	}
	</script>