<%@page import="site.yolowa.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
     
   
    
	<header class="header menu_fixed">
		<div id="preloader"><div data-loader="circle-side"></div></div><!-- /Page Preload -->
		<div id="logo">
			<a href="/yolowa">
				<img src="${pageContext.request.contextPath }/img/logo_white(2).png" width="150" height="36" alt="" class="logo_normal">
				<img src="${pageContext.request.contextPath }/img/logo_black.png" width="150" height="36" alt="" class="logo_sticky">
			</a>
		</div>
		<ul id="top_menu">
		<c:if test="${loginMember.memberState == 1 }">
			<li><a href="#" class="cart-menu-btn" title="Messages" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><strong>${headerMessageCount.newMessageCount }</strong></a>
			<!-- 드랍다운 메세지 시작 -->
			<div class="dropdown-menu" aria-labelledby="messagesDropdown">
            <h6 class="dropdown-header" style="color: #444;">새로운 메세지:</h6>
            <c:if test="${empty(headerMessage) }">
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#" style="color: #444;">
              <strong>새로 도착한 메세지가 없습니다.</strong>
            </a>
            </c:if>
            <c:forEach var="newMessage" items="${headerMessage}">
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#" style="color: #444;">
              <strong>${newMessage.senderName }</strong>
              <span class="small float-right text-muted" style="color: #444;">${fn:substring(newMessage.message.messageDate, 0, 10)}</span>
              <div class="dropdown-message small">${fn:substring(newMessage.message.messageContent, 0, 50)}...</div>
            </a>
            </c:forEach>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item small" href="mypage/messages" style="color: #444;">모든 메세지 보기</a>
            </div>
			<!-- 드랍다운 메세지 종료 -->
			</li>
			<li><a href="#" class="cart-menu-btn cart-menu-btn2" title="Alert" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><strong>${headerMessageCount.newNoticeCount }</strong></a>
			<!-- 드랍다운 공지 시작 -->
			<div class="dropdown-menu" aria-labelledby="messagesDropdown">
            <h6 class="dropdown-header" style="color: #444;">새로운 알림:</h6>
            <c:if test="${empty(headerNotice) }">
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#" style="color: #444;">
              <strong>새로 도착한 메세지가 없습니다.</strong>
            </a>
            </c:if>
            <c:forEach var="notice" items="${headerNotice}">
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#" style="color: #444;">
              <strong>${notice.senderName }</strong>
              <span class="small float-right text-muted" style="color: #444;">${fn:substring(notice.message.messageDate, 0, 10)}</span>
              <div class="dropdown-message small">${fn:substring(notice.message.messageContent, 0, 50)}...</div>
            </a>
            </c:forEach>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item small" href="mypage/messages" style="color: #444;">모든 알림 보기</a>
            </div>
			<!-- 드랍다운 공지 종료 -->
			</li>
		</c:if>
		<c:if test="${loginMember.memberState == 1 || loginMember.memberState == 9 }">
			<li><a href="#" id="sign-in" class="login logout" title="logout" data-toggle="modal" data-target="#exampleModal">로그아웃</a></li>
		</c:if>
		<c:if test="${loginMember.memberState == null}">
			<li><a href="#sign-in-dialog" id="sign-in" class="login" title="login" id="signInBtn">로그인</a></li>
		</c:if>
			<li><a href="${pageContext.request.contextPath}/wishlist" class="wishlist_bt_top" title="wishlist">저장목록</a></li>
		</ul>
		
		<!-- /top_menu -->
		<a href="#menu" class="btn_mobile">
			<div class="hamburger hamburger--spin" id="hamburger">
				<div class="hamburger-box">
					<div class="hamburger-inner"></div>
				</div>
			</div>
		</a>
		
		<nav id="menu" class="main-menu">
			<ul>
			<c:if test="${loginMember.memberState == 9}">
				<li><span><a href="${pageContext.request.contextPath }/admin">관리자</a></span></li>
			</c:if>
				<li><span><a href="${pageContext.request.contextPath }/blog">게시판</a></span></li>
			<c:choose>
			<c:when test="${loginMember.memberHostState == 1 || loginMember.memberHostState == 2}">
				<li><span><a href="${pageContext.request.contextPath }/mypage/dashboard">호스팅</a></span>
					<ul>
						<li><a href="${pageContext.request.contextPath }/mypage/dashboard">호스트 대쉬보드</a></li>
						<li><a href="${pageContext.request.contextPath }/mypage/bookings">예약신청 보기</a></li>
						<li><a href="${pageContext.request.contextPath }/mypage/listings">숙소 관리</a></li>
						<li><a href="${pageContext.request.contextPath }/mypage/addlisting">새로운 숙소 추가하기</a></li>
					</ul>
				</li>
			</c:when>
			<c:when test="${loginMember.memberHostState == 0}">
				<li><span><a href="${pageContext.request.contextPath }/mypage/addlisting">호스팅을 시작해보세요!</a></span></li>
			</c:when>
			</c:choose>
				<li><span><a href="${pageContext.request.contextPath }/help">도움말</a></span></li>
			<c:if test="${loginMember.memberState == null}">
				<li><span><a href="${pageContext.request.contextPath }/register">회원가입</a></span></li>
			</c:if>
			<c:if test="${loginMember.memberState == 1}">
				<li><span><a href="${pageContext.request.contextPath }/mypage/reviews?memberNo=${loginMember.memberNo }">마이페이지</a></span>
					<ul>
						<li><a href="${pageContext.request.contextPath }/mypage/reviews?memberNo=${loginMember.memberNo }">받은 후기</a></li>
						<li><a href="${pageContext.request.contextPath }/mypage/messages">메세지</a></li>
						<li><a href="${pageContext.request.contextPath }/mypage/bookmarks">이용 내역</a></li>
						<li><a href="${pageContext.request.contextPath }/mypage/user-profile">프로필 수정</a></li>
					</ul>
				</li>
			</c:if>
			</ul>
		</nav>
	</header>
	<!-- /header -->	