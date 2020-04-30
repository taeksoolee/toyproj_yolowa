<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
    <meta name="author" content="Ansonika">
    <title>Panagea | Premium site template for travel agencies, hotels and restaurant listing.</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="${pageContext.request.contextPath }/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="${pageContext.request.contextPath }/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="${pageContext.request.contextPath }/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="${pageContext.request.contextPath }/img/apple-touch-icon-144x144-precomposed.png">

    <!-- GOOGLE WEB FONT -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="${pageContext.request.contextPath }/css/custom.css" rel="stylesheet">
    
	<style>
    .invoice-title h2, .invoice-title h3 {
        display: inline-block;
    }
    
    .table > tbody > tr > .no-line {
        border-top: none;
    }
    
    .table > thead > tr > .no-line {
        border-bottom: none;
    }
    
    .table > tbody > tr > .thick-line {
        border-top: 2px solid;
    }
    </style>
        
    
        
</head>
<body>
  <div class="container">
    <div class="row">
        <div class="col-12">
    		<div class="invoice-title add_top_30">
    			<h2>청구서</h2><h3 class="float-right">청구서 번호 # ${invoice.reservation.reservationNo }</h3>
    		</div>
    		<hr>
    		<div class="row">
    			<div class="col-6">
    				<address>
    				<strong>청구인:</strong><br>
    					${invoice.hosting.hostingName }<br>
    					${invoice.hosting.hostingAddress }<br>
    					<br>
    					
    				</address>
    			</div>
    			<div class="col-6 text-right">
    				<address>
        			<strong>결제인:</strong><br>
    					${invoice.reservation.reservationName }<br>
    					<fmt:parseDate value="${invoice.reservation.reservationCheckIn}" var="postDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						체크인: <fmt:formatDate value="${postDate}" pattern="yyyy.MM.dd"/><br>
    					<fmt:parseDate value="${invoice.reservation.reservationCheckOut}" var="postDate2" pattern="yyyy-MM-dd HH:mm:ss"/>
						체크아웃: <fmt:formatDate value="${postDate2}" pattern="yyyy.MM.dd"/><br>
    					
    				</address>
    			</div>
    		</div>
    		<div class="row">
    			<div class="col-6">
    				<address>
    					<c:set var="array" value="${fn:split(invoice.reservation.reservationCardNum, '_')}"/>
    					<strong>결제 방법:</strong><br>
    					${array[0] } ${array[1] }<br>
    					${invoice.reservation.reservationEmail }
    				</address>
    			</div>
    			<div class="col-6 text-right">
    				<address>
    					<strong>결제 일자:</strong><br>
    					<fmt:parseDate value="${invoice.reservation.reservationDate}" var="postDate3" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${postDate3}" pattern="yyyy.MM.dd"/><br><br><br>
    				</address>
    			</div>
    		</div>
    	</div>
    </div>
    
    <div class="row">
    	<div class="col-lg-12">
    		<div class="add_top_15">
    			<h3><strong>결제 합계</strong></h3>
    				<div class="table-responsive">
    					<table class="table table-condensed">
    						<thead>
                                <tr>
        							<td><strong>항목</strong></td>
        							<td class="text-center"><strong>가격</strong></td>
        							<td class="text-center"><strong>사용인원</strong></td>
        							<td class="text-right"><strong>합계</strong></td>
                                </tr>
    						</thead>
    						<tbody>
    							<tr>
    								<td>숙소이용료</td>
    								<td class="text-center">￦<fmt:formatNumber value="${invoice.hosting.hostingPrice }" type="number"/></td>
    								<td class="text-center">${invoice.reservation.reservationGuestNum}</td>
    								<td class="text-right">￦<fmt:formatNumber value="${invoice.reservation.reservationTotalPrice - invoice.reservation.reservationCommission }" type="number"/></td>
    							</tr>
    							<tr>
    								<td class="no-line"></td>
    								<td class="no-line"></td>
    								<td class="no-line text-center"><strong>수수료</strong></td>
    								<td class="no-line text-right">￦<fmt:formatNumber value="${invoice.reservation.reservationCommission }" type="number"/></td>
    							</tr>
    							<tr>
    								<td class="no-line"></td>
    								<td class="no-line"></td>
    								<td class="no-line text-center"><strong>합계</strong></td>
    								<td class="no-line text-right">￦<fmt:formatNumber value="${invoice.reservation.reservationTotalPrice}" type="number"/></td>
    							</tr>
    						</tbody>
    					</table>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>


  </body>
</html>