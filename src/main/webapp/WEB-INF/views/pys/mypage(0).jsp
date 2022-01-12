<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
    <%@ include file="/WEB-INF/views/teamtwo/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐</title>
</head>
<body>
	
	<div><!-- Header 부분(Hello,천재개발자 송우재님 / GoMain / MyPage)start -->
        <div class="divProfileMain">
             <img alt="" src="upload/profileIMG/${userlist_me.get(0).getUser_image() }" width="70px;" height="70px;" style=" border-radius: 70%;">
        </div>        
        <div class="divHelloId" style="font-family: 'OTNamoogulrimLA' ">
                 <b class="h3HelloFont">반가워요,</b>
                 <b class="h3userIdFont">${userlist_me.get(0).getUser_nickname() }</b>
                 <b class="h3NimFont">님</b>
        </div>
        <div class="divGoMain">
            <a href="main?user_id_email=${user_id_email }">
            <img alt="" src="teamtwo/img/mainbutton.png" width="50px;" height="50px;">
            </a>
        </div>
        <div class="divMyPage">
            <a href="mypage?user_id_email=${user_id_email }&page_id_email=${use64r_id_email }">
            <img alt="" src="teamtwo/img/mypagebutton.png" width="50px;" height="50px;">
            </a>
        </div>
        <div class="divLogout">
            <a href="#">
            <img alt="" src="teamtwo/img/logoutbutton.png" width="50px;" height="50px;">
            </a>
        </div>
    </div><!-- Header 부분(Hello,천재개발자 송우재님 / GoMain / MyPage)end -->
      
     <hr style=" border-bottom: 0px; text-align: left; width: 92%; border-top: 1px solid black;" >
      
    <div><!-- Main Menu 부분 (챌린지 만들기 / 커뮤니티 / 랭킹 )start -->
       <div class="divNav">
            <div class="divNavbutton"><a href="#" class="divNavAtag">챌린지등록</a></div>
            <div class="divNavbutton"><a href="#" class="divNavAtag">커뮤니티</a></div>
            <div class="divNavbutton"><a href="#" class="divNavAtag">랭킹</a></div>
            <div class="divNavbutton"><a href="#" class="divNavAtag">미정</a></div>
       </div>
    </div><!-- Main Menu 부분 (챌린지 만들기 / 커뮤니티 / 랭킹 )end -->
     
     <hr style=" border-bottom: 0px; text-align: left; width: 92%; border-top: 1px solid black;" >
     <div style="margin-top: 30px;"></div>
     
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
			<div class="calendar">
				<div>
				<div class="calendar_month">
				${calendar.get(5).getMonth() }월
				</div>
				<c:forEach var="calendar" items="${calendar }">
					<div class="calendar_day" style="background-color: ${calendar.holiday_backgroundcolr}; color: ${calendar.holiday_colr };">
					${calendar.day } <br>
					${calendar.week }
					</div>
				</c:forEach>
				</div>
				
				<c:forEach var="calendar_master" items="${calendar_master}">
				
				<div class="calendar_ToDo" style="background-color: #ff8100;">
				${calendar_master.chg_title }
				</div>
				
				<div class="calendar_ToDoDay">
				<div style="width: 30000px;">
				<div class="calendar_bar" style="width: calc(70.406px * ${calendar_master.end_day_between}); margin: 0 0 0 calc(70.406px * (${calendar_master.start_day_between} + 1) + 35px); background-color: #916657;"></div>
				<img class="calendar_ToDo_dotori" src="/pys/img/도토리.png">
				</div>
				</div>
				
				</c:forEach>
				
				<c:if test="${challenges.size() == 0 && calendar_master.size() == 0}">
				<div class="calendar_ToDo" style="width: 1020px; margin: 10px 0px 0 15px;">
				하고 계신 챌린지가 없습니다
				</div>
				</c:if>
				
				<c:forEach var="challenges" items="${challenges}">
				
				<div class="calendar_ToDo">
				${challenges.chg_title }
				</div>
				
				<div class="calendar_ToDoDay">
				<div style="width: 30000px;">
				<div class="calendar_bar" style="width: calc(70.406px * ${challenges.end_day_between}); margin: 0 0 0 calc(70.406px * (${challenges.start_day_between} + 1) + 35px);"></div>
				<img class="calendar_ToDo_dotori" src="/pys/img/도토리.png">
				</div>
				</div>
				
				</c:forEach>
				
			</div>
			<div style="">
				<div class="point">
				<div class="point_in">
				<div style="float: left;">
				<img class="dotori" src="/pys/img/도토리.png">
				<a style="font-family: JalnanOTF; font-size: 40px; color: #DB9C67;">${point}</a>
				<a style="font-family: JalnanOTF; font-size: 33px; color: #784331;">열매</a>
				</div>
				<form action="mypage_point" style="margin: 0 0 0 0;">
				<input type="submit" value="more..." style="font-family: JalnanOTF; font-size: 15px; color: #ADADAD; float: left; background-color: white; border: 0; outline: 0; cursor: pointer; position: relative; top: 30px;">
				<input type="hidden" name="user_id_email" value="${user_id_email}">
				<input type="hidden" name="page_id_email" value="${page_id_email}">
				</form>
				<br>
				<c:forEach var="points" items="${points}" begin="0" end="4">
					<div style="font-family: ChosunGu; font-size: 25px; width: 247.5px; padding: 5px 0 5px 0; float: left;">
					- ${points.point_memo}
					</div>
					<div>
					<div style="font-family: ChosunGu; font-size: 25px; width: 212.5px; padding: 5px 0 5px 0; float: left; text-align: right;">
					<c:choose>
						<c:when test="${points.point_plus ne '0'}">
							<img class="dotori" src="/pys/img/도토리.png" style="width: 25px;"> +${points.point_plus} 
						</c:when>
						<c:otherwise>
							<img class="dotori" src="/pys/img/도토리.png" style="width: 25px;"> -${points.point_minus}
						</c:otherwise>
					</c:choose>
					</div>
					</div>
				</c:forEach>
				</div>
				</div>
				
				<div class="chart">
				<div class="chart_in">
				<div class="chart_circle" style="background: conic-gradient(#C55A11 ${ch_success_p_1} ${ch_success_p_2}, #F8CBAD ${ch_progress_p_1} ${ch_progress_p_2}, #7E715B ${ch_fail_p_1} ${ch_fail_2});">
				</div>
				<div style="margin: 100px 0 0 25px; float: left;">
				<div style="font-family: S-CoreDream-3Light; font-size: 15px;">
				<div class="chart_text1">
				</div>
				&nbsp;내가 성공한 챌린지 수 :&nbsp; ${ch_success } 개
				</div>
				<div style="font-family: S-CoreDream-3Light; font-size: 15px;">
				<div class="chart_text2">
				</div>
				&nbsp;내가 진행한 챌린지 수 :&nbsp; ${ch_progress } 개
				</div>
				<div style="font-family: S-CoreDream-3Light; font-size: 15px;">
				<div class="chart_text3">
				</div>
				&nbsp;내가 실패한 챌린지 수 :&nbsp; ${ch_fail } 개
				</div>
				</div>
				</div>
				</div>
				
				<div class="timeline">
				<div class="timeline_in">
				<div class="timeline_now">
				${calendar.get(5).getDay() } (${calendar.get(5).getWeek() })
				</div>
				<c:if test="${challenges.size() == 0 && calendar_master.size() == 0}">
				<div class="timeline_check" style="width: 1040px; text-align: center; padding: 20px 0 20px 0; font-family: ChosunGu; font-size: 15px; height: 15px;">
				하고 계신 챌린지가 없습니다
				</div>
				</c:if>
				<c:forEach var="challenges" items="${challenges}">
					<div class="timeline_check">
						<div class="timeline_how" style="background-color: #916657;">
						${challenges.chg_title }
						</div>
						<div class="timeline_img" style=" url(upload/mainIMG/${challenges.chg_image})">
						</div>
					</div>
				</c:forEach>
				<c:forEach var="calendar_master" items="${calendar_master}">
					<div class="timeline_check">
						<div class="timeline_how">
						${calendar_master.chg_title }
						</div>
						<div class="timeline_img" style="background-image: url(upload/mainIMG/${calendar_master.chg_image})">
						</div>
					</div>
				</c:forEach>
				</div>
				</div>
				
			</div>
		</div>
	</div>
	
</body>
</html>