/*----------------------------------------*/
/*필터 및 테이블 관련 기능을 제공하는 자바스크립트*/
 /*---------------------------------------*/
	if(typeof rangeObj != "undefined"){
		searchForm.rangeCount.value = Object.keys(rangeObj).length;
	}
	if(typeof keywordObj != "undefined"){
		searchForm.keywordCount.value = Object.keys(keywordObj).length;
	}
	
	// 범위검색과 키워드 검색 추가를 위해 키값을 저장하는 배열 객체
	var rangekeys = [];
	var keywordkeys = [];
	
	if(typeof rangeObj != "undefined")
		for(let k in rangeObj){
			rangekeys.push(k);
		}
	if(typeof keywordObj != "undefined")
		for(let k in keywordObj){
			keywordkeys.push(k);
		}
	
	var rangeArrNum = rangekeys.length;
	var keywordArrNum = keywordkeys.length;
	

	var rangeCntArr = [];
	for(let i = rangeArrNum; i > 0; i--){
		rangeCntArr.push(i);
	}
	
	var keywordCntArr = [];
	for(let i = keywordArrNum; i > 0; i--){
		keywordCntArr.push(i);
	}
	
	// 선택된 키워드포맷을 임시 저장을위한 배열객체
	var selectedKeywordFormat = [];
	
	
	//
	var plusMinusBtnSetting = function(className, arrs){
		// 현재 button div 갯수
		var rangeBtns = searchForm.getElementsByClassName(className);
		
		for(let btns of rangeBtns){
			$(btns.children[0]).css("display", "inline");
			$(btns.children[1]).css("display", "inline");
		}
		
		//플러스를 지움
		if(rangeBtns.length == arrs){
			for(let btns of rangeBtns){
				$(btns.children[0]).css("display", "none")
			}
		}
		
		//마이너스를 지움
		if(rangeBtns.length == 1){
			for(let btns of rangeBtns){
				$(btns.children[1]).css("display", "none")
			}
		}
	}
	
	
	// 범위검색 상자를 더하는 함수
	var plusRangeDiv = function(){
		var cnt = rangeCntArr.pop();
		
		if(cnt == undefined) return;
		
		var yearOpHtml = "";
		var monthOpHtml = "";
		var dayOpHtml = "";
		
		//년(2020~1940) 월(1~12) 일(1~31) 세팅
		for(let i = 1; i <= 31; i++){
			if(i < 10){
				i = "0"+i;
			}
			dayOpHtml += "<option value='"+i+"'>"+i+"일</option>"
		}
		
		for(let i = 1; i <= 12; i++){
			if(i < 10){
				i = "0"+i;
			}
			monthOpHtml += "<option value='"+i+"'>"+i+"월</option>"
		}
		
		for(let i = 2020; i >= 1940; i--){
			yearOpHtml += "<option value='"+i+"'>"+i+"년</option>"
		}
		
		var div = document.createElement("div");
		div.classList = "row fieldContent";
		div.id = "rangeBox" + cnt;
		
		// contents 주입
		// set name 1 : rangeFormat1 - rangeStartYear1 - rangeStartMonth1 - rangeStartDay1 - rangeEndYear1 - rangeEndMonth1 - rangeEndDay1
		// set name 2 : rangeFormat2 - rangeStartYear2 - rangeStartMonth2 - rangeStartDay2 - rangeEndYear2 - rangeEndMonth2 - rangeEndDay2
		// set name 3 : rangeFormat3 - rangeStartYear3 - rangeStartMonth3 - rangeStartDay3 - rangeEndYear3 - rangeEndMonth3 - rangeEndDay3
		html = "<div class='col-2'><select class='custom-select mr-sm-2 format' name='rangeFormat"+cnt+"'>";
		
		// format option setting
		for(let i = 0; i < rangekeys.length; i++){
			let key = rangekeys[i];
			
			html += "<option value='";
			html += key + "'";
			if(i == 0) html +=" selected";
			html += ">";
			html += rangeObj[key];
			html += "</option>";
		}
		
		html +=	"</select></div><div class='col-5'><select class='custom-select mr-sm-2' name='rangeStartYear"+cnt+"'><option value=''>년</option>"+yearOpHtml+"</select><select class='custom-select mr-sm-2' name='rangeStartMonth"+cnt+"'><option value=''>월</option>"+monthOpHtml+"</select><select class='custom-select mr-sm-2' name='rangeStartDay"+cnt+"'><option value=''>일</option>"+dayOpHtml+"</select><span class='center-span'>~</span><select class='custom-select mr-sm-2' name='rangeEndYear"+cnt+"'><option value=''>년</option>"+yearOpHtml+"</select><select class='custom-select mr-sm-2' name='rangeEndMonth"+cnt+"'><option value=''>월</option>"+monthOpHtml+"</select><select class='custom-select mr-sm-2' name='rangeEndDay"+cnt+"'><option value=''>일</option>"+dayOpHtml+"</select></div><div class='col-3'><button type='button' class='btn' onclick='selectPrevious(\"rangeBox"+cnt+"\", 1);'>1개월전</button><button type='button' class='btn' onclick='selectPrevious(\"rangeBox"+cnt+"\", 3);'>3개월전</button><button type='button' class='btn' onclick='selectPrevious(\"rangeBox"+cnt+"\", 6);'>6개월전</button></div><div class='col-2 rangeBtns'><button type='button' class='btn' onclick='plusRangeDiv();'>+</button><button type='button' class='btn' onclick='minusRangeDiv(this)'>-</button></div>";
		
		div.innerHTML = html;
		
		searchForm.getElementsByClassName("dateField")[0].append(div);
		
		plusMinusBtnSetting("rangeBtns", rangekeys.length);
	}
	
	var minusRangeDiv = function(t){
		if(rangeCntArr.length < rangeArrNum-1){
			var target = $(t).parent().parent();
			var id = target.attr("id");
			target.remove();
			rangeCntArr.push(id.substr(id.length-1));
			
			plusMinusBtnSetting("rangeBtns", rangekeys.length);
		}
	}
	
	// 선택한 데이트 박스의 내용을 "현재월-선택한월 ~ 현재월"로 세팅하는 기능을 제공하는 함수
	var selectPrevious = function(boxId, month){
		// date setting, 현재 기반으로 세팅
		var end = new Date();
		
		var start = new Date();
		start.setMonth(end.getMonth()-month);
		
		var target = [];
		
		target.push(start.getYear()+1900);
		target.push(start.getMonth()+1);
		target.push(start.getDate());
		
		target.push(end.getYear()+1900);
		target.push(end.getMonth()+1);
		target.push(end.getDate());
		
		// DHTML
		var box = document.getElementById(boxId);
		var num = boxId.substr(boxId.length-1);
		
		var selects = box.getElementsByTagName("select");
		
		var options = "";
		
		// select option setting
		for(let i = 0; i<selects.length-1; i++){
			
			var options = selects[i+1].options;
			
			for(let j=0; j<options.length; j++) {
			    if(options[j].selected == true) {
			        options[j].selected == false;
			        break;
			    }
			}
			
			for(let j=0; j<options.length; j++) {
			    if(options[j].value == target[i]) {
			        options[j].selected = "true";
			        break;
			    }
			}
		}
	}
	
	//키워드 div를 생성하는 함수
	var plusKeywordDiv = function(){
		var cnt = keywordCntArr.pop();
		
		if(cnt == undefined) return;
		
		var div = document.createElement("div");
		div.classList = "row fieldContent";
		div.id = "keywordBox" + cnt;
		
		// contents 주입
		// set name 1 : keywordFormat1 - keyword1 
		// set name 2 : keywordFormat2 - keyword2 
		// set name 3 : keywordFormat3 - keyword3 
		html = "<div class='col-2'><select class='custom-select mr-sm-2 format' name='keywordFormat"+cnt+"' >";
		
		// format option setting
		for(let i = 0; i < keywordkeys.length; i++){
			let key = keywordkeys[i];
			
			html += "<option value='";
			html += key + "'";
			if(i == 0) html +=" selected";
			html += ">"
			html += keywordObj[key];
			html += "</option>";
		}
		
		html += "</select></div><div class='col-8'><input type='text' class='form-control' name='keywordValue"+cnt+"' placeholder='검색어를 입력하세요.' /></div><div class='col-2 keywordBtns'><button type='button' class='btn' onclick='plusKeywordDiv();'>+</button><button type='button' class='btn' onclick='minusKeywordDiv(this)'>-</button></div>";
		div.innerHTML = html;
		
		searchForm.getElementsByClassName("keywordField")[0].append(div);
		
		plusMinusBtnSetting("keywordBtns", keywordkeys.length);
	}
	
	var minusKeywordDiv = function(t){
		if(keywordCntArr.length < keywordArrNum-1){
			var target = $(t).parent().parent();
			var id = target.attr("id");
			target.remove();
			keywordCntArr.push(id.substr(id.length-1));
			
			plusMinusBtnSetting("keywordBtns", keywordkeys.length);
		}
	}
	
	var setKeywordFormat = function(){
		//format 클래스가 들어가 셀렉트를 선택
		var selects = document.getElementsByClassName("keywordField")[0].getElementsByClassName("format");
		// select option setting
		for(let i = 0; i<selects.length; i++){
			var options = selects[i].options;
			
			for(key in selectedKeywordFormat){
				//각 select의 option 확인하여 disable
				for(let j = 0; j<options.length; j++){
					if(options[j].value == key){
						$(options[j]).prop("disabled",true);
					}
				}
			}
		}
	}
	
	// 체크박스/ 라디오를 눌렀을때 선택 기능제공 / 라디오일경우 선택해제 하지 않음 
	var checkFunction = function(t){
		var input = $(t).parent().children()[0];
		if(input.checked == true && input.type != "radio"){
			input.checked = false
		}else{
			input.checked = true;
		}
	}
	
	// 라디오 버튼이 선택되었을때 라디오 버튼이 한개도 안선택되었는지를 확인하여 처리하는 메소드
	var selectedRadioCheck = function(t){
		var selectedRadio = document.getElementsByClassName(".selectedRadio");
		var result = false;
		
		for(let r of selectedRadio){
			if(r.selected == true){
				result = true;
			}
		}
		
		if(result != true){
			$(t).parent().find("input")[0].selected = result;
		}
	}
	
	// "모든" 버튼을 눌렀을때 다른 모든 버튼이 선택되는 기능을 제공
	var allCheck = function(t){
		var input = $(t).parent().children()[0];
		var $divs = $(t).parent().parent().children();
		if(input.checked == true){
			$divs.each(function(i, e){
					$(e).children()[0].checked = true;
			});
		}else{
			$divs.each(function(i, e){
				$(e).children()[0].checked = false;
			});
		}
	}
	
	// "모든" 버튼을 제외한 다른 버튼을 눌렀을때 다른 버튼이 선택되었는지 확인하고 "모든" 버튼을 조정하는 기능을 제공
	var checkAllBtn = function(t){
		var checkCnt = 0;
		var $divs = $(t).parent().parent().children();
		var target = "";
		$divs.each(function(i, e){
			if(i != 0){
				if($(e).children()[0].checked == true){
					checkCnt += 1;
				}
			}else{
				target = $(e).children()[0];
			}
		})
		if(checkCnt == $divs.length-1){
			target.checked = true;		
		}else{
			target.checked = false;
		}
	}
	
// 회원 상제정보 컴포넌트를 컨트롤하는 스크립트
	var openMemberDetailComponent = function(memberNo){
		var result = setMemberDetailComponent(memberNo);
		$("#memberDetailComponent").css("display", "block");
		document.documentElement.style.overflow = 'hidden';
	}
	
	// ajax를 이용하여 컴포넌트의 생성 객체를 전달
	var setMemberDetailComponent = function(memberNo){
		axios.post('/yolowa/rest/admin/component/member/'+memberNo, {
		    params: {}
		  })
		  .then(function (response) {
			 memberDetailComponent.memberDetail = response.data; 
		  })
	}
	
	var closeMemberDetailComponent = function(){
		$('#state'+memberDetailComponent.memberDetail.member.memberNo).text($('.status').children()[1].innerText);
		$("#memberDetailComponent").css("display", "none");
		memberDetailComponent.memberDetail = templateMemberDetail;
		document.documentElement.style.overflow = '';
		
	}
	
// 회원 상제정보 컴포넌트를 컨트롤하는 스크립트
	var openHostingDetailComponent = function(type, no){
		setHostingDetailMemberComponent(type, no);
		$("#hostingDetailComponent").css("display", "block");
		document.documentElement.style.overflow = 'hidden';
	}
	
	// hosting component객체에 데이터를 ajax로 전달 / type: m=memberNo로 검색, h=hostingNo로 검색
	var setHostingDetailMemberComponent = function(type, no){
		axios.post('/yolowa/rest/admin/component/hosting/member/'+type+'/'+no, {
		    params: {}
		  })
		  .then(function (response) {
			  hostingDetailComponent.hostingMemberDetail = response.data;
			  setHostingDetailComponent(no, 'open', type);
		  })
	}
	
	var setHostingDetailComponent = function(hostingNo, type, t){
		axios.post('/yolowa/rest/admin/component/hosting/'+hostingNo, {
		    params: {}
		  })
		  .then(function (response) {
			  hostingDetailComponent.hostingDetail = response.data;
			  if(type == 'open'){
				  setTimeout(() => {
					  var selectOptions = document.getElementById('selectHostingOfMember').options;
					  if(t == "m"){
						  selectOptions[0].selected = true;
						  //$(selectOptions).children()[0].selected = true;
					  }else if(t == "h"){
						for(option of selectOptions){
							if(hostingNo == parseInt(option.innerText.split('(')[1].split(')')[0])){
								option.selected = true;
							}
						}  
					  }
					  
				  }, 10);
			  }
		  })
	}
	
	var closeHostingDetailComponent = function(){
		$("#hostingDetailComponent").css("display", "none");
		document.documentElement.style.overflow = '';
	}
	// 생성
	if(searchForm.rangeCount.value != 0){
		plusRangeDiv();
	}
	if(searchForm.keywordCount.value != 0){
		plusKeywordDiv();
	}
	
/* 열렸다 닫혔다 하는 기능 */
	//다음 형제노드의 객체를 비활성화 하는 jquery를 이용한 함수 // 
	var nextDivToggle = function(t){
		var $next = $(t).next();
		$next.toggle();
	}
	
	// 입력 폼에서 한명을 선택할 경우 좌측 입력상자를 토글하는 함수
	var parentNextInputToggle = function(t, i){
		
		// 선택된 옵션 확인
		var options = t.options;
		var selected = "";
		for(let op of options){
			if(op.selected == true){
				selected = op;
			}
		}
		
		// 토글 대상 선택
		var $input = $($(t).parent().next().find("input")[0]);
		
		if(selected.value == "divEvery"){
			// 모든유저를 선택한 경우
			$input.css("display", "none");
		}else if(selected.value == "divSelect"){
			// 한유저를 선택한 경우
			$input.css("display", "block");
		}
	}
	
/* */
	// select tag값과 일치시킨 옵션의 값 이름을 넣어 설정 태그를 수정하는 함수
	var setSelectTag = function(selectTag, optionValueName){
		var rangeOptions = selectTag.options;
		for(let z = 0; z<rangeOptions.length; z++){
			if(rangeOptions[z].selected == true){
				rangeOptions[z].selected = false;
			}
			if(rangeOptions[z].value == filter[optionValueName]){
				rangeOptions[z].selected = true;
			}
		}
	}
/* filter를 재로딩할때 사용하는 함수 */
	// searchForm 세팅하는 함수
	var setRangeFilter = function(searchForm, filter){
		// Range
		// 추가된 rangeDiv 갯수를 확인하기 위한 변수
		var rangeCountCheck = 0
		for(let i = 1; i <= filter.rangeCount; i++){
			// rangeFormat이 정의 되어있을 경우 변수 증가
			if( filter['rangeFormat' + i]!=undefined){
				rangeCountCheck++;
				// rangeFormat이 두개 이상이면 range 추가
				if(rangeCountCheck > 1){
					plusRangeDiv();
				}
			}
			
			// format이 정의 되어있을 경우
			if(filter['rangeFormat' + i] != undefined){
				// rangeFormat 선택태그 설정
				setSelectTag(searchForm["rangeFormat" + rangeCountCheck], 'rangeFormat' + i);
				
				// range vlaue 값 세팅
				if(filter['rangeStartYear' + i] != ''){
					setSelectTag(searchForm["rangeStartYear" + rangeCountCheck], 'rangeStartYear' + i);
				}
				if(filter['rangeStartMonth' + i] != ''){
					setSelectTag(searchForm["rangeStartMonth" + rangeCountCheck], 'rangeStartMonth' + i);
				}
				if(filter['rangeStartDay' + i] != ''){
					setSelectTag(searchForm["rangeStartDay" + rangeCountCheck], 'rangeStartDay' + i);
				}
				if(filter['rangeEndYear' + i] != ''){
					setSelectTag(searchForm["rangeEndYear" + rangeCountCheck], 'rangeEndYear' + i);
				}
				if(filter['rangeEndMonth' + i] != ''){
					setSelectTag(searchForm["rangeEndMonth" + rangeCountCheck], 'rangeEndMonth' + i);
				}
				if(filter['rangeEndDay' + i] != ''){
					setSelectTag(searchForm["rangeEndDay" + rangeCountCheck], 'rangeEndDay' + i);
				}
			}
		}
	}
	
	// keywordForm 세팅 함수
	var setKeywordFilter = function(searchForm, filter){
		// keyword
		// 추가된 keywordDiv 갯수를 확인하기 위한 변수
		var keywordCountCheck = 0;
		for(let i = 1; i <= filter.keywordCount; i++){
			// keywordFormat이 정의 되어있을 경우 변수 증가
			if( filter['keywordFormat' + i]!=undefined){
				keywordCountCheck++;
				// keywordFormat이 두개 이상이면 range 추가
				if(keywordCountCheck > 1){
					plusKeywordDiv();
				}
			}
			
			if(filter['keywordFormat' + i] != undefined){
				// rangeFormat 선택태그 설정
				setSelectTag(searchForm["keywordFormat" + keywordCountCheck], 'keywordFormat' + i);
				searchForm["keywordValue" + keywordCountCheck].value = filter['keywordValue' + i]; 
			}
		}
	}
	
	//
	var setCheckboxFilter = function(searchForm, filter, nameList){
		for(let name of nameList){
			if(filter[name] != undefined){
				searchForm[name].checked = true;
			}else{
				searchForm[name].checked = false;
			}
		}
	}
	
	var setNumberFilter = function(searchForm, filter, nameList){
		for(let name of nameList){
			if(filter[name] != undefined){
				searchForm[name].value = filter[name];
			}
		}
	}
	
	// searchRowForm 세팅하는 함수
	var setSearchRowFilter = function(searchForm, filter){
		var searchRow = filter.searchRow;
		searchForm.searchRow
		.forEach((e) => {
			e.checked = false;
			if(e.value == searchRow){
				e.checked = true;
			}
		})
	}
	
//
	
	
	
/*유효성 검사 관련 함수 정의*/

// 날짜가 포맷에 맞는지 검사


// 윤연에 해당하는지 검사
function isLeaf(year) {
	var leaf = false;

	if(year % 4 == 0) {
		leaf = true;
		if(year % 100 == 0) leaf = false;
		if(year % 400 == 0) leaf = true;
	}
	return leaf;
}

// 날짜가 포맷에 맞고 윤연에 해당하는지 실제 날짜 유효성 검사
function isValidDate(d) {
	var regDate = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;
	if(!regDate.test(d)) return false;
	var month_day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

	var dateArray = d.split('-');
	var year = Number(dateArray[0]);
	var month = Number(dateArray[1]);
	var day = Number(dateArray[2]);

	if(day == 0) return false;

	var isValid = false;

	// 윤년
	if(isLeaf(year)) {
		if(month == 2) {
			if(day <= month_day[month-1] + 1) isValid = true;
		} else {
			if(day <= month_day[month-1]) isValid = true;
		}	
	} else {
		if(day <= month_day[month-1]) isValid = true;
	}
	return isValid;
}

var isValidRangeFilter = function(){
	for(let i = 1; i<=rangeArrNum; i++){
		var start = (searchForm['rangeStartYear'+i]==undefined?0:searchForm['rangeStartYear'+i].value)+'-'+(searchForm['rangeStartMonth'+i]==undefined?0:searchForm['rangeStartMonth'+i].value)+'-'+(searchForm['rangeStartDay'+i]==undefined?0:searchForm['rangeStartDay'+i].value);
		var end = (searchForm['rangeEndYear'+i]==undefined?0:searchForm['rangeEndYear'+i].value)+'-'+(searchForm['rangeEndMonth'+i]==undefined?0:searchForm['rangeEndMonth'+i].value)+'-'+(searchForm['rangeEndDay'+i]==undefined?0:searchForm['rangeEndDay'+i].value);
		
		//입력 값이 없다면
		if(!(start=='0-0-0' || end=='0-0-0') && !(start=='--' && end=='--')){
			if(!isValidDate(start)){
				return false;
			}
			if(!isValidDate(end)){
				return false;
			}
		}
	}
	return true;
}

var isValidKeywordFilter = function(noKeywordFormatArr){
	for(let i = 1; i<=keywordArrNum; i++){
		if(keywordFormat = searchForm['keywordFormat'+i] != undefined && searchForm['keywordValue'+i] != undefined){
			let keywordFormat = searchForm['keywordFormat'+i].value;
			let keywordValue = searchForm['keywordValue'+i].value;
			for(noKeywordFormat of noKeywordFormatArr){
				if(noKeywordFormat == keywordFormat){
					if(isNaN(new Number(keywordValue))) return false;
					if(keywordValue.length > 10) return false;  
				}
			}
		}
	}
	return true;
}

//필터값 유효성 검사
var filtering = function(noKeywordFormatArr){
	if(!isValidRangeFilter()){
		showAlert('오류 메시지', '검색 범위가 올바르지 않습니다.');
		return false;
	}
	if(!isValidKeywordFilter(noKeywordFormatArr)){
		showAlert('오류 메시지', '번호는 10자리 이하의 숫자로 입력해주세요.');
		return false;
	}
	$(searchForm).submit();
}


	