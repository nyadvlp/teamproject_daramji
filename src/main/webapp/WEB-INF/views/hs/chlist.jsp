<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#ch{
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

	<h2>챌린지 목록</h2>
<div id="ch">
<table>
	<tr><th>챌린지 등록번호</th><th>대분류번호</th><th>중분류번호</th><th>소분류번호</th><th>챌주 아이디</th><th>챌주 닉네임</th>
	<th>챌린지 등록일</th><th>챌린지 시작일</th><th>챌린지 종료일</th><th>참여정원 수</th><th>챌린지제목</th><th>챌린지내용</th>
	<th>챌린지 사진</th><th>챌린지 추천수</th><th>챌린지 상태</th><th>인증예시사진</th><th>인증예시설명</th><th>현재 참여인원 수</th></tr>
	<c:forEach var="ch" items="${listCh }">
		<tr>
			<td>${ch.chg_num }</td>
			<td>${ch.lc_num }</td>
			<td>${ch.mc_num }</td>
			<td>${ch.sc_num }</td>
			<td>${ch.chg_master }</td>
			<td>${ch.master_nickname }</td>
			<td>${ch.chg_regdate }</td>
			<td>${ch.chg_startdate }</td>
			<td>${ch.chg_enddate }</td>
			<td>${ch.chg_capacity }</td>
			<td>${ch.chg_title }</td>
			<td>${ch.chg_contents }</td>
			<td>${ch.chg_image }</td>
			<td>${ch.chg_like_count }</td>
			<td>${ch.chg_state }</td>
			<td>${ch.chg_sample_image }</td>
			<td>${ch.chg_sample_text }</td>
			<td>${ch.chg_now_parti }</td>
			<td><input type="button" value="포인트회수" onclick="location.href=''"><p>
			<input type="button" value="챌린지 중단" onclick="location.href='updateCh?chg_num=${ch.chg_num}'"></tr>
	</c:forEach>
</table>
</div>

<div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>
</body>
</html>