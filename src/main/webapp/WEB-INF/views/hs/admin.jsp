<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <div style="height: 70px; margin: 0 0 15px 0;">
	<jsp:include page="/WEB-INF/views/teamtwo/header.jsp">
		<jsp:param name="user_id_email" value="${user_id_email}"/>
		<jsp:param name="user_nickname" value="${user_nickname}"/>
	</jsp:include>
	</div>
	
	<input type="button" value="회원관리" onclick="location.href='userlist'">
	<input type="button" value="챌린지관리" onclick="location.href='chlist'">
	<input type="button" value="게시물관리" onclick="location.href='cmlist'">


	<div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>

</body>
</html>