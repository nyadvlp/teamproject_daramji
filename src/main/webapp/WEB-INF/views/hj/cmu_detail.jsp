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
		//?????? ??????
		var contextPath='${pageContext.request.contextPath}';
		var b_num = $('input[name=b_num]').val();
		console.log("getReply_update run!!!");
		console.log("b_nume : "+b_num); 
		
		$.ajax({
			url 		: "<%=context%>/reply_insert",
			dataType	: 'text',
			data		: $('#form').serialize(), //id="form"??? form??? ????????? ????????????
			success		: function(data){
					console.log("??????");
					if(data == "good"){
							//??????
							alert("????????????");
							console.log("??????");
							location.reload();//????????????
								
						}else{
							//??????
							alert("????????????");
							console.log("??????");
							
						}
				}
			});
		}
	
	 function updateReply(re_no){
		 //?????? ?????? => 1.????????? ????????? ??? ?????? text ?????? ?????? div??? ?????????
		 //alert("re_no=>"+re_no);
		 var div = "";
 		 div += '<div class="detail_div1">';
		 div += '<input type="text"  id="replyUpdate" name="replyUpdate" style="width: 50%; height: 50px; margin-left: 15%; font-size: 30px;" placeholder="????????? ???????????????">';
		 div +=	'<input type="button"  id="button_01_detail" name="replyUp" value="????????????" class="button_01_detail" onclick="getReply_update('+re_no+');">';
		 div += '</div>';

		 $('#div'+re_no).replaceWith(div); //????????? ?????? ????????? ?????? ??? ??? ?????? div??? ??????
		 //$('#div'+re_no).append(div);
		 
		
 		} 
	 
	 function getReply_update(re_no){
		 //?????? ?????? =>2. ?????? ???????????? ????????? ?????? ??? ?????? ?????? ?????????(?????? ??????)
		 alert("re_no=>"+re_no);
		 var contents = $('input[name=replyUpdate]').val();
		 alert("contents"+contents);
		 
		  $.ajax({
			 url : "<%=context%>/Reply_update",
			 dataType	: 'text',
			 data		: {re_no : re_no,contents : contents}, //data ????????? ?????? ???
			 success	: function(data){
				 alert("??????1");
				 if(data == "good"){
						//??????
						alert("????????????");
						console.log("??????");
						location.reload(); //????????????
					}else{
						//??????
						alert("????????????");
						console.log("??????");
						
					}
				 
			 }
		 }); 
		 
	 }
	 
	 function deleteReply(re_no) {
		//?????? ??????????????? ????????? -1???
		// alert("re_no=>"+re_no);
		$.ajax({
			 url 		: "<%=context%>/deleteReply",
			 dataType	: 'text',
			 data		: {re_no : re_no}, 
			 success 	: function(data){
				 if(data == "result"){
						//??????
						alert("????????????");
						console.log("??????");
						location.reload(); //????????????
					}else{
						//??????
						alert("????????????");
						console.log("??????");
						
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
					var lickCnt = parseInt(data);    //????????? ????????? ????????? ????????????
					alert("?????????????????????");
					$('#like1').html(lickCnt);
					$('#like').prop("disabled",true); //?????? ??????????????? ??????..??
					
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
	
<!--????????? ?????? ????????????  -->

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
				<input type="button" value="???" id="like" name="?????????" onclick="updateLike()" readonly="readonly" >&nbsp;&nbsp;:
				<span id="like1">${com.b_like_count }</span>
				</span>&nbsp;&nbsp;
				<span style="width: 5%; ">
				????????? : ${com.b_view_count }
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
				<!--????????? ?????? ,  ??????  -->
				<input type="button" onclick="location.href='delete?b_num=${com.b_num}'" value="??????"  class="button_01_detail">
				<input type="button" onclick="location.href='update?b_num=${com.b_num}'" value="??????"  class="button_02_detail">
			</div>
			</c:if>
			<hr style="width: 100%; ">
	
		<!--???????????? -->
		<div>
			<div >
					<div id="totalRe" style="text-align: left; margin-left: 50px; ">
						<p style="font-size: 30px; margin-left:5px; font-family ChosunGu " id="cCnt">??? (${replyTotal})?????? ??????</p>
						<input type="hidden" name="b_num" value="${com.b_num}">
					</div>
					<br>
					<input type="text"  id="reply" name="reply" style="width: 80%; height: 50px; margin-left: 5px; font-size: 30px;" placeholder="????????? ???????????????">
				<!--button ??? ?????? submit??? ??????!   -->	
					<input type="button"  id="button_01_detail"  name="" value="??????"  class="button_01_detail" onclick="getReply_insert()">
					<br><br>
			</div>
			<br>
			<c:if test="${replyList != null }">
			
			<c:forEach var="reply" items="${replyList}">
				
					<div id="repliy_re1" style="height: 0 auto;">
				
						<!--????????? ???????????? ??????  -->
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
										<input type="button" class="button_03_detail" onclick="deleteReply(${reply.re_no})" value="????????????">
										<input type="button" class="button_03_detail" onclick="updateReply(${reply.re_no})" value="????????????">
									</c:if>
								</div><hr>
							</div><br>
						</div>
				</c:forEach><br><br><br>
<!-- 							<div class="detail_div1">
									<input type="text"  id="replyUpdate" name="replyUpdate" style="width: 80%; height: 50px; margin-left: 10px; font-size: 30px;" placeholder="????????? ???????????????">
									<button  id="button_01_detail"  name="" value=""  class="button_03_detail" onclick="getReply_update();">????????????</button>
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
					<p>????????? ????????? ????????????</p>
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