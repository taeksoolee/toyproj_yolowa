<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- alert Modal -->
<div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="alertModalLabel" aria-hidden="true">
   <div class="modal-dialog" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title" id="alertModalLabel"></h5>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true">&times;</span>
         </button>
       </div>
       <div class="modal-body" id="alertModalContent">
         
       </div>
       <div class="modal-footer">
         <button id="alertModalEvent" type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
       </div>
     </div>
   </div>
 </div>

<script>
    var showAlert = function(label, content, callback, argArr){
      $('#alertModal').modal('show');
      $('#alertModalLabel').text(label);
      $('#alertModalContent').text(content);
      document.getElementById('alertModalEvent').onclick = function(){
	   	   if(argArr == undefined){
	   		  callback();   
	   	   }else if(argArr.length == 1){
	   		   callback(argArr[0]);
	   	   }else if(argArr.length == 2){
	   		   callback(argArr[0], argArr[1]);
	   	   }else if(argArr.length == 3){
	   		   callback(argArr[0], argArr[1], argArr[2]);
	   	   }
	   		$('#alertModal').modal('hide');
		};
    }
</script>
