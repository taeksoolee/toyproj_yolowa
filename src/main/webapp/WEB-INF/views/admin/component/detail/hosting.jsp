<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
  #hostingDetailComponent .listbox {
    width: 95%;
    height: 205px;
    overflow: auto;
    margin: 5px 25px;
    border-radius: 5px;
    border: 1px solid lightgray;
  }
  #hostingDetailComponent .listbox::-webkit-scrollbar {
    width: 10px;
  }
  #hostingDetailComponent .listbox::-webkit-scrollbar-thumb {
    background-color: gray;
    border-radius: 5px;
  }
  #hostingDetailComponent .listbox::-webkit-scrollbar-track {
    background-color: lightgray;
    border-radius: 5px;
  }
  #hostingDetailComponent .listbox option{
    margin: 10px;
    border-bottom: 1px solid lightgray;
   }
</style>    
    

<%-- hosting detail component--%>
<div id="hostingDetailComponent" class="fullcomponent" style="display:none;">
	<div>
		<div class="exitBtnBox" style="margin: 30px; height: 10px;">
			<button type="button" onclick="closeHostingDetailComponent()" style=""><p style="font-size: 30px">x</p></button>
		</div>
		<div class="title">
			<h3>호스팅 상세보기</h3>
			<h5>
				<span style="margin:10px">회원번호&nbsp;&nbsp;:&nbsp;&nbsp;{{hostingMemberDetail.member.memberNo | memberNoFilter}}</span>
				&nbsp;/&nbsp;<span>총 매출액&nbsp;&nbsp;:&nbsp;&nbsp;￦ {{setTotalResrvationPriceSum()  | currency}}</span>
				&nbsp;/&nbsp;<span>별점 평균&nbsp;&nbsp;:&nbsp;&nbsp;{{setTotalReviewStarAvg() }} 점</span>
			</h5>
		</div>
		<div class="content">
		<%-- 호스팅 선택영역 --%>
			<div class="row">
				<div class="col" style="margin:15px;">
					<select id="selectHostingOfMember" class="custom-select mr-sm-2" style="width: 100%;" v-model="selected" @change="changeHostingDetail">
						<%-- DHTML --%>
						<option v-for="hostingDetail in hostingMemberDetail.hostingDetailList">
							{{hostingDetail.hosting.hostingName }}
							&nbsp;({{hostingDetail.hosting.hostingNo | hostingNoFilter}})
							&nbsp;/&nbsp;
							&nbsp;{{hostingDetail.hosting.hostingDate }}
							&nbsp;/&nbsp;
							{{setHostingState(hostingDetail.hosting.hostingState) }}
							&nbsp;/&nbsp;
							{{hostingDetail.hosting.hostingPrice | currency}} 원
							&nbsp;/&nbsp;
							별점 : {{hostingDetail.reviewStarAvg }}
						</option>
					</select>
				</div>
			</div>
		<%-- 호스팅 정보영역 --%>
			<div class="row">
			<%-- 다녀간 게스트의 리스트 출력 --%>
				<div class="col" style="margin:20px auto;">
					<div class="title">
						<h6><span>다녀간 게스트</span>&nbsp;<span>({{setUsedList().length }} 명)</span></h6>
					</div>
					<select class="selectArea listbox" size="10">
						<%-- 게스트 리스트 작성 --%>
						<option v-for="used in setUsedList()">
							예약자 : {{used.reservationMemberNo | memberNoFilter}} /
							예약일 : {{used.reservationDate }} /
							숙박기간 : {{used.reservationCheckIn.substr(0, 10) }} ~ {{used.reservationCheckOut.substr(0, 10) }} / 
							숙박인원 : {{used.reservationGuestNum }}명 /
							숙박금액 : ￦ {{used.reservationTotalPrice | currency}}
						</option>
					</select>
					
					<div class="title">
						<h6><span>예약중 게스트</span>&nbsp;<span>({{setReservationList().length }} 명)</span></h6>
					</div>
					<select id="hostingReservation" class="selectArea listbox" size="10">
						<%-- 게스트 리스트 작성 --%>
						<option v-for="reservation in setReservationList()">
							예약자 : {{reservation.reservationMemberNo | memberNoFilter}} /
							예약일 : {{reservation.reservationDate }} /
							숙박기간 : {{reservation.reservationCheckIn.substr(0, 10)  }} ~ {{reservation.reservationCheckOut.substr(0, 10) }} / 
							숙박인원 : {{reservation.reservationGuestNum }}명 /
							숙박금액 : ￦ {{reservation.reservationTotalPrice | currency  }}
						</option>
					</select>
				</div>
			</div>
		<%--  --%>
			<div class="row">
			<%-- 호스팅 당 매출--%>
				<div class="col-12">
					<div style="margin:15px;">
						<span>{{hostingDetail.hostingNo | hostingNoFilter}}</span>
						<span>번 호스팅 매출 : </span>
						<span>￦ {{setHostingReservationTotalprice()  | currency }}</span>
						<!-- 
						<span style="float:right;"><a href="#" onclick="openDetailPage();">호스팅 상세페이지(새창)</a></span>
						 -->
					</div> 
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	var templateHostingMemberDetail = {
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
		  hostingDetailList: [
			  {
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
				  },
				  reservationPriceSum: "",
				  reviewStarAvg: ""
			  }
		  ]
	  }
	
	var templateHostingDetail = {
			hostingNo: "",
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
			},
			reservationList:[
				{
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
				}
			]
	}
	
	
	

	var hostingDetailComponent = new Vue({
	  el: '#hostingDetailComponent',
	  data: {
		  hostingMemberDetail: templateHostingMemberDetail,
		  hostingDetail: templateHostingDetail,
		  selected: 0
	  },
	  methods: {
		 setTotalResrvationPriceSum: function(){
			 var sum = 0;
			 for(hostingDetail of this.hostingMemberDetail.hostingDetailList){
				 sum += hostingDetail.reservationPriceSum;
			 }
			 return sum;
		 },
	  	//전체 평균을 구하는 필터 함수
	  	setTotalReviewStarAvg: function(){
	  		var count = 0;
	  		var avg = 0;
	  		 for(hostingDetail of this.hostingMemberDetail.hostingDetailList){
	  			 if(hostingDetail.reviewStarAvg != null && hostingDetail.reviewStarAvg != ''){
	  			 	avg += parseInt(hostingDetail.reviewStarAvg);
				 	count++;
	  			 }
			 }
	  		 if(avg == 0){
	  			 return 0;
	  		 }else if(count!=0){
	  		 	return avg / count;
	  		 }else{
	  			 return 0;
	  		 }
	  	},
	  	
	  	setHostingState: function(state){
	  		
	  		switch (state) {
			case 0:
				return '삭제';
			case 1:
				return '게시';
			case 2:
				return '중지';
			}
	  		return '';	  		
	  	},
	  	
	  	setHostingReservationTotalprice: function(){
	  		let totalPrice = 0;
	  		for(reservation of this.hostingDetail.reservationList){
				totalPrice += reservation.reservationTotalPrice;	  			
	  		}
	  		return totalPrice;
	  	},
	  	
	  	// 이용완료 리스트를 반환하는 함수
	  	setUsedList: function(){
	  		let usedList = [];
	  		let nowDate = new Date();
	  		// yyyy-MM-dd형식으로 반환
	  		let now = nowDate.getFullYear() + '-' + ((nowDate.getMonth()+1)>10?(nowDate.getMonth()+1):'0'+(nowDate.getMonth()+1)) + '-' + nowDate.getDate();
	  		
	  		for(reservation of this.hostingDetail.reservationList){
				// 이용완료면 true
				if(reservation.reservationState != 0 && reservation.reservationCheckOut < now){
					usedList.push(reservation);
				}
	  		}
	  		return usedList;
	  		
	  	},
	  	
	 	// 이용전 리스트를 반환하는 함수
	  	setReservationList: function(){
	  		let reservationList = [];
	  		let nowDate = new Date();
	  		// yyyy-MM-dd형식으로 반환
	  		let now = nowDate.getFullYear() + '-' + ((nowDate.getMonth()+1)>10?(nowDate.getMonth()+1):'0'+(nowDate.getMonth()+1)) + '-' + nowDate.getDate();
	  		
	  		for(reservation of this.hostingDetail.reservationList){
				// 이용완료면 true
				if(reservation.reservationState != 0 && reservation.reservationCheckOut > now){
					reservationList.push(reservation);
				}
	  		}
	  		return reservationList;
	  	},
	  	
	  	changeHostingDetail: function(){
	  		// selected : 제목(번호) ... 형식이므로 '('와 ')'로 스플릿하여 호스팅 번호를 얻어옴
	  		setHostingDetailComponent(parseInt(this.selected.split('(')[1].split(')')[0]));
	  	}
	  },
	  filters : {
		  memberNoFilter: function(value){
			  var result = '';
			  var valueArr = (''+value).split('');
			  var cnt = 5-(valueArr.length);
			  for(let i=0; i<cnt; i++){
				  result = result+'0';
			  }
			  for(let value of valueArr){
				  result = result+value;
			  }
			  return result;
		  },
		  hostingNoFilter: function(value){
			  var result = '';
			  var valueArr = (''+value).split('');
			  var cnt = 6-(valueArr.length);
			  for(let i=0; i<cnt; i++){
				  result = result+'0';
			  }
			  for(let value of valueArr){
				  result = result+value;
			  }
			  return result;
		  },
		  currency: function(value){
			  if (!value) return 0;
			  return parseInt(value).toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,");
		  }
	  }
	})
	
	var openDetailPage = function(){
		
		window.open('/yolowa/detail?hostingNo='+hostingDetailComponent.hostingDetail.hostingNo);
	}
</script>