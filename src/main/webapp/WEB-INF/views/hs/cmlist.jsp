<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#com{
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
	
	<h2>게시물 목록</h2>
<div id="comm">
<table>
	<tr><th>게시물 등록번호</th><th>게시물 작성자</th><th>게시물 닉네임</th><th>게시물 작성일</th><th>게시물 추천수</th><th>게시물 조회수</th>
	<th>게시물 제목</th><th>게시물 내용</th><th>게시물 분류</th><th>게시물 첨부이미지</th><th>게시물 상태</th><th>수정</th></tr>
	<c:forEach var="cm" items="${listCm }">
		<tr>
			<td>${cm.b_num }</td>
			<td>${cm.b_id_email }</td>
			<td>${cm.b_nickname }</td>
			<td>${cm.b_regdate }</td>
			<td>${cm.b_like_count }</td>
			<td>${cm.b_view_count }</td>
			<td>${cm.b_title }</td>
			<td>${cm.b_contents }</td>
			<td>${cm.b_c_num }</td>
			<td>${cm.b_image }</td>
			<td>${cm.b_state }</td>
			<td><input type="button" value="삭제" onclick="location.href='updateForm?b_num=${cm.b_num}'"></tr>
		<c:set var="num" value="${num + 1 }"></c:set>
	</c:forEach>
</table>
</div>

<div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>

</body>
</html>