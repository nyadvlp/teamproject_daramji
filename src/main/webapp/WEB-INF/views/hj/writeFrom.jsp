<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
@font-face {
    font-family: 'ChosunGu';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
	textarea {
			width: 100%;
			height: 200px;
			padding: 10px;
			box-sizing: border-box;
			border: solid 2px #9f6e54;
			border-radius: 5px;
			font-size: 16px;
			resize: both;
	}
	.button_01_write{
		background-color:#9f6e54;
		color:#ebd39f; 
		border: 1px solid #7e715b; 
		border-radius: 8px; 
		width: 60px;
		height: 35px;
		font-family:ChosunGu;
		margin: 10px;
	}
	.table_write{
		background-color:#ebd39f;
		width: 90%;
		border-collapse: collapse;
		margin: 0 auto;
		font-family:ChosunGu;
	
	}
	.table_tr_write{
		font-family:ChosunGu;
		border-bottom:1px solid #9f6e54;
		height: 40px;
	}
	.ck-editor__editable {
	    min-height: 400px;
	
	}
	.ck.ck-editor{
		max-width: 1470px;
	}
	
	
</style>
<script type="text/javascript" src="/resource/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(document).ready(Function(){
		$('#title').keyUp(function(){
			if($(this).val.length > $(this).attr('maxlength')){
				alert("제목의 제한 길이를 초과하였습니다 제한 길이만큼 다시 작성해 주세요");
				$('#title').focus();
				
			}
		});
	});
	
</script>
</head>
<body>

	<div style="height: 70px; margin: 0 0 15px 0;">
	<jsp:include page="/WEB-INF/views/teamtwo/header.jsp">
		<jsp:param name="user_id_email" value="${user_id_email}"/>
		<jsp:param name="user_nickname" value="${user_nickname}"/>
	</jsp:include>
	</div>
	
	
<div style="width: 1600px; height: 900px; margin-left:50px; margin-right:10px; ">
	<div style="width: 1470px; height: 50px; text-align: center;">
			<form action="write_insert" method="post" style="font-family:S-CoreDream-3Light;" target="myBatisFrame" enctype="multipart/form-data">
				<table class="table_write">
					
					<tr class="table_tr_write">
						<th>카테고리</th>
						<td>
							<select name="b_c_num">
								<option value="1">자유게시판</option>
								<option value="2">정보공유</option>
								<option value="3">챌린지홍보</option>
							</select>
						</td>
					</tr>
					
					<tr class="table_tr_write">
						<th>제목</th>
						<td><input type="text" id="title" name="title" placeholder="제목을 작성하세요(~21자)" required="required" style="width: 30%;" maxlength="21"></td>
					</tr>
					<tr class="table_tr_write">
						<th>첨부파일</th>
						<td><input type="file" name="file" id="file"></td>
						
					</tr>
				</table><br>
					<input type="hidden" name="path" value="${pageContext.request.contextPath}/upload/cmuIMG/"> 
				
<!--ckEditor 사용  -->
				<div style="width: 90%; margin: 0 auto;">
				<textarea name="content" id="editor" ></textarea>
 				    <script> 
				    ClassicEditor 
				    .create( document.querySelector( '#editor' ),{
				    	removePlugins: [ 'ImageUpload'],
				    	language : 'ko'
				    } ) 
				    .then( editor => { 
				        console.log( editor ); 
				    } ) 
				    .catch( error => { 
				        console.error( error ); 
				    } );
				    </script>
				</div>
				<div style="float: right; width: 22%; ">
				
					<input type="hidden" name="user_id_email" value="${user_model.user_id_email }">
					<input type="hidden" name="user_nickname" value="${user_model.user_nickname }">
					
					<input type="submit" value="등록" class="button_01_write">
					<input type="reset" value="취소"  class="button_01_write">
					==>${user_model.user_id_email }=>${user_model.user_nickname}
				</div>	
			</form>
		</div>
	</div>
	
	<div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>
	
</body>
</html>