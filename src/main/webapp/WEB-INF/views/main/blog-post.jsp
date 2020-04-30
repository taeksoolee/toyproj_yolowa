<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- /post meta -->
<div id="boardNoDiv" style="display:none;">${map.boardNo }</div>	
	<div id="page">
			
	<main>
		<section class="hero_in general">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>${boardComment.board.boardTitle }</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->

		<div class="container margin_60_35">
			<div class="row">
				<div class="col-lg-9">
					<div class="bloglist singlepost">
					
						<c:if test="${empty boardComment.board.boardImage }">
						<p><img alt="" class="img-fluid" src="${pageContext.request.contextPath }/img/board/admin-no-board.png"></p>
						</c:if>
						<c:if test="${not empty boardComment.board.boardImage }">
						<p><img alt="" class="img-fluid" src="${pageContext.request.contextPath }/img/board/${boardComment.board.boardImage}"></p>
						</c:if>
						
						
						<!-- <h1></h1> -->
						<div class="postmeta">
							<ul>
								<li><a href="#"><i class="icon_folder-alt"></i>&nbsp;&nbsp;
								<c:choose>
								<c:when test="${boardComment.board.boardCategory eq 1 }">
									뉴스
								</c:when>
								<c:when test="${boardComment.board.boardCategory eq 2 }">
									이벤트
								</c:when>
								<c:when test="${boardComment.board.boardCategory eq 3 }">
									칼럼
								</c:when>
								</c:choose>
								</a></li>
								<li><a><i class="icon_clock_alt"></i>&nbsp;&nbsp;
									${fn:substring(boardComment.board.boardDate, 0, 10) }
								</a></li>
								<li><a><i class="icon_pencil-edit"></i>&nbsp;&nbsp;${boardComment.memberName }</a></li>
								<li><a href="#review"><i class="icon_comment_alt"></i> (<span id="reviewCount"></span>)</span> 후기들</a></li>
							</ul>
						</div>
						
						<div class="post-content">
							<div class="dropcaps">
								<p>${boardComment.board.boardContent }</p>
								<!-- <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p> -->
							</div>
				
						</div>
						<!-- /post -->
					</div>
					<!-- /single-post -->
					<!-- 댓글의 댓글을 다는 박스모델 -->
		        	<div id="reviewToReview" style="display:none;
		        						border: 1px solid lightgray;
 										padding: 10px;
 										margin: 20px auto;
 										border-radius: 5px;">
		        		<div style="margin-bottom: 10px;">
		        			<textarea class="form-control" rows="" cols="" id="reviewToReviewContent"placeholder="댓글을 입력해주세요."></textarea>
		        		</div>
		        		<div>
		        			<button class="btn_1 rounded add_bottom_30" type="button" style="margin: 0;">입력</button>
		        		</div>
		        	</div>
					<div id="comments">
						<h5 id="review">리플</h5>
						<ul>
							<li v-for="(commentReview, i) in commentReviewList">
								<div v-if="commentReview.review.reviewState==0">
								<div class="comment_right clearfix" v-if="commentReview.review.reviewNo == commentReview.review.reviewRef" style="display: flow-root; padding-top:25px; padding-bottom:20px;">
									<div class="comment_info">
										관리자에 의해 삭제된 게시물입니다.
									</div>
								</div>
								<div class="comment_right clearfix" v-if="commentReview.review.reviewNo != commentReview.review.reviewRef" style="margin-left: 80px; display: flow-root; padding-top:25px; padding-bottom:20px;">
									<div class="comment_info">
										관리자에 의해 삭제된 게시물입니다.
									</div>
								</div>
								</div>
								
								<div v-if="commentReview.review.reviewState!=0">
								<div v-if="commentReview.review.reviewNo == commentReview.review.reviewRef" class="avatar">
						            <a href="#" v-if="commentReview.memberImage == null">
						            	<img src="${pageContext.request.contextPath }/img/member/admin-no-profile.png" alt="">
						            </a>
						            <a href="#" v-if="commentReview.memberImage != null">
						            	<img v-bind:src="commentReview.memberImage | pathImgMember" alt="">
						            </a>
						        </div>
						        <div v-if="commentReview.review.reviewNo != commentReview.review.reviewRef" class="avatar" style="margin-left: 80px;">
						            <a href="#" v-if="commentReview.memberImage == null">
						            	<img src="${pageContext.request.contextPath }/img/member/admin-no-profile.png" alt="">
						            </a>
						            <a href="#" v-if="commentReview.memberImage != null">
						            	<img v-bind:src="commentReview.memberImage | pathImgMember" alt="">
						            </a>
						        </div>
						        <div class="comment_right clearfix" style="display: flow-root;">
						            <div class="comment_info">
						                By 
						                <a href="#">{{commentReview.memberName}}</a>
						                <span>|</span>
						                {{commentReview.review.reviewDate}}
						                <span v-if="commentReview.review.reviewNo == commentReview.review.reviewRef">
							                <span>|</span>
							                <a href="#" onclick="showReviewToReview(event)">답글</a>
						                </span>
						                <span>|</span>
						                <div style="display:none;">{{commentReview.review.reviewNo}}</div>
						                <div style="display:none;">{{commentReview.review.reviewWriterNo}}</div>
						                <a href="#" onclick="addClaimComment(event)">신고하기</a>
						            </div>
						            <p>
						                {{commentReview.review.reviewContent}}
						            </p>
					        	</div>
					        	<div style="display:none;">{{commentReview.review.reviewNo}}</div>
					        	<!-- 댓글의 댓글을 다는 박스모델이 들어가는 자리 -->
					        	</div>
						    </li>
						</ul>
					</div>

					<hr>

					<h5>리플 남기기</h5>
					<div class="form-group">
						<textarea class="form-control"id="commentReviewContent" rows="6" placeholder="리뷰를 입력하세요."></textarea>
					</div>
					<div class="form-group">
						<button type="button" class="btn_1 rounded add_bottom_30" onclick="addCommentReview();"> 저장</button>
					</div>
				</div>
				<!-- /col -->

				<aside class="col-lg-3">
					<div class="widget">
						<form name="searchCommentForm" action="${pageContext.request.contextPath }/blog?keyword=${map.keyword }&category=${map.category }" method="">
							<div class="form-group">
								<input type="text" name="keyword" id="search" class="form-control" value="${map.keyword }" placeholder="검색어를 입력해주세요.">
							</div>
							<button type="submit" id="submit" class="btn_1 rounded"> 검색</button>
						</form>
					</div>
					<!-- /widget -->
					<div class="widget">
						<div class="widget-title">
							<h4>최근 게시물</h4>
						</div>
						<ul class="comments-list">
							<c:forEach items="${cookieBoardList }" var="cookieBoard">
								<c:if test="${not empty cookieBoard.boardNo}">
								<li>
									<div class="alignleft">
										<c:if test="${empty cookieBoard.boardImage }">
											<a href="${pageContext.request.contextPath }/blog/detail?boardNo=${cookieBoard.boardNo }&keyword=${map.keyword }&category=${map.category }"><img src="${pageContext.request.contextPath }/img/board/admin-no-board.png" alt=""></a>
										</c:if>
										<c:if test="${not empty cookieBoard.boardImage }">
											<a href="${pageContext.request.contextPath }/blog/detail?boardNo=${cookieBoard.boardNo }&keyword=${map.keyword }&category=${map.category }"><img src="${pageContext.request.contextPath }/img/board/${cookieBoard.boardImage }" alt=""></a>
										</c:if>
									</div>
									<small>${fn:substring(cookieBoard.boardDate,0,10) }</small>
									<h3><a href="${pageContext.request.contextPath }/blog/detail?boardNo=${cookieBoard.boardNo }&keyword=${map.keyword }&category=${map.category }" title="">${cookieBoard.boardTitle }</a></h3>
								</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					<!-- /widget -->
					<div class="widget">
						<div class="widget-title">
							<h4>게시판 종류</h4>
						</div>
						<ul class="cats">
							<c:if test="${map.category eq 0}">
								<li><a href="${pageContext.request.contextPath }/blog?keyword=${map.keyword }" style="color:#fc5b62;">전체 <span style="color:#fc5b62;">(${categoryCount.count1 + categoryCount.count2 + categoryCount.count3})</span></a></li>
							</c:if>
							<c:if test="${map.category ne 0}">
								<li><a href="${pageContext.request.contextPath }/blog?keyword=${map.keyword }">전체 <span>(${categoryCount.count1 + categoryCount.count2 + categoryCount.count3})</span></a></li>
							</c:if>
							<c:if test="${map.category eq 1 }">
								<li><a href="${pageContext.request.contextPath }/blog?keyword=${map.keyword }&category=1" style="color:#fc5b62;">뉴스 <span style="color:#fc5b62;">(${categoryCount.count1 })</span></a></li>
							</c:if>
							<c:if test="${map.category ne 1 }">
								<li><a href="${pageContext.request.contextPath }/blog?keyword=${map.keyword }&category=1">뉴스 <span>(${categoryCount.count1 })</span></a></li>
							</c:if>
							<c:if test="${map.category eq 2 }">
								<li><a href="${pageContext.request.contextPath }/blog?keyword=${map.keyword }&category=2" style="color:#fc5b62;">이벤트 <span style="color:#fc5b62;">(${categoryCount.count2 })</span></a></li>
							</c:if>
							<c:if test="${map.category ne 2 }">
								<li><a href="${pageContext.request.contextPath }/blog?keyword=${map.keyword }&category=2">이벤트 <span>(${categoryCount.count2 })</span></a></li>
							</c:if>
							<c:if test="${map.category eq 3 }">
								<li><a href="${pageContext.request.contextPath }/blog?keyword=${map.keyword }&category=3" style="color:#fc5b62;">칼럼 <span style="color:#fc5b62;">(${categoryCount.count3 })</span></a></li>
							</c:if>
							<c:if test="${map.category ne 3 }">
								<li><a href="${pageContext.request.contextPath }/blog?keyword=${map.keyword }&category=3">칼럼 <span>(${categoryCount.count3 })</span></a></li>
							</c:if>
						</ul>
					</div>
					<!-- /widget -->
				</aside>
				<!-- /aside -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
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
	

<script>
	var CommentViewApp = new Vue({
		el: '#comments',
		data: {
			commentReviewList: {}
		},
		filters: {
			pathImgMember: function(value){
				return '/yolowa/img/member/'+ value;
			}
		}
	})
	var addReview = function(ref){
		var content = typeof ref == "undefined"?$('#commentReviewContent').val():$($($('#reviewToReview').children()[0]).children()[0]).val();
		$.ajax({
			url: '/yolowa/rest/comment/review',
			headers: {"content-type":"application/json","X-HTTP-Method-override":"POST"},
			dataType:'text',
			type:'post',
			data: JSON.stringify({
				reviewBoardNo: $('#boardNoDiv').text(),
				reviewRef: ref,
				reviewContent: content
			}),
			success:function(result){
				//rendering
				RenderingCommentReview();
				showAlert('알림 메시지', '댓글 입력 완료되었습니다.');
			},
			error: function(err){
				res = JSON.parse(err.responseText);
				showAlert('오류 메시지', res.message, function(){
					$('#sign-in').click();
				});
			}
		})
	}
	
	
	var addCommentReview = function(ref){
		showConfirm('확인 메시지', '메시지를 저장하시겠습니까?', ()=>{
			if($('#commentReviewContent').val()==''){
				showAlert('오류 메시지', '댓글을 입력해주세요.');
			}else{
				addReview();
			}
		})
	};
	
	
	
	var RenderingCommentReview = function(){
		$.ajax({
			url: '/yolowa/rest/comment/review/'+$('#boardNoDiv').text(),
			type:'get',
			success:function(result){
				CommentViewApp.commentReviewList = result;
				$('#reviewCount').text(CommentViewApp.commentReviewList.length);
				$('#commentReviewContent').val('');
				$($($('#reviewToReview').children()[0]).children()[0]).val('');
				$('#reviewToReview').hide(300);
			}
		})
	}
	
	RenderingCommentReview();
	
	var selectedReviewNo = 0;
	// 댓글의 댓글을 다는것에 관련된 이벤트 함수들
	var showReviewToReview = function(e){
		e.preventDefault();
		var check = $('#reviewToReview').css('display')=='block' && selectedReviewNo != $($(e.target).parent().parent().parent().parent().children()[2]).text()
		if(check || $('#reviewToReview').css('display')=='none'){
			$('#reviewToReview').hide();
			var $reviewToReview = $('#reviewToReview').show(300);
			$(e.target).parent().parent().parent().parent().append($reviewToReview);
			$($reviewToReview.children()[1]).children()[0].onclick = addReviewToReview
			selectedReviewNo =  $($(e.target).parent().parent().parent().parent().children()[2]).text();
			if(check){
				$($($('#reviewToReview').children()[0]).children()[0]).val('');
			}
		}else if($('#reviewToReview').css('display')=='block'){
			$('#reviewToReview').hide(300);
			selectedReviewNo = 0;
		}
	}
	
	var addReviewToReview = function(){
		showConfirm('확인 메시지', '답글을 저장하시겠습니까?', ()=>{
			if($('#reviewToReviewContent').val()==''){
				showAlert('오류 메시지', '댓글을 입력해주세요.');
			}else{
				addReview($('#reviewToReview').prev().text());
			}
			
		})
	};
	
	var addClaimComment = function(e){
		e.preventDefault();
		showConfirm('확인 메시지', '리뷰를 삭제 요청하시겠습니까?', ()=>{
			$.ajax({
				url: '/yolowa/rest/comment/claim',
				headers: {"content-type":"application/json","X-HTTP-Method-override":"POST"},
				dataType:'text',
				type:'post',
				data: JSON.stringify({
					claimSuspectNo: $(e.target).prev().text(),
					claimSuspectReviewNo: $(e.target).prev().prev().text(),
					claimReason: '댓글 신고'
				}),
				success:function(result){
					if(result==1){
						showAlert('알림 메시지', '신고에 성공하였습니다.');
					}else if(result==0){
						showAlert('알림 메시지', '이미 신고 접수된 리뷰입니다.');
					}
				},
				error: function(err){
					res = JSON.parse(err.responseText);
					showAlert('오류 메시지', res.message, function(){
						$('#sign-in').click();
					});
				}
			})
		});
	}
	//
	
</script>