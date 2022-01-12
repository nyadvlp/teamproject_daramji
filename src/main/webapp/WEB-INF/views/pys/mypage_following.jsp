<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
    <%@ include file="/WEB-INF/views/teamtwo/header.jsp" %>
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
     
	<div class="standard">
	
		<div class="profile">
			<div class="profile_text_3">
			<div class="profile_text_2">
			<div class="profile_text_1">
				<div class="profile_img_3">
				<div class="profile_img_2">
				<div class="profile_img_1" style="background-image: url(upload/profileIMG/${userlist.get(0).getUser_image() })">
				</div>
				</div>
				</div>
				<div class="profile_whiteSpace_1">
				</div>
				${userlist.get(0).getUser_nickname() }
				<br>
				<a class="profile_Onelineintroduction">${userlist.get(0).getUser_intro() }</a>
				<c:choose>
					<c:when test="${user_id_email == page_id_email }">
						<form action="mypage_profile" method="post">
						<input type="hidden" name="user_id_email" value="${user_id_email}">
						<input type="submit" class="edit_OR_follow" value="프로필편집">
						</form>
					</c:when>
					<c:when test="${follow_Did eq '0'}">
						<form action="mypage_follow" method="post">
						<input type="hidden" name="user_id_email" value="${user_id_email}">
						<input type="hidden" name="page_id_email" value="${page_id_email}">
						<input type="hidden" name="follow_Did" value="${follow_Did}">
						<input type="submit" class="edit_OR_follow" value="팔로우하기">
						</form>
					</c:when>
					<c:otherwise>
						<form action="mypage_follow" method="post">
						<input type="hidden" name="user_id_email" value="${user_id_email}">
						<input type="hidden" name="page_id_email" value="${page_id_email}">
						<input type="hidden" name="follow_Did" value="${follow_Did}">
						<input type="submit" class="edit_OR_follow" value="팔로우해지">
						</form>
					</c:otherwise>
				</c:choose>
				<div class="followers_following_num">
				${follower }
				</div>
				<form action="mypage_followers">
				<input type="submit" class="followers_following" value="팔로워">
				<input type="hidden" name="user_id_email" value="${user_id_email}">
				<input type="hidden" name="page_id_email" value="${page_id_email}">
				</form>
				<div class="followers_following_num">
				${following }
				</div>
				<form action="mypage_following">
				<input type="submit" class="followers_following" value="팔로잉">
				<input type="hidden" name="user_id_email" value="${user_id_email}">
				<input type="hidden" name="page_id_email" value="${page_id_email}">
				</form>
			</div>
			</div>
			</div>	
		</div>
		
		<div class="main">
			<div>
	<form action="mypage_followers">
		<button class="follow_no_button">
			<a style="font-family: JalnanOTF; font-size: 40px; color: #C1C1C1;">팔로워</a>&nbsp;
			<a style="font-family: ChosunGu; font-size: 35px; color: #C1C1C1;">${follower_list.size()}명</a>
		</button>
		<input type="hidden" name="user_id_email" value="${user_id_email}">
		<input type="hidden" name="page_id_email" value="${page_id_email}">
	</form>
	
	<form action="mypage_following">
		<button class="follow_yes_button">
			<a style="font-family: JalnanOTF; font-size: 40px; color: white;">팔로잉</a>&nbsp;
			<a style="font-family: ChosunGu; font-size: 35px; color: white;">${following_list.size()}명</a>
		</button>
		<input type="hidden" name="user_id_email" value="${user_id_email}">
		<input type="hidden" name="page_id_email" value="${page_id_email}">
	</form>
			</div>

			
			<div style="width: 1000px; background-color: #F2F2F2; float: left;">
			
			<c:forEach var="following_list" items="${following_list }" varStatus="status">
			<div style="width: 800px; margin: 20px 100px 20px 100px; border-radius: 25px; background-color: white; float: left;">
			<div class="divProfileMain" style="margin: 0 0 0 0; float: left;">
			<img alt="" src="upload/profileIMG/${following_list.user_image}" width="70px;" height="70px;" style=" border-radius: 70%;">
			</div>
				<form action="mypage">
		      	  	<input type="submit" value="${following_list.user_nickname}" style="font-family: JalnanOTF; font-size: 33px; color: #784331; outline: 0px; border: 0px; background-color: white; top: 10px; position: relative; float: left; cursor:pointer;">
					<a>${following_list.user_intro}</a>
					<input type="hidden" name="user_id_email" value="${userlist_me.get(0).getUser_id_email()}">
					<input type="hidden" name="page_id_email" value="${following_list.user_id_email}">
				</form>
			<button style="width:100px; padding: 10px 0 10px 0; margin: 5px 10px 0 0;  border-radius: 25px; background-color: white; box-shadow: inset 0 0 0px 4px #c55a11; border:0; outline:0; color: black; font-family: ChosunGu; font-size: 15px; cursor: pointer; float: right;">팔로우해제</button>
			</c:forEach>
			</div>
			
			</div>
			
			</div>
				
			</div>
			
		</div>
		
		</div>
		
<div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>
		
</body>
</html>