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
    font-family: 'ChosunGu';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'yg-jalnan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

	.table_comm{
		width: 90%;
		border-collapse: collapse;
		margin: 0 auto;
		font-family:ChosunGu;
		font-size: 30px;
	
	}.nav{
		width: 86%;
		border-collapse: collapse;
		margin: 0 auto;
		font-family:ChosunGu;
		font-size: 30px;
		background-color: #9f6e54;
		height: 50px;
		border-radius: 10px;
		font-family:yg-jalnan;
	
	}
	.table_th_comm{
		background-color: #9f6e54;
		text-align: center;
		color: #f8d0a7;
		height: 80px;
		font-size: 20px;
		
	}
	.table_tr_comm{
		color:black;
		background-color: white;
		border-bottom:2px solid #f8d0a7;
		text-align: center;
		height: 50px;
		font-size: 20px;
	}
	
	.button_01_comm{
		background-color:#9f6e54;
		color:#ebd39f; 
		border: 1px solid #7e715b; 
		border-radius: 8px; 
		width: 60px;
		height: 35px;
		font-family:ChosunGu;
	}
	.listbutton{
	font-family: 'ChosunGu';
	font-size: 25px;
	color: #9f6e54;
	text-decoration: none;
	margin-left: 50px;
	margin-bottom : 25px;
	background-color: #ffffff00;
	outline: 0;
	border: 0;
	cursor: pointer;
}

.listDa:hover{
	color: black;
}
.listbutton:hover{
	color: black;
}

</style>
</head>
<body>

	<div style="height: 70px; margin: 0 0 15px 0;">
	<jsp:include page="/WEB-INF/views/teamtwo/header.jsp">
		<jsp:param name="user_id_email" value="${user_id_email}"/>
	</jsp:include>
	</div>
	
<div style="width: 100%; height: 100%;  text-align: center;  ">
	<div style="width: 100%; height: 100%; text-align: center;">
		<form method="post" >
		<h2 style="font-family: 'yg-jalnan'; text-align: left; font-size: 50px; margin-left: 10%;">커뮤니티</h2>
		<div>
			
<!-- 		<input type="button" class="listbutton" name="0" value="전체보기">
			<button class="listbutton" name="b_c_num" value="1">자유게시판</button><a href="nav?b_c_num=3"><input type="button" class="listbutton" name="b_c_num" value="챌린지홍보"></a> 
 			<input type="button" value="test1자유게시판" class="listbutton" onclick="nav?b_c_num=1" name="1">
			<input type="button" value="test2자유게시판" class="listbutton" onclick="location.href='nav?b_c_num=1'" name="1">
 -->		
 			<input type="button" class="listbutton"	 onclick="location.href='community'" 		   name="b_c_num" value="전체보기">
 			<input type="button" class="listbutton"	 onclick="location.href='community?b_c_num=1'" name="b_c_num" value="자유게시판">
			<input type="button" class="listbutton"	 onclick="location.href='community?b_c_num=2'" name="b_c_num" value="정보공유">
			<input type="button" class="listbutton"	 onclick="location.href='community?b_c_num=3'" name="b_c_num" value="챌린지홍보">
			
			<input type="hidden" name="user_id_email" value="${user_model.user_id_email }">
			<input type="hidden" name="user_nickname" value="${user_model.user_nickname }">
			<input type="hidden" name="user_image" value="${user_model.user_image }">
		
		</div>
		</form>	
		<form action="" style="margin: 2%;" method="post" name="form" id="form" >
			<input type="hidden" name="user_id_email" value="${user_model.user_id_email }">
			<input type="hidden" name="user_nickname" value="${user_model.user_nickname }">
			<input type="hidden" name="user_image" value="${user_model.user_image }">
			
			
			
			<table class="table_comm">
				<thead>
					<tr class="table_th_comm">
						<th>번호</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>조회수</th>
						<th>추천수</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="list" items="${commList}">
					<c:if test="${total > 1 }">
					<tr class="table_tr_comm">
						<td class="table_td_comm">${list.b_num}</td>
						<td class="table_td_comm">[${list.b_subject}]</td>
						<%-- <td class="table_td_comm">
							<a href="cmu_detail?b_num=${list.b_num}" onclick="javascript:location.href='form'">${list.b_title}</a>
						</td> --%>
						<td class="table_td_comm">
							<a href="cmu_detail?b_num=${list.b_num}&user_id_email=${user_model.getUser_id_email()}&user_nickname=${user_model.getUser_nickname()}&user_image=${user_model.getUser_image()}">${list.b_title}</a>
						</td>
						<td class="table_td_comm">
							<a href="mypage?user_id_email=${user_model.getUser_id_email()}&page_id_email=${list.b_id_email}&user_nickname=${user_model.getUser_nickname()}&user_image=${user_model.getUser_image()}">${list.b_nickname}</a>
						</td>
						<td class="table_td_comm">
						<fmt:formatDate value="${list.b_regdate }" pattern="yyyy/MM/dd"/></td>
						<td class="table_td_comm">${list.b_view_count }</td>
						<td class="table_td_comm">❤ ${list.b_like_count }</td>
					</tr>
					</c:if>
					<c:if test="${total == 0 }">
						<tr class="table_tr_comm">
							<td colspan="7" class="table_td_comm">게시글이 없습니다</td>
						</tr>
					</c:if>
					</c:forEach>
				</tbody>		
			</table>
		</form>
		<br>
		<div style="float: right; width: 30%; ">
			<form action="writeForm" method="post">
			<button class="button_01_comm">글쓰기</button>
			<input type="hidden" name="user_id_email" value="${user_model.user_id_email }">
			<input type="hidden" name="user_nickname" value="${user_model.user_nickname }">
			<input type="hidden" name="user_image" value="${user_model.user_image }">
			
			</form>
		</div>
		<br>
		<br>
		<div style="width: 95%; text-align: center;  margin: 10px;">
			<form action="search" method="post" style="display: inline; width: 50%; height: 100px;">
				<select style=" height: 40px;" name="search_option">
					<option value="b_title"  <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
					<option value="b_nickname" <c:if test="${condition eq 'writer'}">selected</c:if>>작성자</option>
				</select>
				<!--로그인  -->
				<input type="hidden" name="user_id_email" value="${user_model.user_id_email }">
				<input type="hidden" name="user_nickname" value="${user_model.user_nickname }">
				<input type="hidden" name="user_image" value="${user_model.user_image }">

				<input type="text" name="keyword" placeholder="검색하세요" style=" height: 35px;">
				<input type="submit" class="button_01_comm" name="" value="찾기" >
				
				
			</form>
		</div>
		<br>
		<form method="post">
		
			<input type="hidden" name="user_id_email" value="${user_model.user_id_email }">
			<input type="hidden" name="user_nickname" value="${user_model.user_nickname }">
			<input type="hidden" name="user_image" 	  value="${user_model.user_image }">
			
		<c:if test="${b_c_num == null }">
			<div style="width: 100%; text-align: center;">
				<div style="display: inline; width: 50%; height: 100px;">
					<c:if test="${page.startPage > page.pageBlock }">
						<a href="list?currentPage=${page.startPage-page.pageBlock}">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
						<a href="community?currentPage=${i}">[${i}]</a>
					</c:forEach>
					<c:if test="${page.endPage < page.totalPage }">
						<a href="community?currentPage=${page.startPage+page.pageBlock}">[다음]</a>
					</c:if>
			</div>
		</div>
	</c:if>
		<c:if test="${b_c_num != null }">
			<div style="width: 100%; text-align: center;">
				<div style="display: inline; width: 50%; height: 100px;">
					<c:if test="${page.startPage > page.pageBlock }">
						<a href="list?b_c_num=${b_c_num}&currentPage=${page.startPage-page.pageBlock}">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
						<a href="community?b_c_num=${b_c_num}&currentPage=${i}">[${i}]</a>
					</c:forEach>
					<c:if test="${page.endPage < page.totalPage }">
						<a href="community?b_c_num=${b_c_num}&currentPage=${page.startPage+page.pageBlock}">[다음]</a>
					</c:if>
			</div>
		</div>
	</c:if>
	
	</form>
</div>
</div>

<div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>
</body>
</html>