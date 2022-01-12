<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.endPageBody {
	width: 1000px;
	display: inline-block;
	position: absolute;
	margin-left: 300px;
	vertical-align: top;
	text-align: center;
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

	<div class="endPageBody">
		<b class="h3userIdFont">${message }</b><br /><br>
		<img src="ban/img/daram1.png" width="400px">

	</div>


<div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>

</body>
</html>