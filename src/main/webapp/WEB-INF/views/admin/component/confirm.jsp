<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- confirm Modal-->
<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
   <div class="modal-dialog" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title" id="confirmModalLabel"></h5>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true">&times;</span>
         </button>
       </div>
       <div class="modal-body" id="confirmModalContent">
         
       </div>
       <div class="modal-footer">
         <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
         <button type="button" id="confirmModalEvent" class="btn btn-primary">확인</button>
       </div>
     </div>
   </div>
 </div>
 <script>
     var showConfirm = function(label, content, callback, argArr){
       $('#confirmModal').modal('show');
       $('#confirmModalLabel').text(label);
       $('#confirmModalContent').text(content);
       document.getElementById('confirmModalEvent').onclick = function(){
    	   if(argArr == undefined){
    		  callback();   
    	   }else if(argArr.length == 1){
    		   callback(argArr[0]);
    	   }else if(argArr.length == 2){
    		   callback(argArr[0], argArr[1]);
    	   }else if(argArr.length == 3){
    		   callback(argArr[0], argArr[1], argArr[2]);
    	   }
           $('#confirmModal').modal('hide')
       };
     }
 </script>