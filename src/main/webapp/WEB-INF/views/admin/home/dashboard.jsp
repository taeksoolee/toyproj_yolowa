<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><h4><a href="${pageContext.request.contextPath}/admin/home/dashboard">관리자 홈</a></h4></li>
		</ol>
     
		<!-- /cards -->
		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-bar-chart"></i>Yolowa 통계&nbsp;</h2>
				<span style="float:right;">
					&nbsp;|&nbsp;
					<a href="#" onclick="setChart('visit')">사이트 방문</a>&nbsp;|&nbsp;
					<a href="#" onclick="setChart('reservation')">거래내역</a>&nbsp;|&nbsp;
					<a href="#" onclick="setChart('hosting')">호스팅</a>&nbsp;|&nbsp;
					<a href="#" onclick="setChart('memberjoin')">회원가입</a>&nbsp;|&nbsp;
					<a href="#" onclick="setChart('claim')">신고내역</a>&nbsp;|&nbsp;
				</span>
			</div>
			<%-- 컨텐츠 --%>
		 	<canvas id="dashboardChart" width="100%" height="30" style="margin:45px 0 15px 0;"></canvas>
		</div>
		
		<%-- 회원관리 --%>
		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-bar-chart"></i>회원&nbsp; & &nbsp;호스팅 관리</h2>
			</div>
		
			<!-- Icon Cards-->
			<div class="row admin-cards">
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card dashboard text-white bg-admin o-hidden h-100 admin-card">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fa fa-fw fa-user"></i>
							</div>
							<div class="mr-5">오늘 가입한 회원</div>
						</div>
						<div class="content">
             				<span class="main"><a href="#" onclick="goTodayMember(event);">${joinMemberCard.now }명&nbsp;&nbsp;</a></span>
             				<c:choose>
             				<c:when test="${joinMemberCard.now lt joinMemberCard.previous}">
             					<span class="down">↓${joinMemberCard.previous - joinMemberCard.now }</span>
             				</c:when>
             				<c:when test="${joinMemberCard.now eq joinMemberCard.previous}">
             					<span>=</span>
             				</c:when>
             				<c:when test="${joinMemberCard.now gt joinMemberCard.previous}">
             					<span class="up">↑${joinMemberCard.now - joinMemberCard.previous }</span>
             				</c:when>
             				</c:choose>
             			</div>
	          		</div>
	        	</div>
	        	<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card dashboard text-white bg-admin o-hidden h-100 admin-card">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fa fa-fw fa-user"></i>
							</div>
							<div class="mr-5">호스트 / 모든회원</div>
						</div>
						<div class="content">
             				<span class="main"><a href="/yolowa/admin/member/member?rangeCount=2&keywordCount=5&rangeFormat1=joinDate&rangeStartYear1=&rangeStartMonth1=&rangeStartDay1=&rangeEndYear1=&rangeEndMonth1=&rangeEndDay1=&keywordFormat1=no&keywordValue1=&host=1&allStatus=on&active=1&inactive=3&pause=2&totalPriceStart=0&totalPriceEnd=999999999&searchRow=300">${stateMemberCard.host }명&nbsp;&nbsp;</a></span>
             				<span>/ </span>
             				<span>${stateMemberCard.host + stateMemberCard.guest }명</span>
             			</div>
	          		</div>
	        	</div>
	        	<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card dashboard text-white bg-admin o-hidden h-100 admin-card">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fa fa-fw fa-home"></i>
							</div>
							<div class="mr-5">오늘 등록된 호스팅</div>
						</div>
						<div class="content">
             				<span class="main"><a href="#" onclick="goTodayHosting(event);">${applyHostingCard.now }건&nbsp;&nbsp;</a></span>
             					<c:choose>
             				<c:when test="${applyHostingCard.now lt applyHostingCard.previous}">
             					<span class="down">↓${applyHostingCard.previous - applyHostingCard.now }</span>
             				</c:when>
             				<c:when test="${applyHostingCard.now eq applyHostingCard.previous}">
             					<span>=</span>
             				</c:when>
             				<c:when test="${applyHostingCard.now gt applyHostingCard.previous}">
             					<span class="up">↑${applyHostingCard.now - applyHostingCard.previous }</span>
             				</c:when>
             				</c:choose>
             			</div>
	          		</div>
	        	</div>
	        	<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card dashboard text-white bg-admin o-hidden h-100 admin-card">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fa fa-fw fa-home"></i>
							</div>
							<div class="mr-5">활성 / 총 호스팅</div>
						</div>
						<div class="content">
             				<span class="main"><a href="/yolowa/admin/member/hosting?rangeCount=1&keywordCount=3&rangeFormat1=resiteredDate&rangeStartYear1=&rangeStartMonth1=&rangeStartDay1=&rangeEndYear1=&rangeEndMonth1=&rangeEndDay1=&keywordFormat1=hostingNo&keywordValue1=&active=1&reservationCountStart=0&reservationCountEnd=9999&usedCountStart=0&usedCountEnd=9999&searchRow=300">${stateHostingCard.active }건&nbsp;&nbsp;</a></span>
             				<span>/ </span>
             				<span>${stateHostingCard.active + stateHostingCard.pause }건</span>
             			</div>
	          		</div>
	        	</div>
			</div>
		</div>
		
		
		<!-- 테이블 영역 -->
		<div id="dashboardTable" class="container-fluid" style="padding: 0px;">		
			<!-- DataTables Card-->
			<div class="card mb-3">
				<%-- 회원관리 --%>
				<div class="box_general padding_bottom">
					<div class="header_box version_2">
						<h2><i class="fa fa-bar-chart"></i>회원&nbsp; & &nbsp;호스팅 관리</h2>
					</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<%-- 칼럼 --%>
							<thead class="center-head" style="background: #cce3f7;">
								<tr>
									<th></th>
									<th colspan="3">매출 정보</th>
									<th colspan="3">회원 정보</th>
								</tr>
								<tr>
									<th>일자</th>
									<%-- 수수료 --%>
									<th>순이익</th>
									<%-- reservation state : 2~4 --%>
									<th>총예약 금액</th>
									<th>총예약 건수</th>
									<th>등록 호스팅</th>
									<th>가입 회원</th>
									<th>클레임 건수</th>
								</tr>
							</thead>
							<!-- rows : 6 -->
							<tbody class="center-body">
								<tr v-for="dashboardTable in dashboardTableList">
									<th>{{dashboardTable.dateMonth}}</th>
									<th>￦ {{dashboardTable.reservationCommissionSum | currency}}</th>
									<th>￦ {{dashboardTable.reservationTotalPriceSum | currency}}</th>
									<th>{{dashboardTable.reservationCount}}건</th>
									<th>{{dashboardTable.hostingCount}}건</th>
									<th>{{dashboardTable.memberCount}}명</th>
									<th>{{dashboardTable.claimCount}}건</th>
								</tr>
							</tbody>
						</table>
						<div style="float:right;">
							<button type="button" id="prev" class="btn-dark" onclick="tableUp()" style="width: 50px;">&nbsp;∧&nbsp;</button>
							<button type="button" id="" class="btn-dark" onclick="tableDown()" style="width: 50px;">&nbsp;∨&nbsp;</button>
						</div>
					</div>
				</div>
			</div>
			<!-- /tables-->
		</div>
		</div>
		<%-- 신고관리 --%>
		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-bar-chart"></i>신고관리</h2>
			</div>
		
			<!-- Icon Cards-->
			<div class="row admin-cards">
				<div class="col-xl-4 col-sm-6 mb-3">
					<div class="card dashboard text-white bg-admin o-hidden h-100 admin-card">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fa fa-fw fa-ban"></i>
							</div>
							<div class="mr-5">호스트 → 게스트</div>
						</div>
						<div class="content">
             				<span class="main"><a href="/yolowa/admin/claim/member?rangeCount=1&keywordCount=4&rangeFormat1=claimDate&rangeStartYear1=&rangeStartMonth1=&rangeStartDay1=&rangeEndYear1=&rangeEndMonth1=&rangeEndDay1=&keywordFormat1=content&keywordValue1=&toGuest=1&watingState=1&searchRow=300">${guestClaimCard.waiting }건&nbsp;&nbsp;</a></span>
             				<span>/</span>
             				<span>${guestClaimCard.waiting + guestClaimCard.complete + guestClaimCard.cancel }건</span>
             			</div>
	          		</div>
	        	</div>
				<div class="col-xl-4 col-sm-6 mb-3">
					<div class="card dashboard text-white bg-admin o-hidden h-100 admin-card">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fa fa-fw fa-ban"></i>
							</div>
							<div class="mr-5">게스트 → 호스트</div>
						</div>
						<div class="content">
							<span class="main"><a href="/yolowa/admin/claim/member?rangeCount=1&keywordCount=4&rangeFormat1=claimDate&rangeStartYear1=&rangeStartMonth1=&rangeStartDay1=&rangeEndYear1=&rangeEndMonth1=&rangeEndDay1=&keywordFormat1=content&keywordValue1=&toHost=2&watingState=1&searchRow=300">${hostClaimCard.waiting }건&nbsp;&nbsp;</a></span>
             				<span>/</span>
             				<span>${hostClaimCard.waiting + hostClaimCard.complete + hostClaimCard.cancel }건</span>
             			</div>
	          		</div>
	        	</div>
				<div class="col-xl-4 col-sm-6 mb-3">
					<div class="card dashboard text-white bg-admin o-hidden h-100 admin-card">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fa fa-fw fa-ban"></i>
							</div>
							<div class="mr-5">댓글삭제요청</div>
						</div>
						<div class="content">
							<span class="main"><a href="/yolowa/admin/claim/review?rangeCount=1&keywordCount=3&rangeFormat1=claimDate&rangeStartYear1=&rangeStartMonth1=&rangeStartDay1=&rangeEndYear1=&rangeEndMonth1=&rangeEndDay1=&keywordFormat1=content&keywordValue1=&watingState=1&searchRow=300">${reviewClaimCard.waiting }건&nbsp;&nbsp;</a></span>
             				<span>/</span>
             				<span>${reviewClaimCard.waiting + reviewClaimCard.complete + reviewClaimCard.cancel }건</span>
             			</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container-fluid-->
</div>
<!-- /.container-wrapper-->
<!-- Page level plugin JavaScript-->
<script src="${pageContext.request.contextPath }/vendor/chart.js/Chart.js"></script>
<script src="${pageContext.request.contextPath }/vendor/datatables/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath }/vendor/datatables/dataTables.bootstrap4.js"></script>
<script src="${pageContext.request.contextPath }/vendor/jquery.selectbox-0.2.js"></script>
<script src="${pageContext.request.contextPath }/vendor/retina-replace.min.js"></script>
<script src="${pageContext.request.contextPath }/vendor/jquery.magnific-popup.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath }/js/admin.js"></script>
<!-- Custom scripts for this page-->
<script src="${pageContext.request.contextPath }/js/admin-charts.js"></script>
<!-- custom -->
<script src="${pageContext.request.contextPath}/js/admin/custom.js"></script>

<!-- 테이블 관련 메소드 정의 -->
<script>
	var dashboardTable = new Vue({
	  el: '#dashboardTable',
	  data: {
		  test: "test",
		  dashboardTableList: {}
	  },
	  filters: {
		 currency: value => {
			 if (!value) return 0
			 return value.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
		 }
	  }
	})
	
	var end = new Date(); // "2020/03"
	var count = 7;
	// end : 마지막날짜(yy/MM) 형식으로 받아야함. count : end 월부터 몇개월 전까지 데이터를 가져올지
	var setDashboardTableList = function(end, count){
		$.ajax({
			  url: "dashboard/table",
			  type: "post",
			  dataType: "json",
			  data: {end: (end.getYear()+1900) + "/" + (end.getMonth()+1), count: count},
			  success: function(data){
				  dashboardTable.dashboardTableList = data;
			  },
			   error: function (request, status, error){
					// promt 모달로 변경 예정
			  }
		});
	}
	
	setDashboardTableList(end, count);
	
	var tableDown = function(){
		end.setMonth(end.getMonth()-1);
		setDashboardTableList(end, count);
	}
	
	var tableUp = function(){
		// 설정된 end 변수와 현재 년월이 같은지 비교
		if(end.getYear() == new Date().getYear() && end.getMonth() == new Date().getMonth()){
			// 같다면
		}else{
			// 같지 않다면
			end.setMonth(end.getMonth()+1);
			setDashboardTableList(end, count);
		}	
	}
</script>
<script>
	var proxyChart;
	var setChart = function(type){
		if(proxyChart != undefined){
			proxyChart.destroy();
		}
		$.ajax({
			url: "dashboard/chart/"+type,
			type: "post",
			dataType: "json",
			//end : 오늘자
			data: {end: (new Date().getYear()-100) + '/' + (new Date().getMonth()+1) + '/' + new Date().getDate(), count: 12	},
			success: function(data){
				// 라벨 이름 세팅
				var labels = [];
				switch (data.type) {
				case "visit":
					labels.push("회원 방문 횟수")
					break;
				case "memberjoin":
					labels.push("회원 가입 횟수")
					break;
				case "hosting":
					labels.push("호스팅 등록 횟수")
					break;
				case "reservation":
					labels.push("거래횟수")
					labels.push("거래총금액")
					break;
				case "claim":
					labels.push("전체 신고 횟수")
					break;
				}
				
				// chart 객체 생성
				if(data.type=="reservation"){
					myChart = new Chart(document.getElementById('dashboardChart').getContext('2d'), {
					    type: 'line',
					    data: {
					        labels: data.monthList,
					        datasets: [{
					        	label: labels[0],
					            data: data.countList,
					            yAxisID: 'B',
					            backgroundColor: 'rgb(204, 227, 247)',
					            borderColor: 'rgb(204, 227, 247)',
					            fill: false,
					            borderWidth: 2
					        },
					        {
								label: labels[1],
				        		data: data.sumList,
				        		yAxisID: 'A',
				        		backgroundColor: 'rgb(245, 238, 149)',
				        		borderColor: 'rgb(245, 238, 149)',
				        		fill: false,
				        		borderWidth: 2
				    		}]
					    },
					    options: {
					        scales: {
					            yAxes: [{
					                id: 'A',
					                position: 'left',
					              }, {
					                id: 'B',
					                position: 'right',
					                ticks: {
					                    beginAtZero: true
					                }
					              }]
					    /*
					    		[{
					                
					            }]
					    */
					        }
					    }
					});
				}else{
					myChart = new Chart(document.getElementById('dashboardChart').getContext('2d'), {
					    type: 'line',
					    data: {
					        labels: data.monthList,
					        datasets: [{
					        	label: labels[0],
					            data: data.countList,
					            backgroundColor: 'rgb(204, 227, 247)',
					            borderColor: 'rgb(204, 227, 247)',
					            fill: false,
					            borderWidth: 2
					        }]
					    },
					    options: {
					        scales: {
					            yAxes: [{
					                ticks: {
					                    beginAtZero: true
					                }
					            }]
					        }
					    }
					});
				}
				proxyChart = myChart;
			},
			  error: function (request, status, error){
				console.log(error);
				console.log(request);
			// promt 모달로 변경 예정
			  console.log("ajax 실패");
			}
		});
	}
	
	// 방문시 사이트 차트를 보여줌
	setChart('visit');
</script>

<script>
	var goTodayMember = function(event){
		var now = new Date();
		var year = now.getYear()+1900;
		var month = (now.getMonth()+1)<10?'0'+(now.getMonth()+1):now.getMonth()+1;
		var day = (now.getDate())<10?'0'+now.getDate():now.getDate();
		event.target.href = '/yolowa/admin/member/member?rangeCount=2&keywordCount=5&rangeFormat1=joinDate&rangeStartYear1='+year+'&rangeStartMonth1='+month+'&rangeStartDay1='+day+'&rangeEndYear1='+year+'&rangeEndMonth1='+month+'&rangeEndDay1='+day+'&keywordFormat1=no&keywordValue1=&allhost=on&host=1&superHost=2&guest=0&allStatus=on&active=1&inactive=3&pause=2&totalPriceStart=0&totalPriceEnd=999999999&searchRow=300';
	}
	
	var goTodayHosting = function(event){
		var now = new Date();
		var year = now.getYear()+1900;
		var month = (now.getMonth()+1)<10?'0'+(now.getMonth()+1):now.getMonth()+1;
		var day = (now.getDate())<10?'0'+now.getDate():now.getDate();
		event.target.href = '/yolowa/admin/member/hosting?rangeCount=1&keywordCount=3&rangeFormat1=resiteredDate&rangeStartYear1='+year+'&rangeStartMonth1='+month+'&rangeStartDay1='+day+'&rangeEndYear1='+year+'&rangeEndMonth1='+month+'&rangeEndDay1='+day+'&keywordFormat1=hostingNo&keywordValue1=&allStatus=on&active=1&pause=2&reservationCountStart=0&reservationCountEnd=9999&usedCountStart=0&usedCountEnd=9999&searchRow=300';
		
	}
	
	//현재 섹션 선택하는 함수
	selectSection(0);
</script>  