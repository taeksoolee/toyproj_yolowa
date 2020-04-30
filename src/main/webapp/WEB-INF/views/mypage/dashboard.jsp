<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="#">호스팅</a>
        </li>
        <li class="breadcrumb-item active">호스트 상황판</li>
      </ol>
	  <!-- Icon Cards-->
      <div class="row">
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card dashboard text-white bg-primary o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-envelope-open"></i>
              </div>
              <div class="mr-5"><h5>${dashboardCount.messageCount } 새로운 메세지!</h5></div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="messages.jsp">
              <span class="float-left">상세보기</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card dashboard text-white bg-warning o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-star"></i>
              </div>
				<div class="mr-5"><h5>${dashboardCount.reviewCount } 등록된 리뷰!</h5></div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="reviews.jsp">
              <span class="float-left">상세보기</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card dashboard text-white bg-success o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-calendar-check-o"></i>
              </div>
              <div class="mr-5"><h5>${dashboardCount.reservationCount } 예약 요청!</h5></div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="bookings.jsp">
              <span class="float-left">상세보기</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card dashboard text-white bg-danger o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-eye"></i>
              </div>
              <div class="mr-5"><h5>${dashboardCount.wishlistCount } 등록된 위시리스트!</h5></div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="bookmarks.jsp">
              <span class="float-left">상세보기</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
		</div>
		<!-- /cards -->
		<h2></h2>
		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-bar-chart"></i>Statistic</h2>
			</div>
		 <canvas id="myAreaChart" width="100%" height="30" style="margin:45px 0 15px 0;"></canvas>
		</div>
	  </div>
	  <!-- /.container-fluid-->
   	</div>
    <!-- /.container-wrapper-->

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/vendor/jquery-easing/jquery.easing.min.js"></script>
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
	
	