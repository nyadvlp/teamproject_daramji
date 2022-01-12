<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
    
        <%
	String context = request.getContextPath();
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
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
							$("#Following_scroll").load(" #Following_scroll > *");
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
	 
	 <div>
	 어쩌고
	 </div>
	 
	 </div>
	 
	<div>
	<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
	</div>
</body>
</html>