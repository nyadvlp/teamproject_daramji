<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp"%>
    
    <%
	String context = request.getContextPath();
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style type="text/css">
	.coint_chart_clear:after {
	content:"";
	display:block;
	clear:both;
}
	.ins_clear:after {
	content:"";
	display:block;
	clear:both;
}
	.mypage:after {
	content:"";
	display:block;
	clear:both;
}
</style>
<body>
	<div style="height: 70px; margin: 0 0 15px 0;">
	<jsp:include page="/WEB-INF/views/teamtwo/header.jsp">
		<jsp:param name="user_id_email" value="${user_id_email}"/>
	</jsp:include>
	</div>
	
     <!-- 마이페이지 구역 -->
    <div class="mypage" style="width: 1300px; margin: 0 auto;">
     
     <!-- 프로필 영역 시작 -->
	<div id="Profile_area" style="width: 300px; float: left;">
			<!-- 프로필 사진 영역 시작 -->
			<div style="width:180px; height:180px; border-radius: 50%; box-shadow: inset 0 0 0 4px #db9c67; background-color: #c45910; margin: 0 60px 0 60px; position: relative; z-index: 2;">
				<div style="background-image: url('upload/profileIMG/${userlist_page.get(0).getUser_image()}'); background-size: 100%; width:170px; height:170px; border-radius: 50%; position: relative; background-color: white; top: 5px; left: 5px; overflow: hidden;">
				</div>
			</div>
			<!-- 프로필 사진 영역 끝 -->
		<!-- 프로필 내용 시작 -->
		<div style="width: 300px; box-shadow: 0 0 0 4px #f8d0a7; border-radius: 35px; text-align: center; position: relative; top: -50px; overflow: hidden; position: relative; z-index: 1;">
			<!-- 빈 공간 시작 -->
			<div style="width: 300px; height: 70px;"></div>
			<!-- 빈 공간 끝 -->
			<!-- 닉네임 시작 -->	
			<div style="font-family: JalnanOTF; font-size: 30px;">
			${userlist_page.get(0).getUser_nickname() }
			</div>
			<!-- 닉네임 끝 -->
			<!-- 한줄 소개 시작 -->
			<div style="font-family: ChosunGu; font-size: 15px; margin: 20px 0 20px 0;">
			${userlist_page.get(0).getUser_intro() }
			</div>
			<!-- 한줄 소개 끝 -->
			<!-- 프로필 편집 or 팔로우 시작 -->
			<c:choose>
				<c:when test="${user_model.getUser_id_email() == userlist_page.get(0).getUser_id_email()}">
					<form action="myInfo">
					<input type="hidden" id="user_id_email" name="user_id_email" value="${userlist_page.get(0).getUser_id_email()}">
					<button style="cursor: pointer; border: 0; outline: 0; width: 50%; margin: 0 25% 0 25%; padding: 10px 0 10px 0; font-family: ChosunGu; font-size: 15px; border-radius: 35px; color: white; background-color: black;">
					프로필편집
					</button>
					</form>
					<form action="myUser_info">
					<input type="hidden" name="user_id_email" value="${userlist_page.get(0).getUser_id_email()}">
					<button style="cursor: pointer; border: 0; outline: 0; width: 50%; margin: 0 25% 0 25%; padding: 10px 0 10px 0; font-family: ChosunGu; font-size: 15px; border-radius: 35px; color: white; background-color: black;">
					회원정보수정
					</button>
					</form>
				</c:when>
				<c:otherwise>
					<button style="cursor: pointer; border: 0; outline: 0; width: 50%; margin: 0 25% 0 25%; padding: 10px 0 10px 0; font-family: ChosunGu; font-size: 15px; border-radius: 35px; color: white; background-color: black;">
					팔로우
					</button>
				</c:otherwise>
			</c:choose>
			<!-- 프로필 편집 or 팔로우 끝 -->
			<!-- 팔로워 팔로잉 위젯 시작 -->
			<div id="Widget" style="width: 100%; margin: 20px 0 0 0; display: table;">
				<div style="display: table-cell;">
				<!--  -->
				
				<script type="text/javascript">
					function getFollower() {
						/* background-color 값 가져오기 */
						var Follower_button_background_color = $(".Follower_button").css("background-color");
						var Following_button_background_color = $(".Following_button").css("background-color");
						/* #getFollower_form, #getFollowing_form form 에 있는 모든 내용 가져오기 */
						var formData = $("#getFollower_form, #getFollowing_form").serialize();
						/* formData 에 key value 값 입력 */
						formData += "&Follower_button_background_color=" + Follower_button_background_color;
						formData += "&Following_button_background_color=" + Following_button_background_color;
						$.ajax({
							/* pys/MyPage_Ajax_Controller - getFollowringAjax */
							url:"<%=context%>/getFollowerAjax",
							type:"POST",
							data:formData,
							dataType:'json',
							success:function(data){
								/* background-color 바꾸기 */
								$(".Follower_button").css("background-color", data.Follower_button_background_color);
								$(".Following_button").css("background-color", data.Following_button_background_color);
								/* Follower 내용 보이기 */
								$(".Following_scroll").hide();
								$(".Follower_scroll").show();
								$("#Follower_search").show();
								$("#Following_search").hide();
							}
						});
					}
					function getFollowing() {
						/* background-color 값 가져오기 */
						var Follower_button_background_color = $(".Follower_button").css("background-color");
						var Following_button_background_color = $(".Following_button").css("background-color");
						/* #getFollower_form, #getFollowing_form form 에 있는 모든 내용 가져오기 */
						var formData = $("#getFollower_form, #getFollowing_form").serialize();
						/* formData 에 key value 값 입력 */
						formData += "&Follower_button_background_color=" + Follower_button_background_color;
						formData += "&Following_button_background_color=" + Following_button_background_color;
						$.ajax({
							/* pys/MyPage_Ajax_Controller - getFollowringAjax */
							url:"<%=context%>/getFollowingAjax",
							type:"POST",
							data:formData,
							dataType:'json',
							success:function(data){
								/* background-color 바꾸기 */
								$(".Follower_button").css("background-color", data.Follower_button_background_color);
								$(".Following_button").css("background-color", data.Following_button_background_color);
								/* Following 내용 보이기 */
								$(".Following_scroll").show();
								$(".Follower_scroll").hide();
								$("#Follower_search").hide();
								$("#Following_search").show();
							}
						});
					}
				</script>
				<!--  -->
				<!-- 팔로워 or 팔로잉 버튼 시작 -->
				<form id="getFollower_form" style="margin: 0;">
				<button id="Follower_button" class="Follower_button" onclick="getFollower()" type="button" style="width: 100%; font-family: JalnanOTF; font-size: 18px; background-color: #C55A11; color: white; box-shadow: inset 0 -3px 0 0 #7e3b0e; text-shadow: 0px 2px black; border: 0; outline: 0; border-radius: 25px 25px 0 0; padding: 5px 0 5px 0; cursor: pointer;">
				팔로워
				<span id="Follower_num" style="font-family: ChosunGu; color: white; font-size: 15px;">${follower_list.size() }</span> 명
				</button>
				</form>
				</div>
				<div style="display: table-cell;">
				<form id="getFollowing_form" style="margin: 0;">
				<button id="Following_button" class="Following_button" onclick="getFollowing()" type="button" style="width: 100%; font-family: JalnanOTF; font-size: 18px; background-color: #e1e1e1; color: white; box-shadow: inset 0 -3px 0 0 #7e3b0e; text-shadow: 0px 2px black; border: 0; outline: 0; border-radius: 25px 25px 0 0; padding: 5px 0 5px 0; cursor: pointer;">
				팔로잉
				<span id="Following_num" style="font-family: ChosunGu; color: white; font-size: 15px;">${following_list.size()}</span> 명
				</button>
				</form>
				<!-- 팔로워 or 팔로잉 버튼 끝 -->
				</div>
			</div>
			<!-- 팔로워 or 팔로잉 검색 시작 -->
			<div style="width: 100%; height: 20px; box-shadow: inset 0 -3px 0 0 #7e3b0e;">
			<input id="Follower_search" type="text" style="width: 100%; border: 0; outline: 0;" placeholder="검색">
			<input id="Following_search" type="text" style="display: none; width: 100%; border: 0; outline: 0;" placeholder="검색">
			</div>
			<script type="text/javascript">
			$(document).on('keyup', '#Follower_search', function(e) {
				
				var Vsearch = $('#Follower_search').val();
				var Vuser_id_email = $('#user_id_email').val();
				
				$.ajax({
					url:"<%=context%>/getFollower_searchAjax",
					type:"POST",
					data:{search:Vsearch, user_id_email:Vuser_id_email},
					dataType:'text',
					success:function(data){
						$("#Follower_scroll").load(" #Follower_scroll > *", {"Follower_scroll":data});
					}
				});
			});
			
			$(document).on('keyup', '#Following_search', function(e) {
				
				var Vsearch = $('#Following_search').val();
				var Vuser_id_email = $('#user_id_email').val();
				
				$.ajax({
					url:"<%=context%>/getFollowing_searchAjax",
					type:"POST",
					data:{search:Vsearch, user_id_email:Vuser_id_email},
					dataType:'text',
					success:function(data){
						$("#Following_scroll").load(" #Following_scroll > *", {"Following_scroll":data});
					}
				});
			});
			</script>
			<!-- 팔로워 or 팔로잉 검색 끝 -->
				<script type="text/javascript">
				$(document).ready(function(){
					/* Follow_scroll 스크롤이 끝까지 내려갈 경우 loadNext_Follow 실행 */
					$(".Follow_scroll").scroll(function() {
						if ($(".Follow_scroll").scrollTop() + $(".Follow_scroll").innerHeight() >= $(".Follow_scroll")[0].scrollHeight) {
							loadNext_Follow();
						}
					});
				});
				
				function loadNext_Follow() {
					
				}
				
				function getFollowing_haeseum(e, d) {
					var formData = $(e).serialize();
					
					$.ajax({
						/* pys/MyPage_Ajax_Controller - getFollowing_haeseumAjax */
						url:"<%=context%>/getFollowing_haeseumAjax",
						type:"POST",
						data:formData,
						dataType:'text',
						success:function(data){
							$(d).hide(data);
							$("#Following_scroll").load(" #Following_scroll > *");
							// $("#Follower_num").load(" #Follower_button");
							document.getElementById("Following_num").innerHTML=data;
						}
					});
				}
				
				function getFollowing_del(e, d) {
					var formData = $(e).serialize();
					
					$.ajax({
						/* pys/MyPage_Ajax_Controller - getFollowing_delAjax */
						url:"<%=context%>/getFollowing_delAjax",
						type:"POST",
						data:formData,
						dataType:'text',
						success:function(data){
							$(e.del).hide();
							$(e.re).show();
							$("#Follower_scroll").load(" #Follower_scroll > *");
							document.getElementById("Following_num").innerHTML=data;
						}
					});
				}
				
				function getFollowing_re(e, d) {
				var formData = $(e).serialize();
					
					$.ajax({
						/* pys/MyPage_Ajax_Controller - getFollowing_delAjax */
						url:"<%=context%>/getFollowing_reAjax",
						type:"POST",
						data:formData,
						dataType:'text',
						success:function(data){
							$(e.del).show();
							$(e.re).hide();
							$("#Follower_scroll").load(" #Follower_scroll > *");
							// $("#Follower_scroll").load(" #Follower_scroll > *");
							document.getElementById("Following_num").innerHTML=data;
						}
					});
				}
				</script>
			<div style="overflow: hidden;">
			
			<div id="Follower_scroll" class="Follower_scroll" style="width: 106%; height: 400px; background-color: #C55A11; box-shadow: inset 0 -6px 0 0 #7e3b0e; overflow-y: scroll; overflow-x: hidden;">
			<c:forEach var="follower_list" items="${follower_list }" varStatus="follower_list_status">
			<form id="Follower_scroll_form${follower_list_status.index }" style="margin: 0;">
				<input type="hidden" name="follower_list_follower_id_email" value="${follower_list.user_id_email }">
				<input type="hidden" name="follower_list_user_id_email" value="${userlist_page.get(0).getUser_id_email() }">
				<div style="width: 300px; height: 100px;">
					<div style="background-image: url('upload/profileIMG/${follower_list.user_image }'); background-size: 100%; height: 70px; width: 70px; border-radius: 50%; box-shadow: inset 0 0 0 2px white, 0px 3px 0 0px black; margin: 15px 5px 15px 5px; float: left;">
					</div>
					<div style="height: 100px; width: 150px; float: left;">
						<div style="width: 100%; font-family: ChosunGu; font-size: 18px; color: white; text-align: left; text-shadow: 0px 0px 2px white; padding: 10px 0 0 0;">
						${follower_list.user_nickname }
						</div>
						<div style="width: 100%; font-family: ChosunGu; font-size: 15px;  text-align: left; ">
							<c:choose>
								<c:when test="${fn:length(follower_list.user_intro) gt 26}">
									<c:out value="${fn:substring(follower_list.user_intro, 0, 28)}">... </c:out>
								</c:when>
								<c:otherwise>
									<c:out value="${follower_list.user_intro}"> </c:out>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div style="height: 100px; width: 65px; float: left;">
						<div style="width: 100%; height: 40%;">
						</div>
						<c:if test="${empty follower_list.haeseum }">
						<button type="button" class="Following_haeseum${follower_list_status.index }" onclick="getFollowing_haeseum(this.form, this);" style="width: 100%; padding: 2px 0 2px 0; margin: 0 0 0 0; border-radius: 20px; font-family: ChosunGu; color: white; border: 0; outline: 0; background-color: #ff6700; box-shadow: inset 0px 0px 0 2px white, 0px 3px 0 0 black; cursor: pointer;">
						팔로잉
						</button>
						</c:if>
					</div>
				</div>
			</form>
			</c:forEach>	
			</div>
			<div id="Following_scroll" class="Following_scroll" style="display: none; width: 106%; height: 400px; background-color: #C55A11; box-shadow: inset 0 -6px 0 0 #7e3b0e; overflow-y: scroll; overflow-x: hidden;">
			<div id=>
			<c:forEach var="following_list" items="${following_list }" varStatus="following_list_status">
				<form id="Following_scroll_form${following_list_status.index }" style="margin: 0;">
				<input type="hidden" name="following_list_following_id_email" value="${following_list.user_id_email }">
				<input type="hidden" name="following_list_user_id_email" value="${userlist_page.get(0).getUser_id_email() }">
				<div style="width: 300px; height: 100px;">
					<div style="background-image: url('upload/profileIMG/${following_list.user_image }'); background-size: 100%; height: 70px; width: 70px; border-radius: 50%; box-shadow: inset 0 0 0 2px white, 0px 3px 0 0px black; margin: 15px 5px 15px 5px; float: left;">
					</div>
					<div style="height: 100px; width: 150px; float: left;">
						<div style="width: 100%; font-family: ChosunGu; font-size: 18px; color: white; text-align: left; text-shadow: 0px 0px 2px white; padding: 10px 0 0 0;">
						${following_list.user_nickname }
						</div>
						<div style="width: 100%; font-family: ChosunGu; font-size: 15px;  text-align: left; ">
							<c:choose>
								<c:when test="${fn:length(following_list.user_intro) gt 26}">
									<c:out value="${fn:substring(following_list.user_intro, 0, 28)}">... </c:out>
								</c:when>
								<c:otherwise>
									<c:out value="${following_list.user_intro}"> </c:out>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div style="height: 100px; width: 65px; float: left;">
						<button type="button" class="Following_del${following_list_status.index }" onclick="getFollowing_del(this.form, this);" id="del" style="width: 100%; padding: 2px 0 2px 0; margin: 50% 0 0 0; border-radius: 20px; font-family: ChosunGu; color: white; border: 0; outline: 0; background-color: #d90000; box-shadow: inset 0px 0px 0 2px white, 0px 3px 0 0 black; cursor: pointer;">
						끊기
						</button>
						<button type="button" class="Following_re${following_list_status.index }" onclick="getFollowing_re(this.form, this);" id="re" style="display: none; width: 100%; padding: 2px 0 2px 0; margin: 50% 0 0 0; border-radius: 20px; font-family: ChosunGu; color: white; border: 0; outline: 0; background-color: #ff6700; box-shadow: inset 0px 0px 0 2px white, 0px 3px 0 0 black; cursor: pointer;">
						팔로우
						</button>
					</div>
				</div>
				</form>
			</c:forEach>
			</div>	
			</div>
			</div>
			
			<!-- 팔로워 팔로잉 위젯 끝 -->
		</div>
		<!-- 프로필 내용 끝 -->
	</div>
	 <!-- 프로필 영역 끝 -->

	<!-- 메인 영역 시작 -->
	<div style="width: 950px; margin: 0 0 0 50px; float: left;">
		<!-- 달력 영역 시작 -->
		<div style="width: 950px; width: 950px; height: 80px; background-color: #C45910; box-shadow: 0 3px 0 0 #886c50;  border-radius: 25px 25px 0 0; overflow: hidden;">
			<div style="width: 950px; height: 70px;">
				<div style="width: 250px; height: 100%; box-sizing:border-box; float: left;">
					<div style="width: 240px; height: 60px; margin: 10px 0 0 10px; box-shadow: inset 0 0 0 2px white; border-radius: 20px; background-color: #7E715B;">
						<div style="font-family: JalnanOTF; font-size: 32px; text-align: center; color: white; padding: 5px 0 0 0;">
						${calendar.get(5).getMonth() }월
						</div>
					</div>
				</div>
				<div style="width: 700px; height: 100%; float: left;">
					<div style="width: 680px; height: 60px; margin: 10px 0 0 10px; border-radius: 20px;">
						<c:forEach var="calendar" items="${calendar }">
							<div style="width: calc(100%/11); height:100%; border-radius: 20px; box-shadow: inset 0 0 0 2px white; background-color: #C45910; float: left;">
							<div style="margin: 6px 0 0 0; width: 100%; height: 40%; text-align: center; font-size: 23px; font-family: ChosunGu; color: white;">
							${calendar.day }
							</div>
							<div style="width: 100%; height: 40%; text-align: center; font-size: 23px; font-family: ChosunGu; color: white;">
							${calendar.week }
							</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div style="width: 950px; box-shadow: 0 3px 0 0 #C45910; overflow: hidden;">
		<div style="width: 968px; height: 300px; background-color: #FAEBD7; overflow-y: scroll; overflow-x: hidden;">
			<c:forEach var="challenges" items="${challenges }">
				<div style="width: 950px; height: 70px;">
					<div style="width: 250px; height: 100%; box-sizing:border-box; float: left;">
						<div style="width: 240px; padding: 18.667px 0 20px 0; font-family: ChosunGu; text-align: center; margin: 10px 0 0 10px; border-radius: 20px; background-color: white;">
							${challenges.chg_title }
						</div>
					</div>
					<div style="width: 700px; height: 100%; float: left;">
						<div style="width: 680px; height: 60px; margin: 10px 0 0 10px; border-radius: 20px; background-color: white; overflow: hidden;">
							<div style="border-radius: 10px; background-color: #916657; width: calc(61.813px * ${challenges.end_day_between}); margin: 15px 0 0 calc(61.813px * (${challenges.start_day_between} + 1) + 30.906px); height: 50%; float: left;"></div>
							<img src="/pys/img/도토리.png" style="width: 50px; left: -30px; position: relative; float: left;">
						</div>
					</div>
				</div>
			</c:forEach>
			<c:if test="${challenges.size() eq 0 }">
				<img src="/pys/img/없다람쥐.png" style="width: 320px; margin: 0 0 0 300px;">
			</c:if>
		</div>
		</div>
		<!-- 달력 영역 끝 -->
		<!-- 포인트 / 차트 영역 시작 -->
		<div style="margin: 50px 0 0 0;">
		<div class="coint_chart_clear" style="width: 100%; clear: both;">
		<!-- 포인트 영역 시작 -->
		<div style="height: 290px; width: 450px; box-shadow: inset 0 0 0 4px #f8d0a7; margin: 0 50px 0 0; float: left;">
			<div style="width: 100%;">
				<div style="margin: 20px 20px 0 20px">
					<form action="mypage_point" style="margin: 0; float: left;">
					<img alt="" src="/pys/img/도토리.png" style="width: 60px;">
					<a style="font-family: JalnanOTF; font-size: 40px; color: #DB9C67;">${points.get(0).getPoint_balance() }</a>
					<a style="font-family: JalnanOTF; font-size: 33px; color: #784331;">열매</a>
					<input type="submit" value="more..." style="font-family: JalnanOTF; font-size: 15px; color: #ADADAD; background-color: white; border: 0; outline: 0; cursor: pointer;">
					<input type="hidden" name="user_id_email" value="${user_model.getUser_id_email()}">
			 		<input type="hidden" name="user_nickname" value="${user_model.getUser_nickname()}">
			 		<input type="hidden" name="user_image" value="${user_model.getUser_image()}">
			 		<input type="hidden" name="page_id_email" value="${userlist_page.get(0).getUser_id_email()}">
					</form>
				</div>
			</div>
			
				<c:forEach var="points" items="${points}" begin="0" end="4">
					<div style="width: 90%; margin: 0 0 0 5%;">
						<div style="width: 70%; font-family: ChosunGu; font-size: 20px; float: left; ">
						- ${points.point_memo}
						</div>
						<div style="width: 30%; font-family: ChosunGu; font-size: 25px; float: left;">
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
		<!-- 포인트 영역 끝 -->
		<!-- 차트 영역 시작 -->
		
		<div style="height: 290px; width: 450px; box-shadow: inset 0 0 0 4px #f8d0a7; float: left;">
			<c:choose>
				<c:when test="${ch_success eq 0 && ch_progress eq 0 && ch_fail eq 0}">
					<img src="/pys/img/없다람쥐.png" style="width: 290px;  margin: 0 0 0 50px;">
				</c:when>
				<c:otherwise>
					<div style="width:250px; height:250px; margin:20px 0 20px 20px; border-radius: 50%; background: conic-gradient(#C55A11 ${ch_success_p_1} ${ch_success_p_2}, #F8CBAD ${ch_progress_p_1} ${ch_progress_p_2}, #7E715B ${ch_fail_p_1} ${ch_fail_2}); float: left;">
					</div>
					<div style="float: left; margin: 120px 0 0 10px;">
					<div style="width: 160px; font-family: ChosunGu; font-size:13px;">
					<div style="width: 10px; height: 10px; margin: 3px 0 0 0; box-shadow: inset 0 0 0 1px black; background-color: white; float: left;">
					<div style="width: 6px; height: 6px; margin: 2px; background-color: #c55a11; background-color: #c55a11;">
					</div>
					</div>
					&nbsp;성공 챌린지 :&nbsp; ${ch_success } 개
					</div>
					<div style="width: 160px; font-family: ChosunGu; font-size:13px;">
					<div style="width: 10px; height: 10px; margin: 3px 0 0 0; box-shadow: inset 0 0 0 1px black; background-color: white; float: left;">
					<div style="width: 6px; height: 6px; margin: 2px; background-color: #c55a11; background-color: #f8cbad;">
					</div>
					</div>
					&nbsp;진행 챌린지 :&nbsp; ${ch_progress } 개
					</div>
					<div style="width: 160px; font-family: ChosunGu; font-size:13px;">
					<div style="width: 10px; height: 10px; margin: 3px 0 0 0; box-shadow: inset 0 0 0 1px black; background-color: white; float: left;">
					<div style="width: 6px; height: 6px; margin: 2px; background-color: #c55a11; background-color: #7e715b;">
					</div>
					</div>
					&nbsp;실패 챌린지 :&nbsp; ${ch_fail } 개
					</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- 차트 영역 끝 -->
		</div>
		</div>
		<!-- 포인트 / 차트 영역 끝 -->
		<!-- 오늘 할 챌린지 목록 시작 -->
		<div style="margin: 50px 0 0 0;">
			<div style="width: 100%;">
				<div class="ins_clear" style="width: 100%; padding: 1px 0 47.500px 0;"> 
					<div>
					<c:forEach var="challenges" items="${challenges}">
						<div style="width: calc(100%/3); height: calc(100%/3 * 1.7); float: left;">
							<div class="ins" style="width: 90%; height: 90%; background-color: white; padding: 1px 0 0 0; box-shadow: 2px 3px 6px 0 grey; margin: 5%;">
								<div style="width: 285px; height: 55px; margin: 10px 0 10px 0;">
								${challenges.chg_title }
								</div>
								<div style="background-size: 100%; background-repeat: no-repeat; background-image: url(upload/mainIMG/${challenges.chg_image}); width: 285px; height: 285px; margin: 10px 0 10px 0;">
								</div>
								<div style="width: 285px; height: 107.522px; margin: 10px 0 10px 0">
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<!-- 오늘 할 챌린지 목록 끝 -->
	</div>
	<!-- 메인 영역 끝 -->
	
	</div>
	
	<div>
	<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
	</div>
	
</body>
</html>