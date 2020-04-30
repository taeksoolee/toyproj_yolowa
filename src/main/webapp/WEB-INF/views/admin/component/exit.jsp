<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- exit Modal-->
<div class="modal fade" id="exitModal" tabindex="-1" role="dialog"
	aria-labelledby="exitModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exitModalLabel">홈페이지 이동</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div>변경 내용이 저장되지 않을 수 있습니다.</div>
				<div>홈페이지로 이동하시겠습니까?</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
				<a class="btn btn-primary" href="${pageContext.request.contextPath }">이동</a>
			</div>
		</div>
	</div>
</div>