<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>
<html>
<script type="text/javascript" src="dh/js/jquery.js"></script>
<script type="text/javascript" src="dh/js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function findId() {
		var user_name = $('#user_name').val();
		var user_phone = $('#user_phone').val();
		$.ajax({
			url : '<%=context%>/findId',
			data : {user_name : user_name, user_phone : user_phone},
			dataType : 'text',
			success : function(data) {
				$('#findId').append("회원님의 아이디는 <b><span id='id'>"+data+"</span></b> 입니다.<p>");
				$('#chk1').hide();
				$('#chk2').show();
			}
		});
	};
</script>
<style type="text/css">
@font-face {
	font-family: 'yg-jalnan';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'ChosunGu';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
 #id{
 	color: blue;
 }
 #chk2{display: none;}
 body {
	width: 1900px;
}
/* 스크롤바 */
body::-webkit-scrollbar{width: 16px;}
body::-webkit-scrollbar-track {background-color:#f1f1f1;}
body::-webkit-scrollbar-thumb {background-color:#D8E4A9; border-radius: 10px;}
body::-webkit-scrollbar-thumb:hover {background:#555;}
body::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {width:16px;height:16px;background:#D8E4A9;}
.idFound{
	font-family: 'yg-jalnan';
	text-align: center;
    margin-top: 200px;
    margin-left: 750px;
    margin-right: 750px;
    border-radius: 25px;
    padding-bottom: 10px;
    padding-top: 10px;
}
.found{
   font-family: 'ChosunGu';
}
</style>
</head>
<body>
<div class="idFound">
	<h1 style="color: #DB9C67;">아이디 찾기</h1>
	<div class="found">
	이름: <input type="text" id="user_name" name="user_name" placeholder="이름" required="required" style="border-radius: 5px; border: 1px solid  #9E8173; width: 200px; height: 30px; margin-left: 13px;"><p>
	연락처: <input type="tel" id="user_phone" name="user_phone"
				placeholder="전화번호 ex)000-0000-0000"
				pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required="required" style="border-radius: 5px; border: 1px solid  #9E8173; width: 200px; height: 30px;"><p>
	<span id="findId"></span>
	<button id="chk1" onclick="findId();" style="background: #9E8173; border: #9E8173; border-radius: 5px; width: 110px; height:30px; color: white;">아이디 찾기</button>
	<button id="chk2" onclick="location.href='pwFound'" style="background: #9E8173; border: #9E8173; border-radius: 5px;width: 110px; height:30px; color: white;">비밀번호 찾기</button>
	<button onclick="location.href='login'" style="background: white; border: 1px solid  #9E8173; border-radius: 5px; width: 110px; height:30px; color: black;">취소</button>
	</div>
</div>
<div style="position: absolute; bottom: 0px; width: 99%; height: 130px;">
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>
</html>