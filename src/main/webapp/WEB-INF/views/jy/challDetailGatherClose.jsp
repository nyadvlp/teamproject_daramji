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
	
	
	<c:forEach var="chall" items="${chall}">
			챌린지 사진 : <img src="../upload/mainIMG/${chall.chg_image}" style="width:100px; height:100px;">
			챌린지명 : ${chall.chg_title}<p>
			챌린지 상태 : 인원마감 D- ${chall.chg_startdate} - 오늘 날짜. //아님 빼버릴까..;<p>
			해시태그 : 챌린지+해시태그+해시태그2...? <p>
			챌린지소개 : ${chall.chg_contents}<p>
			챌주 프사 : 챌린지+유저인포<p>
			챌린지기간 : ${chall.chg_startdate} ~ ${chall.chg_enddate}<p>
			
			인증예시사진 : ${chall.chg_sample_image}<p>
			인증예시설명 : ${chall.chg_sample_text}<p>
			
		</c:forEach>
		
		<div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>
</body>
</html>