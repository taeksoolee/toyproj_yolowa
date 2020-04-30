<%@page import="com.lyncode.jtwig.content.model.compilable.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark bg-default fixed-top" id="mainNav">
	<a class="navbar-brand" href="${pageContext.request.contextPath }/admin/home/dashboard">
		<img src="${pageContext.request.contextPath}/img/logo/logo-white.png" data-retina="true" alt="" width="150" height="37">
	</a>
	
	<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
   	</button>
   	
	<div class="collapse navbar-collapse" id="navbarResponsive">
		<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
			<%-- 관리자 홈 --%>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="관리자 홈">
				<a class="nav-link" href="${pageContext.request.contextPath }/admin/home/dashboard" onclick="hideMenu()">
					<i class="fa fa-fw fa-dashboard"></i>
					<span class="nav-link-text">관리자 홈</span>
         		</a>
			</li>
       		
			<%-- 예약 관리--%>	
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="예약 관리">
				<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#reservationSection" onclick="hideMenu()">
					<i class="fa fa-fw fa-list"></i>
					<span class="nav-link-text">예약 관리</span>
				</a>
				<ul class="sidenav-second-level collapse" id="reservationSection">
					<li>
						<a href="${pageContext.request.contextPath }/admin/reservation/reservation">예약 정보 <span class="badge badge-pill badge-danger"></span></a>
					</li>
	        	</ul>
			</li>
       
			<%-- 회원 관리--%>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="회원 관리">
				<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#memberSection" onclick="hideMenu()">
					<i class="fa fa-fw fa-user"></i>
					<span class="nav-link-text">회원 관리</span>
				</a>
				<ul class="sidenav-second-level collapse" id="memberSection">
					<li>
						<a href="${pageContext.request.contextPath }/admin/member/member">회원 정보 <span class="badge badge-pill badge-primary"></span></a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/admin/member/hosting">호스팅 정보 <span class="badge badge-pill badge-success"></span></a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/admin/member/notice">공지 발송 <span class="badge badge-pill badge-danger"></span></a>
					</li>
		         </ul>
			</li>
       
			<%-- 신고 관리--%>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="신고 관리">
				<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#claimSection" data-parent="#mylistings" onclick="hideMenu()">
					<i class="fa fa-fw fa-calendar-check-o"></i>
					<span class="nav-link-text">신고 관리</span>
				</a>
				<ul class="sidenav-second-level collapse" id="claimSection">
					<li>
						<a href="${pageContext.request.contextPath }/admin/claim/member">회원 신고 <span class="badge badge-pill badge-primary"></span></a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/admin/claim/review">댓글 삭제 요청 <span class="badge badge-pill badge-success"></span></a>
					</li>
				</ul>
			</li>
        
			<%-- 기타 관리--%>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="기타 관리">
				<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#etcSection" data-parent="#mylistings" onclick="hideMenu()">
					<i class="fa fa-fw fa-gear"></i>
					<span class="nav-link-text">기타 관리</span>
				</a>
				<ul class="sidenav-second-level collapse" id="etcSection">
					<li>
						<a href="${pageContext.request.contextPath }/admin/etc/terms">약관 관리 <span class="badge badge-pill badge-primary"></span></a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/admin/etc/help">도움말 관리 <span class="badge badge-pill badge-success"></span></a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/admin/etc/board">게시판 관리 <span class="badge badge-pill badge-success"></span></a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/admin/etc/advertise">광고메일발송 <span class="badge badge-pill badge-success"></span></a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/admin/etc/sns">SNS 관리 <span class="badge badge-pill badge-success"></span></a>
					</li>
				</ul>
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
			<%-- 홈페이지 이동 / 관리자 페이지(로그아웃) 나가기--%>
			<li class="nav-item">
				<a class="nav-link" data-toggle="modal" data-target="#exitModal">
					<i class="fa fa-fw fa-sign-out"></i>Exit&nbsp;&nbsp;
				</a>
			</li>
		</ul>
   </div>
 </nav>
 
 <div id="toTop" onclick="moveToTop();">
    <div>
    	∧
    </div>
</div>

<style>
#toTop{
	position: fixed;
    z-index: 9999;
    top: 90%;
    left: 95%;
    border-radius: 30px;
    width: 45px;
    background-color: #525252;
    display:none;
}

#toTop:hover{
	cursor: pointer;
	background-color: #fc5b62;
}

#toTop div{
	text-align: center;
    height: 45px;
    font-size: 35px;
    line-height: 39px;
    color: white;
}
</style>

<script>
	window.addEventListener('scroll', function(e) {
		$('#toTop').fadeIn();	  
		if(window.scrollY == 0){
			$('#toTop').fadeOut();
		}
	});
	
	var moveToTop = function(){
		$('html, body').animate({
            scrollTop : 0
        }, 400);
	}
	
</script>
