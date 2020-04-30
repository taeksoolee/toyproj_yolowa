<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="#">마이페이지</a>
        </li>
        <li class="breadcrumb-item active">메세지</li>
      </ol>
		<div class="box_general">
			<div class="header_box">
				<h2 class="d-inline-block">${loginMember.memberName }님의 메세지함</h2>
				<div class="filter">
					<select id="orderby" name="orderby" class="selectbox">
						<option value="all">전체</option>
						<option value="message">메세지</option>
						<option value="notice">알림</option>
					</select>
				</div>
			</div>
			<div id="listGeneral" class="list_general">
				<ul>
					<li v-for="messages in messageLists">
						<span>{{messages.message.messageDate | date}}</span>
						<figure><img v-if="messages.senderImage == null" src="${pageContext.request.contextPath }/img/avatar.jpg" alt="">
							<img v-else-if="messages.senderImage != null" v-bind:src="messages.senderImage | image" alt="">
						</figure>
						<h4>{{messages.senderName}} 
						<i class="unread" v-if="messages.message.messageState == 3 || messages.message.messageState == 5">알림</i>
						<a href="" v-bind:onclick="messages.message.messageSenderNo | messageSendBtn" data-toggle="modal" data-target="#sendHostMessage" v-if="messages.message.messageState == 1 || messages.message.messageState == 2"><i class="sendMessageBt">답신</i></a>
						<i class="read" v-if="messages.message.messageState == 1 || (messages.message.messageState == 3 && messages.message.messageReceiverNo != 0)">새로온 메세지</i>
						</h4>
						<p>{{messages.message.messageContent}}</p>
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
	var message = new Vue({
		  el: '#listGeneral',
		  data: {
			 messageLists: {}
		  },
		  filters: {
			    image: function(value) {
			      if (!value) return "";
			      value = value.toString();
			      return `${pageContext.request.contextPath }/img/member/` + value;
			    	},
			    date: function(value) {
				      if (!value) return "";
				      value = value.toString();
				      return moment(value).format("YYYY년 MM월 DD일");
				    },
			    messageSendBtn: function(value) {
				      if (!value) return "";
				      value = value.toString();
				      return `messageSend(` + value + `)`
				    }
			  }
	});
	
	$("#orderby").change(function() {

		order = $(".sbFocus").attr("rel");
		messageDisplay(page);
	});
	
	var page = 1;
	var order = $(".sbFocus").attr("rel");
	messageDisplay(page);
	
	//게시글 목록을 요청하여 출력하는 함수
	function messageDisplay(pageNum) {
		page = pageNum;
		//console.log(pageNum);
		
		if (order == "all") {
			messageState = 9;
		} else if (order == "message") {
			messageState = 1;
		} else if (order == "notice") {
			messageState = 3;
		} 
		
		//console.log(order);
		
		$.ajax({
			type: "GET",
			url: "messageList?pageNum=" + pageNum + "&orderby=" + messageState,
			dataType: "json",
			success: function(json) {
				if (json.messageList.length == 0) {
					alert("검색된 게시글이 존재하지 않습니다.");
					return;
				}
				
				message.messageLists = json.messageList;
				console.log(json.messageList);
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
			html += "<li class='page-item'><a class='page-link' href='javascript:messageDisplay("+ pager.prevPage +");' tabindex='-1'>이전</a></li>";
		} else {
			html += "<li class='page-item disabled'><a class='page-link' tabindex='-1'>이전</a></li>";
		}
		
		for(var i = pager.startPage; i <= pager.endPage; i++) {
			if(pager.pageNum != i) {
				html += "<li class='page-item'><a class='page-link' href='javascript:messageDisplay("+ i +");'>"+ i +"</a></li>";
			} else {
				html += "<li class='page-item disabled'><a class='page-link'>"+ i +"</a></li>";
			}
		}
		
		if(pager.endPage != pager.totalPage) {
			html += "<li class='page-item'><a class='page-link' href='javascript:messageDisplay("+ pager.nextPage +");'>다음</a></li>"
		} else {
			html += "<li class='page-item disabled'><a class='page-link'>다음</a></li>";
		}
		
		$("#pageNumUl").html(html);
	}
	</script>