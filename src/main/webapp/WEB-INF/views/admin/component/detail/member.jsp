<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
#admin-component-modal{
	position: fixed;
    margin: 0 auto;
    left: 0;
    top: 0;
    height: 100%;
    width: 100%;
    z-index:1;
    display: none;
}

#admin-component-modal .modal-div{
	width: 300px;
    height: 150px;
    margin: 20% auto;
    background-color: white;
    border-radius: 20px;
    border: 1px solid lightgray;
}

#admin-component-modal .modal-message-div{
	height: 50%;
    margin: 10px auto;
    padding: 12px;
    line-height: 60px;
}
#admin-component-modal .modal-message{
	border-top: 1px solid lightgray;
    border-bottom: 1px solid lightgray;
    text-align: center;
}

#admin-component-modal .modal-btn-div{
	text-align:center;
}
#admin-component-modal .modal-btn{
	width: 100px;
    height: 40px;
    border: none;
    border-radius: 5px;
}

.modal-background{
	background-color: black;
	opacity: 25%;
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	display: none;
}


 #memberDetailComponent .listbox::-webkit-scrollbar {
   width: 10px;
 }
 #memberDetailComponent .listbox::-webkit-scrollbar-thumb {
   background-color: gray;
   border-radius: 5px;
 }
 #memberDetailComponent .listbox::-webkit-scrollbar-track {
   background-color: lightgray;
   border-radius: 5px;
 }
 #memberDetailComponent .listbox option{
   margin: 10px;
   border-bottom: 1px solid lightgray;
  }
   #memberDetailComponent .listbox {
    width: 100%;
    height: 100px;
    overflow: auto;
    border-radius: 5px;
    border: 1px solid lightgray;
 }
 
 .summary p{
 	margin: 10px;
 }
</style>    

<%-- member detail component--%>
<div id="memberDetailComponent" class="fullcomponent" style="display:none;">
	<div>
		<div class="exitBtnBox" style="margin: 30px; height: 10px;">
			<button type="button" onclick="closeMemberDetailComponent()" style=""><p style="font-size: 30px">x</p></button>
		</div>
		<div class="title">
			<h3>회원 상세보기</h3>
			<h5>
				<span>회원번호 :&nbsp;&nbsp;&nbsp;</span>
				<span>{{memberDetail.member.memberNo | number5}}</span>
			</h5>
		</div>
		<div class="content">
			<div class="row">
				<%-- 회원프로필에 관련된 부분 --%>
				<div class="col">
					<div class="title">
						<h4>프로필</h4>
					</div>
					<%-- 프로필 이미지 --%>
					<div class="borderBox">
						<div style="height: 515px;">
							<div style="border:5px solid lightblue; margin-bottom:30px; padding: 10px 50px;">
							<div v-if="memberDetail.member.memberImage === null">
								<img src="${pageContext.request.contextPath }/img/member/admin-no-profile.png" width="100%" height="350px">
							</div>
							<div v-if="memberDetail.member.memberImage !== null">
								<img v-bind:src="memberDetail.member.memberImage | memberImagePath" width="100%" height="350px">
							</div>
							<!-- 
							<div v-if="memberDetail.member.memberImage != null">
								<img src="/yolowa/img{{memberDetail.member.memberImage}}" width="100%" height="350px">
							</div>
							 -->
							</div>
							<%-- 프로필 소개 --%>
							<p>
								<span>소개 : </span>
								<span v-if="memberDetail.member.memberProfile == null || memberDetail.member.memberProfile == ''">
									등록된 소개글이 없습니다.
								</span>
								<span v-if="memberDetail.member.memberProfile != null && memberDetail.member.memberProfile != ''">
									{{memberDetail.member.memberProfile}}
								</span>
							</p>
						</div>
					</div>
				</div>
				<%-- 회원 상세정보에 관한 부분 --%>
				<div class="col">
					<div class="title">
						<h4>요약</h4>
					</div>
					<div class="borderBox" style="height: 435px;">
						<div class="summary">
							<p class="email" v-if="memberDetail.member.memberEmail != null && memberDetail.member.memberEmail != ''">이메일 : {{memberDetail.member.memberEmail}}</p>
							<p class="name" v-if="memberDetail.member.memberName != null && memberDetail.member.memberName != ''">
								<span>이름 : </span>
								<span>{{memberDetail.member.memberName}}</span>
							</p>
							<p class="sex" v-if="memberDetail.member.memberSex != null && memberDetail.member.memberSex != ''">
								<span>성별 : </span>
								<span v-if="memberDetail.member.memberSex===0">
								</span>
								<span v-if="memberDetail.member.memberSex===1">
									남자
								</span>
								<span v-if="memberDetail.member.memberSex===2">
									여자
								</span>
							</p>
							</p>
							<p class="birthday" v-if="memberDetail.member.memberBirthday != null && memberDetail.member.memberBirthday != ''">
								<span>생년월일 : </span>
								<span>{{memberDetail.member.memberBirthday.substr(0,10)}}</span>
							</p>
							<p class="phone" v-if="memberDetail.member.memberPhone != null && memberDetail.member.memberPhone != ''">
								<span>전화번호 : </span> 
								<span>{{memberDetail.member.memberPhone}}</span>
							</p>
							<p class="address" v-if="memberDetail.member.memberAddress != null && memberDetail.member.memberAddress != ''">
								<span>주소 : </span>
								<span>{{memberDetail.member.memberAddress}}</span>
							</p>
							<p class="joinDate" v-if="memberDetail.member.memberJoinDate != null && memberDetail.member.memberJoinDate != ''">
								<span>회원가입일 : </span>
								<span>{{memberDetail.member.memberJoinDate.substr(0,10)}}</span>
							</p>
							<p class="lastLogin" v-if="memberDetail.member.memberLastLogin != null && memberDetail.member.memberLastLogin != ''">
								<span>마지막로그인 : </span>
								<span>{{memberDetail.member.memberLastLogin}}</span>
							</p>
							<p class="forbidden" id="memberComponentForbiddenDate" v-if="memberDetail.member.memberForbiddenDate != null && memberDetail.member.memberForbiddenDate != ''">
								<span>정지일 : </span>
								<span>{{memberDetail.member.memberForbiddenDate | testEternalForbidden}}</span>
							</p>
							<p class="status" v-if="memberDetail.member.memberState != null && memberDetail.member.memberState != ''">
								<span>회원 상태 : </span> 
								<span v-if="memberDetail.member.memberState===1">
									정상
								</span>
								<span v-if="memberDetail.member.memberState===2">
									정지
								</span>
								<span v-if="memberDetail.member.memberState===3">
									휴면
								</span>
								<span v-if="memberDetail.member.memberState===9">
									관리자
								</span>
							</p>
						</div>
					</div>
					<div class="title">
						<h4>호스팅</h4>
					</div>
					<div class="borderBox">
						<div style="height: 28px;">
							<span>갯수 : {{memberDetail.hostingCount}}개
							<span v-if="memberDetail.hostingCount>0"> 
								<a href="#" onclick="moveHostingDetail(event);">&lt;&lt; 호스팅 바로가기 &gt;&gt;</a></span>
							</span>
						</div>
					</div>
				</div>
				<%-- 회원의 여행에 관한 부분 --%>
				<div class="col">
					<div class="title">
						<h4>여행</h4>
					</div>
					<div class="borderBox">
						<div>
							다녀온 여행지 ({{setReservationCount() }}개)
						</div>
						<div>
							<select class="listbox" size="6" style="width: 100%; height: 100px;">
								<option v-for="reservationHosting in memberDetail.reservationHostingList">
									{{reservationHosting.hosting.hostingName}}
									({{reservationHosting.hosting.hostingNo | number6}}) / 
									{{reservationHosting.reservation.reservationCheckIn.substr(0,10)}} ~ {{reservationHosting.reservation.reservationCheckOut.substr(0,10)}}
								</option>
							</select>
						</div>
						<div>
							<p style="text-align: right;">총여행 경비 : ￦  {{setReservationTotalPrice() | currency}}</p>
						</div>
					</div>
					
					<div class="title">
						<h4>관리자 메모</h4>
					</div>
					<div class="borderBox">
						<div>
							<textarea rows="" cols="" style="resize:none; width: 100%; height: 170px; border: 1px solid lightgray;" v-model="memberDetail.member.memberMemo" @keyup="setMemberMemo"></textarea>
						</div>
						<div>
							<select id="selectPause" class="custom-select mr-sm-2" style="width: 190px;">
								<option value="1">1일 정지</option>
								<option value="7">7일 정지</option>
								<option value="10">10일 정지</option>
								<option value="30">30일 정지</option>
								<option value="999999">영구 정지</option>
							</select>
							<button type="button" class="btn btn-primary" style="width: 100px;" onclick="modifyClaimMemberForbiddenDate()">정지</button>
							<button type="button" class="btn btn-primary" style="float:right;" onclick="modifyClaimMemberForbiddenDateReset()">정지 취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    
	<div id="admin-component-modal" onclick="closeMemberComponentModalBackground(event);">
    	<div class="modal-div">
    		<div class="modal-message-div">
    			<div class="modal-message">
    				{{modal.content}}
    			</div>
    		</div>
    		<%-- 1: alert, 2: confirm--%>
    		<div class="modal-btn-div">
    			<button class="modal-btn btn-primary" v-if="modal.modalType == 2" onclick="closeMemberComponentModal();">취소</button>
	    		<button id="componentModalRunBtn" class="modal-btn btn-primary" onclick="closeMemberComponentModal();">확인</button>
    		</div>
    	</div>
	</div>
	<div class="modal-background"></div>
</div>
<script>
	var templateMemberDetail = {
		  member:{
			  memberNo: "",
			  memberEmail: "",
			  memberPassword: "",
			  memberName: "",
			  memberBirthday: "",
			  memberPhone: "",
			  memberMailing: "",
			  memberLastLogin: "",
			  memberJoinDate: "",
			  memberState: "",
			  memberImage: "",
			  memberProfile: "",
			  memberForbiddenDate: "",
			  memberSex: "",
			  memberAddress: "",
			  memberMemo: "",
			  memberHostState: ""
		  },
		  hostingCount: "",
		  reservationHostingList: [
			  {
				  reservation: {
					  reservationNo: "",
					  reservationHostingNo: "",
					  reservationMemberNo: "",
					  reservationState: "",
					  reservationCanceler: "",
					  reservationCheckIn: "",
					  reservationCheckOut: "",
					  reservationGuestNum: "",
					  reservationCommission: "",
					  reservationTotalPrice: "",
					  reservationDate: "",
					  reservationName: "",
					  reservationEmail: "",
					  reservationPhone: "",
					  reservationCardNum: ""
				  },
				  hosting: {
					  hostingNo: "",
					  hostingMemberNo: "",
					  hostingAddress: "",
					  hostingName: "",
					  hostingDate: "",
					  hostingDesc: "",
					  hostingImage: "",
					  hostingCategory: "",
					  hostingState: "",
					  hostingPrice: "",
					  hostingPrivate: "",
					  hostingRoom: "",
					  hostingPerson: "",
					  hostingBathroom: "",
					  hostingBed: "",
					  hostingAmenities: "",
					  hostingSafety: "",
					  hostingFacilities: "",
					  hostingRule: "",
					  hostingRuleDetail: "",
					  hostingLatitude: "",
					  hostingLongitude: "",
					  hostingViewCount: "",
					  hostingCardNum: ""
				  }
			  }
		  ]
	  }
	var memberDetailComponent = new Vue({
	  el: '#memberDetailComponent',
	  data: {
		  memberDetail: templateMemberDetail,
		  modal: {
			  content: '',
			  // 1: alert, 2: confirm
			  modalType: 0
		  },
	  },
	  methods: {
		  setReservationCount: function(){
			  var count = 0;
			  for(reservationHosting in this.memberDetail.reservationHostingList){
				  count++
			  }
			  return count;
		  },
		  setReservationTotalPrice: function(){
			  var totalPrice = 0;
			  for(reservationHosting of this.memberDetail.reservationHostingList){
				  totalPrice += reservationHosting.reservation.reservationTotalPrice;
			  }
			  return totalPrice;
		  },
		  setMemberMemo: function(){
			  axios.post('/yolowa/rest/admin/component/member/memo/', {"memberNo": this.memberDetail.member.memberNo, "memberMemo": this.memberDetail.member.memberMemo})
			  .then(function (response) {
				  // 메모 저장 후 로직 작성
			  })  
		  }
	  },
	  filters: {
		  testEternalForbidden: function(value){
			  if(value != null){
				  if(parseInt(value.substr(0,4)) >= 2050){
					  return '영구 정지';
				  }
			  }
			  return (value+'').substr(0,10);
		  },
		  memberImagePath: function(value){
		  	return '${pageContext.request.contextPath }/img/member/'+value
		  },
		  number5: function(value){
			  var result = '';
			  for(let i = 0; i<(5-(value+'').length); i++){
				  result = result + '0';
			  }
			  return '' + result + value;
		  },
		  number6: function(value){
			  var result = '';
			  for(let i = 0; i<(6-(value+'').length); i++){
				  result = result + '0';
			  }
			  return '' + result + value;
		  },
		  currency: function(value){
			  if (!value) return '0';
			  return parseInt(value).toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,");
		  }
	  }
	})
	
	
	var moveHostingDetail = function(event){
		event.preventDefault();
		openHostingDetailComponent('m', memberDetailComponent.memberDetail.member.memberNo);
	}
</script>
<%--service --%>
<script>
	var openMemberComponentModal = function(type, message, callback){
		switch (type) {
		case 'a':
			memberDetailComponent.modal.modalType = 1;
			document.getElementById('componentModalRunBtn').onclick = function(){
				closeMemberComponentModal();
			};
			break;
		case 'c':
			memberDetailComponent.modal.modalType = 2;
			document.getElementById('componentModalRunBtn').onclick = callback;
			break;
		}
		
		memberDetailComponent.modal.content=message;
		$('#admin-component-modal').show();
		$('.modal-background').show()
	};
	
	var closeMemberComponentModal = function(event){
		$('#admin-component-modal').hide();
		$('.modal-background').hide()
	}
	
	var closeMemberComponentModalBackground = function(event){
		if(event.target == document.getElementById('admin-component-modal')){
			$('#admin-component-modal').hide();
			$('.modal-background').hide()
		}
	}


	var modifyClaimMemberForbiddenDate = function(){
		openMemberComponentModal('c', '정지일을 수정하시겠습니까?', ()=>{
			$.ajax({
				url: '/yolowa/rest/admin/component/member/forebiddendate/'+selectPause.value,
				headers: {"content-type":"application/json","X-HTTP-Method-override":"POST"},
				dataType:'text',
				type:'post',
				data: JSON.stringify(memberDetailComponent.memberDetail.member),
				success:function(result){
					memberDetailComponent.memberDetail.member.memberForbiddenDate 
						= result.length==8?20+result.substr(0,2)+'-'+result.substr(3,2)+'-'+result.substr(6,2):result;
					memberDetailComponent.memberDetail.member.memberState = 2;
					openMemberComponentModal('a','정지일이 수정되었습니다.')
				}
			});
			
		});
	};
	
	var modifyClaimMemberForbiddenDateReset = function(){
		openMemberComponentModal('c', '정지일을 수정하시겠습니까?', ()=>{
			$.ajax({
				url: '/yolowa/rest/admin/component/member/forebiddendate/reset/'+memberDetailComponent.memberDetail.member.memberNo,
				headers: {"content-type":"application/json","X-HTTP-Method-override":"POST"},
				dataType:'text',
				type:'post',
				success:function(result){
					memberDetailComponent.memberDetail.member.memberForbiddenDate = result;
					memberDetailComponent.memberDetail.member.memberState = 1;
					openMemberComponentModal('a', '회원에 대한 정지일이 수정되었습니다.')
				}
			});
		})
	}
	
	
</script>


