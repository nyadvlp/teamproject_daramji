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
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.confirmBody {
	width: 1000px;
	display: inline-block;
	margin-left: 300px;
	vertical-align: top;
	text-align: center;
}

.tagTextbox {
	border: none;
	margin-right: 5px;
	background: #9f6e54;
	border-radius: 13px;
	width: 70px;
	height: 25px;
	box-sizing: border-box;
	outline: none;
	font-family: ChosunGu;
	font-size: 12px;
	color: white;
	text-align: center;
}


.makeChalTitleFont {
	display: inline-block;
	vertical-align: baseline;
	font-size: 30px;
	font-family: 'JalnanOTF';
	font-color: #daa35b;
}

.makeChalSubtitleFont {
	display: inline-block;
	vertical-align: baseline;
	font-size: 20px;
	font-family: 'JalnanOTF';
	font-color: #daa35b;
}

.makeChalContentFont {
	display: inline-block;
	vertical-align: baseline;
	font-size: 13px;
	font-family: 'ChosunGu';
	font-color: #daa35b;
}

table {
	border: 1px solid #ebd39f;
	font-size: 12pt;
	font-family: 'ChosunGu';
	vertical-align: top;
	margin: auto;
	padding: 3px;
	text-algin: center;
}

.confirmForm {
	margin-top: 50px;
	text-align: center;
}

.button_by {
	width: 70px;
	height: 25px;
	background-color: #daa35b;
	border: none;
	border-radius: 3px;
	color: #fff;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px;
	cursor: pointer;
	font-family: 'ChosunGu';
}
</style>
</head>
<body>
	<div style="height: 70px; margin: 0 0 15px 0;">
	<jsp:include page="/WEB-INF/views/teamtwo/header.jsp">
		<jsp:param name="user_id_email" value="${user_id_email}"/>
	</jsp:include>
	</div>


	<div class="confirmBody">
		챌린지정보 담긴 객체명 : userchallenge <br /> 유저정보 담긴 객체명 : userinfo <br /> <br />
		
		
		<br /> <span
			style="font-size: 30px; color: gray; font-family: JalnanOTF;">아래와
			같이 개설하시겠어요?</span>


		<div class="confirmForm">
			<form name="registerChalForm"
				action="registerChal?user_id_email=${userinfo.user_id_email }"
				method="post">

				<!-- 챌린지 정보 hidden으로 보내기  -->
				<input type="hidden" name="chg_num" value="99999"> <input
					type="hidden" name="lc_num" value="${userchallenge.lc_num}">
				<input type="hidden" name="mc_num" value="${userchallenge.mc_num}">
				<input type="hidden" name="sc_num" value="${userchallenge.sc_num}">
				<input type="hidden" name="chg_master"
					value="${userinfo.user_id_email}"> <input type="hidden"
					name="master_nickname" value="${userinfo.user_nickname}"> <input
					type="hidden" name="chg_regdate" value="2021-01-01"> <input
					type="hidden" name="chg_startdate" value="2021-02-01"> <input
					type="hidden" name="chg_enddate" value="2021-03-01"> <input
					type="hidden" name="chg_capacity"
					value="${userchallenge.chg_capacity}"> <input type="hidden"
					name="chg_title" value="${userchallenge.chg_title}"> <input
					type="hidden" name="chg_contents"
					value="${userchallenge.chg_contents}"> <input type="hidden"
					name="chg_image" value="${userchallenge.chg_image}"> <input
					type="hidden" name="chg_like_count" value="0"> <input
					type="hidden" name="chg_state" value="1"> <input
					type="hidden" name="chg_sample_image"
					value="${userchallenge.chg_sample_image}"> <input
					type="hidden" name="chg_sample_text"
					value="${userchallenge.chg_sample_text}"> <input
					type="hidden" name="chg_now_parti" value="0"> <input
					type="hidden" name="chg_confirm_time" value="보류">
					<input type="hidden" name="q_cnum_1" value="${q_cnum_1 }">
					<input type="hidden" name="q_cnum_2" value="${q_cnum_2 }">
					<input type="hidden" name="hash1" value="${hash1 }">
					<input type="hidden" name="hash2" value="${hash2 }">
					<input type="hidden" name="hash3" value="${hash3 }">



				<div class="titleAndInfo">
					<span
						style="font-size: 20px; color: #9f6e54; font-family: JalnanOTF;">"${userchallenge.chg_title }"</span><br />
					<br /> <b class="makeChalContentFont">
						챌린지 시작일은 ${userchallenge.chg_startdate } 입니다!
						<br/>
					</b>


				</div>

				<br /> <br />

				<table>
					<tr height="30px">
						<td width="40px"><img src="ban/img/team.png" width="25px"></td>
						<td width="100px">모집정원</td>
						<td>${userchallenge.chg_capacity }</td>
					</tr>
					<tr height="30px">
						<td><img src="ban/img/list.png" width="25px"></td>
						<td width="100px">챌린지 분류</td>
						<td>${userchallenge.lc_num}>>${userchallenge.mc_num}>>
							${userchallenge.sc_num}</td>
					</tr>
					
										<tr height="30px">
						<td><img src="ban/img/idea.png" width="25px"></td>
						<td width="100px">챌린지 성격</td>
						<td>q1답: ${q_cnum_1 } // q2답: ${q_cnum_2 } </td>
					</tr>
					
					<tr height="30px">
						<td><img src="ban/img/calendar.png" width="25px"></td>
						<td width="100px">챌린지 기간</td>
						<td>${userchallenge.chg_startdate }부터
							${userchallenge.chg_enddate } 까지</td>
					</tr>
					<tr height="30px">
					<td><img src="ban/img/hashtag.png" width="25px"></td>
					<td width="100px">해시태그</td>
					<td>
					<input type="text" class="tagTextbox" value="${hash1 }" readonly>
					<input type="text" class="tagTextbox" value="${hash2 }" readonly>
					<input type="text" class="tagTextbox" value="${hash3 }" readonly>
					</td>
					</tr>

				</table>
				<br />
				<br /> <input type="button" value="메인으로 돌아가기"> <input
					type="submit" value="등록">

			</form>
		</div>
	</div>
	
	<div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>
</body>
</html>