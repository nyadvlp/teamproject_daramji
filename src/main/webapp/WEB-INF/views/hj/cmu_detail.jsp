<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
    System.out.println("context->"+context);
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face {
    font-family: 'ChosunGu';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}@font-face {
    font-family: 'yg-jalnan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

	.button_01_detail{
		background-color:#9f6e54;
		color:#ebd39f; 
		border: 1px solid #7e715b; 
		border-radius: 10px; 
		width: 70px;
		height: 40px;
		font-family:ChosunGu;
		margin: 10px;
	}
		.button_02_detail{
		background-color:#ebd39f;
		color: #9f6e54;
		border: 1px solid #7e715b; 
		border-radius: 10px; 
		width: 70px;
		height: 40px;
		font-family:ChosunGu;
		margin: 10px;
	} 
	.button_03_detail{
		background-color:#9f6e54;
		color:#ebd39f; 
		border: 1px solid #7e715b; 
		border-radius: 10px; 
		width: 70px;
		height: 40px;
		font-family:ChosunGu;
		margin: 10px;
		float: right;
		margin-right: 50px;
		margin-top: 0px;
	}
	.detail_div1{
		text-align: left;
	}
	.detail_div1_p{
		 font-family:ChosunGu;
		 margin: 5px;
		 font-size: 20px; 
	}
	.detail_div1_p1{
		 font-family:yg-jalnan;
		 margin: 5px; 
		 font-size: 30px;
		
	}
	.detail_re_p1{
		height: 50px; 
		font-size: 20px; 
		font-family:ChosunGu; 
		margin-top: 15px; 
		margin-bottom: 2px;
	}
	.detail_re_p2{
		height: 50px; 
		font-size: 25px; 
		font-family:ChosunGu; 
		margin: 0px;	
	}
	
	
	

	.repliy_re_div{
		 width: 1470px; 
		 height: 10%; 
		 float: left; 
		 margin-left: 15%;
		 margin-bottom: 1%;
		
	}
	.reply_img{
		width: 80px;
		height: 100px;
		margin-right: 15px;
	}
	.repliy_rere_div{
	
	
	}
	
	
</style>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">

 

	function getReply_insert(){
		//댓글 등록
		var contextPath='${pageContext.request.contextPath}';
		var b_num = $('input[name=b_num]').val();
		console.log("getReply_update run!!!");
		console.log("b_nume : "+b_num); 
		
		$.ajax({
			url 		: "<%=context%>/reply_insert",
			dataType	: 'text',
			data		: $('#form').serialize(), //id="form"인 form의 데이터 가져오기
			success		: function(data){
					console.log("확인");
					if(data == "good"){
							//성공
							alert("등록성공");
							console.log("성공");
							location.reload();//새로고침
								
						}else{
							//성공
							alert("등록실패");
							console.log("실패");
							
						}
				}
			});
		}
	
	 function updateReply(re_no){
		 //댓글 수정 => 1.댓글을 수정할 수 있게 text 값을 받을 div로 바꿔줌
		 //alert("re_no=>"+re_no);
		 var div = "";
 		 div += '<div class="detail_div1">';
		 div += '<input type="text"  id="replyUpdate" name="replyUpdate" style="width: 50%; height: 50px; margin-left: 15%; font-size: 30px;" placeholder="댓글을 수정하세요">';
		 div +=	'<input type="button"  id="button_01_detail" name="replyUp" value="수정하기" class="button_01_detail" onclick="getReply_update('+re_no+');">';
		 div += '</div>';

		 $('#div'+re_no).replaceWith(div); //댓글이 있는 자리에 수정 할 수 있는 div로 바꿈
		 //$('#div'+re_no).append(div);
		 
		
 		} 
	 
	 function getReply_update(re_no){
		 //댓글 수정 =>2. 댓글 수정하기 버튼을 누를 떼 실행 되는 아작스(실제 수정)
		 alert("re_no=>"+re_no);
		 var contents = $('input[name=replyUpdate]').val();
		 alert("contents"+contents);
		 
		  $.ajax({
			 url : "<%=context%>/Reply_update",
			 dataType	: 'text',
			 data		: {re_no : re_no,contents : contents}, //data 여러개 받을 때
			 success	: function(data){
				 alert("확인1");
				 if(data == "good"){
						//성공
						alert("수정성공");
						console.log("성공");
						location.reload(); //새로고침
					}else{
						//성공
						alert("수정실패");
						console.log("실패");
						
					}
				 
			 }
		 }); 
		 
	 }
	 
	 function deleteReply(re_no) {
		//댓글 삭제이지만 상태를 -1로
		// alert("re_no=>"+re_no);
		$.ajax({
			 url 		: "<%=context%>/deleteReply",
			 dataType	: 'text',
			 data		: {re_no : re_no}, 
			 success 	: function(data){
				 if(data == "result"){
						//성공
						alert("삭제성공");
						console.log("성공");
						location.reload(); //새로고침
					}else{
						//성공
						alert("삭제실패");
						console.log("실패");
						
					}
			 }

		});
		
	}
 
	
	
	function updateLike(){
		
		var b_num = $('input[name=b_num]').val();
		
			$.ajax({
		
				url 		: "<%=context%>/updateLike",
				dataType 	: 'text',
				data		: {b_num : b_num},
				success		: function(data){
					var lickCnt = parseInt(data);    //문자를 정수형 숫자로 변환해줌
					alert("추천되었습니다");
					$('#like1').html(lickCnt);
					$('#like').prop("disabled",true); //추천 여러번으로 할까..??
					
				}
			
			});

	}
	
</script>

</head>
<body>

	<div style="height: 70px; margin: 0 0 15px 0;">
	<jsp:include page="/WEB-INF/views/teamtwo/header.jsp">
		<jsp:param name="user_id_email" value="${user_id_email}"/>
	</jsp:include>
	</div>
	
<!--로그인 정보 가져오기  -->

<div style="width: 100%; height: 100%; margin-left: 5%; margin-top: 5%;">
	<div style="width: 90%; height: 90%; text-align: center; ">
		<form action="" id="form">
		
			<div style=" width: 10%; float: left;">
				<input type="image" style="width: 80px; height: 80px;" src="/upload/profileIMG/${com.user_image}">
			</div>
			<div style=" width: 40%; float: left; ">
				<div class="detail_div1">
					<p class="detail_div1_p">[${com.b_subject }]</p>
				</div>
				<div class="detail_div1">
					<p class="detail_div1_p1">${com.b_title}</p>
				</div>
				<div class="detail_div1">
					<p class="detail_div1_p">${com.b_nickname }</p>
					<input type="hidden" name="user_id_email" value="${com.b_id_email}">
				</div>
				<div class="detail_div1">
					<p class="detail_div1_p"><fmt:formatDate value="${com.b_regdate }" pattern="yyyy/MM/dd HH:mm:ss"/></p>

				</div>
			</div>
			<div style=" width: 20%; height:83px;float: right; vertical-align: bottom; font-size: 20px;">
				<span style="width: 10px; top: 150px;">
				<input type="button" value="❤" id="like" name="좋아요" onclick="updateLike()" readonly="readonly" >&nbsp;&nbsp;:
				<span id="like1">${com.b_like_count }</span>
				</span>&nbsp;&nbsp;
				<span style="width: 5%; ">
				조회수 : ${com.b_view_count }
				</span>
			</div>
			<br>
			<hr style="width: 100%; ">
			<div style="width: 1470px; height : 0 auto; margin-left: 15%;">
				<c:if test="${com.b_image != null}">
					<img alt="" src="/upload/cmuIMG/${com.b_image}" style="width: 500px; height: 500px;">
					<br><br>
					<div>${com.b_contents}</div>
					<br><br>
				</c:if>
				<c:if test="${com.b_image == null }">
					<br><br>
					<div style="width: 800px; height: 500px; text-align: center;">${com.b_contents}</div>
					<br><br>
				</c:if>
			</div>
			<c:if test="${com.b_id_email == user_model.user_id_email}">
			<div>
				<!--게시글 수정 ,  삭제  -->
				<input type="button" onclick="location.href='delete?b_num=${com.b_num}'" value="삭제"  class="button_01_detail">
				<input type="button" onclick="location.href='update?b_num=${com.b_num}'" value="수정"  class="button_02_detail">
			</div>
			</c:if>
			<hr style="width: 100%; ">
	
		<!--댓글작업 -->
		<div>
			<div >
					<div id="totalRe" style="text-align: left; margin-left: 50px; ">
						<p style="font-size: 30px; margin-left:5px; font-family ChosunGu " id="cCnt">총 (${replyTotal})개의 댓글</p>
						<input type="hidden" name="b_num" value="${com.b_num}">
					</div>
					<br>
					<input type="text"  id="reply" name="reply" style="width: 80%; height: 50px; margin-left: 5px; font-size: 30px;" placeholder="댓글을 등록하세요">
				<!--button 은 자동 submit이 된다!   -->	
					<input type="button"  id="button_01_detail"  name="" value="등록"  class="button_01_detail" onclick="getReply_insert()">
					<br><br>
			</div>
			<br>
			<c:if test="${replyList != null }">
			
			<c:forEach var="reply" items="${replyList}">
				
					<div id="repliy_re1" style="height: 0 auto;">
				
						<!--댓글이 보여지는 부분  -->
						<div id="div${reply.re_no}" class="repliy_re_div" >
 								<div style="float: left;">
									<a href=""><input type="image" src="/upload/profileIMG/${reply.user_image}" style="width: 80px; height: 100px; margin-right: 15px;"></a>
								</div>
								<div class="detail_div1">
									<p class="detail_re_p1" style="">${reply.re_writer }&nbsp;&nbsp;<fmt:formatDate value="${reply.re_date }" pattern="yyyy/MM/dd HH:mm:ss" />
								</div>
								<div class="detail_div1">
									<p class="detail_re_p2">${reply.re_contents}
									<c:if test="${reply.re_writer == user_model.user_id_email}">
										<input type="button" class="button_03_detail" onclick="deleteReply(${reply.re_no})" value="삭제하기">
										<input type="button" class="button_03_detail" onclick="updateReply(${reply.re_no})" value="수정하기">
									</c:if>
								</div><hr>
							</div><br>
						</div>
				</c:forEach><br><br><br>
<!-- 							<div class="detail_div1">
									<input type="text"  id="replyUpdate" name="replyUpdate" style="width: 80%; height: 50px; margin-left: 10px; font-size: 30px;" placeholder="댓글을 등록하세요">
									<button  id="button_01_detail"  name="" value=""  class="button_03_detail" onclick="getReply_update();">수정하기</button>
								</div>
 -->								
<%--								<div style="float: left;">
									<a href=""><input type="image" style="width: 80px; height: 100px; margin-right: 15px;"></a>
								</div>
								<div class="detail_div1">
									<p class="detail_re_p1" style="">${reply.re_writer }&nbsp;&nbsp;<fmt:formatDate value="${reply.re_date }" pattern="yyyy/MM/dd HH:mm:ss" />
								</div>
 								<div class="detail_div1">
									<textarea rows="5" cols="40" style="font-family:ChosunGu;">${reply.re_contents}</textarea>
								</div>
 --%>								
						
								
								
								
								
								
								
								
								<!--  -->
								
	
			<div id="repliy_re1"></div>
			
			</c:if>
			<c:if test="${replyList == null }">
				<div class="repliy_re_div">
					<p>작성된 댓글이 없습니다</p>
				</div>
			</c:if>	
		<br><br>	
		</div>
		
		
		
		</form>
	</div>
		
</div>

<div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>

</body>
</html>