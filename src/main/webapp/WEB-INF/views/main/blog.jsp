<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<div id="page">
			
	<main>
		<section class="hero_in general">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>게시판</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->

		<div class="container margin_60_35">
			<div class="row">
				<c:if test="${commentList.size() ne 0}">
				<div class="col-lg-9">
					<c:forEach items="${commentList }" var="boardComment">
					<article class="blog wow fadeIn">
						<div class="row no-gutters">
							<div class="col-lg-7">	
								<figure>
									<c:choose>
									<%-- 이미지 없을때 --%>
									<c:when test="${not empty boardComment.board.boardImage }">
										<a href="${pageContext.request.contextPath }/blog/detail?boardNo=${boardComment.board.boardNo }"><img src="${pageContext.request.contextPath }/img/board/${boardComment.board.boardImage }" alt="">
											<div class="preview"><span>자세히</span></div>
										</a>
									</c:when>
									<%-- 이미지 있을때--%>
									<c:when test="${empty boardComment.board.boardImage }">
										<a href="${pageContext.request.contextPath }/blog/detail?boardNo=${boardComment.board.boardNo }&keyword=${map.keyword }&category=${map.category }"><img src="${pageContext.request.contextPath }/img/board/admin-no-board.png" alt="">
											<div class="preview"><span>자세히</span></div>
										</a>
									</c:when>
									</c:choose>
								</figure>
							</div>
							<div class="col-lg-5">
								<div class="post_info">
									<small>
										<fmt:parseDate value="${boardComment.board.boardDate}" var="boardDate" pattern="yyyy-MM-dd HH:mm:ss"/>
										<fmt:formatDate value="${boardDate }" pattern="yyyy년 MM월 dd일"/>
									</small>
									<h3><a href="${pageContext.request.contextPath }/blog/detail?boardNo=${boardComment.board.boardNo }&keyword=${map.keyword }&category=${map.category }">${boardComment.board.boardTitle }</a></h3>
									<%-- 주석처리 --%>
									<!-- <p>(게시물 내용)${boardComment.board.boardContent }</p> -->
									<ul>
										<li>
											<c:choose>
												<%-- 회원 이미지 있을때 --%>
												<c:when test="${not empty boardComment.memberImage }">
													<div class="thumb"><img src="${pageContext.request.contextPath }/img/member/${boardComment.memberImage }" alt=""></div> ${boardComment.memberName }
												</c:when>
												<%-- 회원 이미지 없을때 --%>
												<c:when test="${empty boardComment.memberImage }">
													<div class="thumb"><img src="${pageContext.request.contextPath }/img/member/admin-no-profile.png" alt=""></div> ${boardComment.memberName }
												</c:when>
											</c:choose>
										</li>
										<li><i class="icon_comment_alt"></i> ${boardComment.cnt }</li>
									</ul>
								</div>
							</div>
						</div>
					</article>
					</c:forEach>

					<nav aria-label="...">
						<ul class="pagination pagination-sm">
							<c:if test="${pager.prevPage lt 1 }">
							<li class="page-item disabled">
								<a class="page-link" href="#">이전</a>
							</li>
							</c:if>
							<c:if test="${pager.prevPage ge 1 }">
							<li class="page-item">
								<a class="page-link" href="${pageContext.request.contextPath }/blog?pageNum=${pager.prevPage }&keyword=${map.keyword }&category=${map.category }">이전</a>
							</li>
							</c:if>
							<c:forEach begin="${pager.startPage  }" end="${pager.endPage }" var="index">
								<li class="page-item ${index }"><a class="page-link" href="${pageContext.request.contextPath }/blog?pageNum=${index }&keyword=${map.keyword }&category=${map.category }">${index }</a></li>
							</c:forEach>
							<c:if test="${pager.nextPage le pager.totalPage}">
							<li class="page-item">
								<a class="page-link" href="${pageContext.request.contextPath }/blog?pageNum=${pager.nextPage }&keyword=${map.keyword }&category=${map.category }">다음</a>
							</li>
							</c:if>
							<c:if test="${pager.nextPage gt pager.totalPage}">
							<li class="page-item disabled">
								<a class="page-link" href="#">다음</a>
							</li>
							</c:if>
						</ul>
					</nav>
					<!-- /pagination -->
				</div>
				</c:if>
				<c:if test="${commentList.size() eq 0}">
				<div class="col-lg-9">
				<article class="blog wow fadeIn">
					<div class="row no-gutters">
						<div style="    text-align: center;
	    font-size: 30px;
	    line-height: 500px;
	    border: 1px solid lightgray;
	    border-radius: 5px;
	    width: 100%;">
	    					게시물이 존재하지 않습니다.
	    				</div>
					</div>
				</article>
				</div>
				</c:if>
				<!-- /col -->

				<aside class="col-lg-3">
					<div class="widget">
						<form name="searchCommentForm" method="">
							<div class="form-group">
								<input type="text" name="keyword" id="search" class="form-control" value="${map.keyword }" placeholder="검색어를 입력해주세요.">
								<input type="hidden" name="category" value="${map.category }"/>
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
							<c:if test="${empty map.category}">
								<li><a href="${pageContext.request.contextPath }/blog?keyword=${map.keyword }" style="color:#fc5b62;">전체 <span style="color:#fc5b62;">(${categoryCount.count1 + categoryCount.count2 + categoryCount.count3})</span></a></li>
							</c:if>
							<c:if test="${not empty map.category}">
								<li><a href="${pageContext.request.contextPath }/blog?keyword=${map.keyword }">전체 <span>(${categoryCount.count1 + categoryCount.count2 + categoryCount.count3})</span></a></li>
							</c:if>
							<c:if test="${map.category eq 1 }">
								<li><a href="${pageContext.request.contextPath }/blog?keyword=${map.keyword }&category=1" style="color:#fc5b62;">공지 <span style="color:#fc5b62;">(${categoryCount.count1 })</span></a></li>
							</c:if>
							<c:if test="${map.category ne 1 }">
								<li><a href="${pageContext.request.contextPath }/blog?keyword=${map.keyword }&category=1">공지 <span>(${categoryCount.count1 })</span></a></li>
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
	
<c:if test="${not empty map.pageNum}">
	<script>
		var pageNum = ${map.pageNum};
		$('.'+pageNum).addClass('active');
	</script>
</c:if>
<c:if test="${empty map.pageNum}">
	<script>
		var pageNum = 1;
		$('.'+pageNum).addClass('active');
	</script>
</c:if>

