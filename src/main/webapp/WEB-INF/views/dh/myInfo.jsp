<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.myInfo{
	font-family: 'yg-jalnan';
	text-align: center;
    margin-top: 10px;
    margin-left: 750px;
    margin-right: 750px;
    padding-bottom: 10px;
    padding-top: 10px;
}
.introImage{
	 font-family: 'ChosunGu';
}
body{
	width: 1900px;
}
input[type="file"]{
		display:none;
	}
.input-file-button {
	border: 1px solid  #9E8173;
	border-radius:5px;
	background-color:  #9E8173;
	display: inline-block;	
	padding: 6px; 12px;
	cursor: pointer;
	color: white;
}
/* 스크롤바 */
body::-webkit-scrollbar{width: 16px;}
body::-webkit-scrollbar-track {background-color:#f1f1f1;}
body::-webkit-scrollbar-thumb {background-color:#D8E4A9; border-radius: 10px;}
body::-webkit-scrollbar-thumb:hover {background:#555;}
body::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {width:16px;height:16px;background:#D8E4A9;}
</style>
</head>
<body>
	<div style="height: 70px; margin: 0 0 15px 0;">
	<jsp:include page="/WEB-INF/views/teamtwo/header.jsp">
		<jsp:param name="user_id_email" value="${user_id_email}"/>
		<jsp:param name="user_nickname" value="${user_nickname}"/>
	</jsp:include>
	</div>
<div class="myInfo">
	<h1><b style="color: #DB9C67;">${user.user_nickname }</b>님의 프로필 편집</h1>
<div class="introImage">
<!-- 사진,한줄소개 수정 -->
	<form action="myInfo_update" method="post" enctype="multipart/form-data">		
		<input type="hidden" name="user_id_email" value="${user.user_id_email }">
		<input type="hidden" name="user_image" value="${user.user_image }">
		<input type="hidden" name="user_nickname" value="${user.user_nickname }">
		<b style="color: #C55A11;">프로필 이미지</b><p>
		<c:if test="${user.user_image != null}">
		<img src="upload/profileIMG/${user.user_image }" style="background-size: 100%; width:170px; height:170px; border-radius: 50%; position: relative; background-color: white; top: 5px; left: 5px; overflow: hidden;"><p>
		</c:if>
		<c:if test="${user.user_image == null}">
		<b>본인을 소개할 이미지를 넣어주세요</b><p>
		</c:if>
		<label class="input-file-button" for="image">수정 이미지</label>
		<input type="file" id="image" name="user_image"><p>
		<b style="color: #C55A11;">한줄 소개</b><p>
		<textarea name="user_intro" rows="5" cols="40" maxlength="36">${user.user_intro }</textarea><p>
		<input type="submit" value="프로필 수정" style="background: #9E8173; border: #9E8173; border-radius: 5px;width: 110px; height:30px; color: white;">
		<input type="button" value="취소" onclick="history.back()" style="background: white; border: 1px solid  #9E8173; border-radius: 5px; width: 110px; height:30px; color: black;">
	</form>
</div>
</div>
<div style="position: absolute; bottom: 0px; width: 99%; height: 130px;">
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>
</body>
</html>