<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#user{
	width: auto;
	height: auto;}
	table {
	font-size: 15%;
}
</style>
</head>
<body>

   <div style="height: 70px; margin: 0 0 15px 0;">
	<jsp:include page="/WEB-INF/views/teamtwo/header.jsp">
		<jsp:param name="user_id_email" value="${user_id_email}"/>
		<jsp:param name="user_nickname" value="${user_nickname}"/>
	</jsp:include>
	</div>

	<h2>회원 목록</h2>
<div id="user">
<table>
	<tr><th>이메일</th><th>닉네임</th><th>비밀번호</th><th>생년월일</th><th>전화번호</th>
	<th>성별</th><th>프사</th><th>한줄소개</th><th>가입일</th><th>회원상태</th><th>회원실명</th><th>계정상태</th></tr>
	<c:forEach var="user_info" items="${listUser }">
		<tr>
			<td>${user_info.user_id_email }</td>
			<td>${user_info.user_nickname }</td>
			<td>${user_info.user_password }</td>
			<td>${user_info.user_birth }</td>
			<td>${user_info.user_phone }</td>
			<td>${user_info.user_gender }</td>
			<td>${user_info.user_image }</td>
			<td>${user_info.user_intro }</td>
			<td>${user_info.user_regdate }</td>
			<td>${user_info.user_state }</td>
			<td>${user_info.user_name }</td>
			<td><input type="button" value="계정중지" onclick="location.href='userUpdate?user_id_email=${user_info.user_id_email}'"><p>
				<input type="button" value="계정활성화" onclick="location.href='userUpdate2?user_id_email=${user_info.user_id_email}'"></td></tr>
		<c:set var="num" value="${num + 1 }"></c:set>
	</c:forEach>
</table>
</div>

<div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>
</body>
</html>