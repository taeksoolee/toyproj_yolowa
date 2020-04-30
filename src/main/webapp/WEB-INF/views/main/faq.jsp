<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<main>
		<section class="hero_in general">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>무엇을 도와드릴까요?</h1>
					<form class="fadeInUp" method="post" action="${pageContext.request.contextPath }/help">
						<div id="custom-search-input">
							<div class="input-group">
								<input type="text" name="boardContent" class="search-query"  value="${searchText }" placeholder="도움이 필요하신가요? 여기에 입력해주세요. ex)'아..그거 머였지?'">
								<input type="submit" class="btn_search" value="검색">
							</div>
						</div>
					</form>
				</div>
			</div>
		</section>
		
		<!--/hero_in-->
		<div class="container margin_60_35">
			<div class="row">
				<aside class="col-lg-3" id="sidebar">
						<div class="box_style_cat" id="faq_box">
							<ul id="cat_nav">
								<c:if test="${faqBoardList1.size() ne 0 }">
									<li><a href="#payment" class="active" id="paymentBtn"><i class="icon_document_alt"></i>예약 및 결제</a></li>
								</c:if>
								<c:if test="${faqBoardList2.size() ne 0 }">
									<li><a href="#Account" id="accountBtn"><i class="icon_document_alt"></i>계정</a></li>
								</c:if>
								<c:if test="${faqBoardList3.size() ne 0 }">
									<li><a href="#hosting" id="hostingBtn"><i class="icon_document_alt"></i>호스팅</a></li>
								</c:if>
								<c:if test="${faqBoardList4.size() ne 0 }">
									<li><a href="#howtouse" id="howtouseBtn"><i class="icon_document_alt"></i>이용 방법</a></li>
								</c:if>
								<c:if test="${faqBoardList5.size() ne 0 }">
									<li><a href="#termsofuse" id="termsofuseBtn"><i class="icon_document_alt"></i>이용 약관</a></li>
								</c:if>
								<c:if test="${faqBoardList6.size() ne 0 }">
									<li><a href="#accessibility" id="accessibilityBtn"><i class="icon_document_alt"></i>안전 및 접근성</a></li>
								</c:if>
								<li style="display: none"><a href="#${boardNo }" id="hiddenBtn"><i class="icon_document_alt"></i>none</a></li>
							</ul>
						</div>
						<!--/sticky -->
				</aside>
				<!--/aside -->
				
				<div class="col-lg-9" id="faq">
					 
					<c:if test="${faqBoardList1.size() ne 0 }">
					<h4 class="nomargin_top">예약 및 결제</h4>
					</c:if>
					 
					<div role="tablist" class="add_bottom_45 accordion_2" id="payment">
					<c:forEach items="${faqBoardList1 }" var="faqBoard">
						<div class="card" >
							<div class="card-header" role="tab" onclick="updateViewCount(event, '${faqBoard.boardNo }')" >
								<h5 class="mb-0" >
									<a class="collapsed" data-toggle="collapse" href="#collapse${faqBoard.boardNo }" aria-expanded="false" id="${faqBoard.boardNo }" >
									<i class="indicator ti-plus"></i>${faqBoard.boardTitle}</a>
								</h5>
							</div>
							<div id="collapse${faqBoard.boardNo }" class="collapse" role="tabpanel" data-parent="#payment">
								<div class="card-body">
									<p>${faqBoard.boardContent }</p>
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
					<!-- /accordion payment -->
					<c:if test="${faqBoardList2.size() ne 0 }">
					<h4 class="nomargin_top">계정</h4>
					</c:if>
					<div role="tablist" class="add_bottom_45 accordion_2" id="Account">
						
					<c:forEach items="${faqBoardList2 }" var="faqBoard">
						<div class="card">
							<div class="card-header" role="tab" onclick="updateViewCount(event, '${faqBoard.boardNo }')">
								<h5 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#collapse${faqBoard.boardNo }" aria-expanded="false" id="${faqBoard.boardNo }">
									<i class="indicator ti-plus"></i>${faqBoard.boardTitle}</a>
								</h5>
							</div>
							<div id="collapse${faqBoard.boardNo }" class="collapse" role="tabpanel" data-parent="#Account">
								<div class="card-body">
									<p>${faqBoard.boardContent }</p>
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
					<!-- /accordion suggestions -->
					<c:if test="${faqBoardList3.size() ne 0 }">
					<h4 class="nomargin_top">호스팅</h4>
					</c:if>
					<div role="tablist" class="add_bottom_45 accordion_2" id="hosting">
					
					<c:forEach items="${faqBoardList3 }" var="faqBoard">
						<div class="card">
							<div class="card-header" role="tab" onclick="updateViewCount(event, '${faqBoard.boardNo }')">
								<h5 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#collapse${faqBoard.boardNo }" aria-expanded="false" id="${faqBoard.boardNo }">
									<i class="indicator ti-plus"></i>${faqBoard.boardTitle}</a>
								</h5>
							</div>
							<div id="collapse${faqBoard.boardNo }" class="collapse" role="tabpanel" data-parent="#hosting">
								<div class="card-body">
									<p>${faqBoard.boardContent }</p>
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
					<!-- /accordion Reccomendations -->
					<c:if test="${faqBoardList4.size() ne 0 }">
					<h4 class="nomargin_top">이용 방법</h4>
					</c:if>
					<div role="tablist" class="add_bottom_45 accordion_2" id="howtouse">
						
					<c:forEach items="${faqBoardList4 }" var="faqBoard">
						<div class="card">
							<div class="card-header" role="tab" onclick="updateViewCount(event, '${faqBoard.boardNo }')">
								<h5 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#collapse${faqBoard.boardNo }" aria-expanded="false" id="${faqBoard.boardNo }">
									<i class="indicator ti-plus"></i>${faqBoard.boardTitle}</a>
								</h5>
							</div>
							<div id="collapse${faqBoard.boardNo }" class="collapse" role="tabpanel" data-parent="#howtouse">
								<div class="card-body">
									<p>${faqBoard.boardContent }</p>
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
					<!-- /accordion Terms -->
					<c:if test="${faqBoardList5.size() ne 0 }">
					<h4 class="nomargin_top">이용 약관</h4>
					</c:if>
					<div role="tablist" class="add_bottom_45 accordion_2" id="termsofuse">
						
					<c:forEach items="${faqBoardList5 }" var="faqBoard">
						<div class="card">
							<div class="card-header" role="tab" onclick="updateViewCount(event, '${faqBoard.boardNo }')">
								<h5 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#collapse${faqBoard.boardNo }" aria-expanded="false" id="${faqBoard.boardNo }">
									<i class="indicator ti-plus"></i>${faqBoard.boardTitle}</a>
								</h5>
							</div>
							<div id="collapse${faqBoard.boardNo }" class="collapse" role="tabpanel" data-parent="#termsofuse">
								<div class="card-body">
									<p>${faqBoard.boardContent }</p>
								</div>
							</div>
						</div>
					</c:forEach>
						
					</div>
					
					<!-- /accordion Terms -->
					<c:if test="${faqBoardList6.size() ne 0 }">
					<h4 class="nomargin_top">안전 및 접근성</h4>
					</c:if>
					<div role="tablist" class="add_bottom_45 accordion_2" id="accessibility">
						
					<c:forEach items="${faqBoardList6 }" var="faqBoard">
						<div class="card">
							<div class="card-header" role="tab" onclick="updateViewCount(event, '${faqBoard.boardNo }')">
								<h5 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#collapse${faqBoard.boardNo }" aria-expanded="false" id="${faqBoard.boardNo }">
									<i class="indicator ti-plus"></i>${faqBoard.boardTitle}</a>
								</h5>
							</div>
							<div id="collapse${faqBoard.boardNo }" class="collapse" role="tabpanel" data-parent="#accessibility">
								<div class="card-body">
									<p>${faqBoard.boardContent }</p>
								</div>
							</div>
						</div>
					</c:forEach>
						
					</div>
					
					<!-- /accordion Booking -->
				</div>
				<!-- /col -->
			</div>
			<!-- /row -->
		</div>
		<!--/container-->
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
<c:if test="${!empty type }">
<script type="text/javascript">

//help 도움말 창에서 아이콘 클릭시 클릭한 카테고리로 이동하는 스크립트
	var type = ${type };
	
	switch (type) {
	case 1:
		$("#paymentBtn").click();
		break;
	case 2:
		$('#accountBtn').click();
		break;
	case 3:
		$('#hostingBtn').click();
		break;
	case 4:
		$('#howtouseBtn').click();
		break;
	case 5:
		$('#termsofuseBtn').click();
		break;
	case 6:
		$('#accessibilityBtn').click();		
		break;
	
	}
	</script>
</c:if>

<script type="text/javascript">
//board_view_count ajax 메소드
var updateViewCount = function(e, boardNo){
	if(!$(e.target).parent().parent().next().hasClass('show')){
		$.ajax({
			type: "post",
			url: "/yolowa/faq/viewCount",
			data: {
				"boardNo": boardNo	
			},
			dateType: "json",
			success: function(res) {
				console.log(res);
			},
		});			
	}
}

var boardNo=${boardNo };

	if(boardNo!=null){
		$('#hiddenBtn').click();
	}
	
</script>


	

	
	