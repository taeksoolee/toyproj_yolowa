<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

  <!-- Navigation-->
 <nav class="navbar navbar-expand-lg navbar-dark bg-default fixed-top" id="mainNav">
    <a class="navbar-brand" href="/yolowa"><img src="${pageContext.request.contextPath }/img/logo_white(2).png" data-retina="true" alt="" width="150" height="36"></a>
    
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
       	<c:if test="${loginMember.memberHostState == 1 || loginMember.memberHostState == 9 }">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="${pageContext.request.contextPath }/mypage/dashboard">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">대시보드</span>
          </a>
        </li>
		</c:if>
		
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Messages">
          <a class="nav-link" href="${pageContext.request.contextPath }/mypage/messages">
            <i class="fa fa-fw fa-envelope-open"></i>
            <span class="nav-link-text">메시지 
            <c:if test="${newMessage.messageCount != 0 }">
            	<span class="badge badge-pill badge-primary">${newMessage.messageCount }&nbsp; New</span>
            </c:if>
            </span>
          </a>
        </li>
		
        <c:if test="${loginMember.memberHostState == 1 || loginMember.memberHostState == 9 }">
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="" data-original-title="Bookings">
          <a class="nav-link" href="${pageContext.request.contextPath }/mypage/bookings">
            <i class="fa fa-fw fa-calendar-check-o"></i>
            <span class="nav-link-text">예약 현황 
            <c:if test="${newMessage.reservationCount != 0 }">
            	<span class="badge badge-pill badge-primary">${newMessage.reservationCount }&nbsp; New</span>
            </c:if>
            </span>
          </a>
        </li>
        </c:if>
        
        <c:if test="${loginMember.memberHostState == 1 || loginMember.memberHostState == 9 }">
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="My listings">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMylistings" data-parent="#mylistings">
            <i class="fa fa-fw fa-list"></i>
            <span class="nav-link-text">숙소 관리</span>
          </a>
          
          <ul class="sidenav-second-level collapse" id="collapseMylistings">
			<li>
              <a href="${pageContext.request.contextPath }/mypage/listings?hostingState=1">활성화 <span class="badge badge-pill badge-success"></span></a>
            </li>
			<li>
              <a href="${pageContext.request.contextPath }/mypage/listings?hostingState=2">비활성화 <span class="badge badge-pill badge-danger"></span></a>
            </li>
          </ul>
        </li>
        </c:if>
        
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Reviews">
          <a class="nav-link" href="${pageContext.request.contextPath }/mypage/reviews?memberNo=${loginMember.memberNo}">
            <i class="fa fa-fw fa-star"></i>
            <span class="nav-link-text">마이페이지</span>
          </a>
        </li>
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Bookmarks">
          <a class="nav-link" href="${pageContext.request.contextPath }/mypage/bookmarks">
            <i class="fa fa-fw fa-heart"></i>
            <span class="nav-link-text">이용 내역</span>
          </a>
        </li>
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Add listing">
          <a class="nav-link" href="${pageContext.request.contextPath }/mypage/addlisting">
            <i class="fa fa-fw fa-plus-circle"></i>
            <span class="nav-link-text">숙소 추가</span>
          </a>
        </li>
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="My profile">
          <a class="nav-link" href="${pageContext.request.contextPath }/mypage/user-profile">
            <i class="fa fa-fw fa-user"></i>
            <span class="nav-link-text">프로필 수정</span>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-fw fa-sign-out"></i>로그아웃</a>
        </li>
      </ul>
    </div>
  </nav>
  <!-- /Navigation-->