
<%@page import="com.oracle.teamTwo.teamtwo.model.User_info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐</title>
<link rel="icon" href="../jy/img/dotori.png">

<style>
@font-face {
    font-family: 'yg-jalnan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'ChosunGu';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'JalnanOTF';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
 @font-face{
      font-family: 'S-CoreDream-3Light';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
     font-weight: normal;
     font-style: normal;
 }

body {margin: 0px auto; 
	  padding: 0px;
      }

      
/* 스크롤바 */
body::-webkit-scrollbar{width: 16px;}
body::-webkit-scrollbar-track {background-color:#f1f1f1;}
body::-webkit-scrollbar-thumb {background-color:#D8E4A9; border-radius: 10px;}
body::-webkit-scrollbar-thumb:hover {background:#555;}
body::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {width:16px;height:16px;background:#D8E4A9;}

/* @media screen and (max-width: 1600px) {
	body {
		overflow-x : hidden; 
	}
} */

.menuBarDa {
	background-color: #9E8173;
	width: 100%;
	height: 70px;
	line-height: 70px;
	border-radius: 0px 0px 50px 50px;
	text-align: center;
	z-index: 99999;
}

@media screen and (max-width: 1600px) {
	.menuBarDa {
		background-color: #9E8173;
		width: 1600px;
		height: 70px;
		line-height: 70px;
		border-radius: 0px 0px 50px 50px;
		text-align: center;
		z-index: 99999;
	}
}

#menuLeftDa{
	display: inline-block; 
	text-align: center;
	line-height: 70px;
	float: left;
}

#menuRightDa{
	display: inline-block; 
	text-align: center;
	line-height: 70px;
	float: right;
}

#profileNameDa{
	font-family: 'yg-jalnan'; 
	font-size:20px; 
	color:#F8CBAD; 
	text-decoration: none;
}

.fixDa {
	position: fixed;
	top: 0px;
}

#canDa{
	font-family: 'yg-jalnan';
	font-size: 28px;
	color:#40312E;
	text-decoration: none;
	margin-left: 50px;
	line-height: 70px;
	}
	
#imgDoDa{
	width: 28px;
    height: 30px;
    vertical-align: middle;
    margin-bottom: 4px;
}

#imgProfileDa{
	width: 30px;
    height: 30px;
    vertical-align: middle;
    margin-bottom: 4px;
}

.listDa{
	font-family: 'ChosunGu';
	font-size:18px;
	color:white;
	text-decoration: none;
	margin-left: 20px;
	background-color: #ffffff00;
	outline: 0;
	border: 0;
	cursor: pointer;
}

.listDa:hover{
	color: black;
}

.nickDa{
	display: inline-block;
    vertical-align: baseline; 
    font-size: 52px;
    font-family: 'yg-jalnan';
}

.nickDa1{
	display: inline-block;
    vertical-align: baseline; 
    font-size: 30px;
    font-family: 'ChosunGu';
}

.helloDa{
	display: inline-block;
    vertical-align: bottom;
    font-size: 30px;
    width: 700px;
    height: 47px;
    margin-bottom: 20px;
}

/* footer */


</style>

<script>
      $( document ).ready( function() {
        var jbOffset = $( '.menuBarDa' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.menuBarDa' ).addClass( 'fixDa' );
          }
          else {
            $( '.menuBarDa' ).removeClass( 'fixDa' );
          }
        });
      } );
    </script>
</head>
<body>

 	<div class="menuBarDa">
		<div style="text-align: center;">
			<div id="menuLeftDa" style="width: 700px;">
			<form action="main">
			<button id="canDa" style="cursor: pointer; float: left; border: 0; outline: 0; background-color: #ffffff00;">
			할수있다람쥐<img src="../jy/img/dotori.png" id="imgDoDa">
			</button>
			<input type="hidden" name="user_id_email" value="${user_id_email}">
			</form>
				<div style="float: right; position: relative; top: 8px;">
					<div style="float: left;">
					<form action="makechallenge" style="margin: 0;">
					<button class="listDa">챌린지등록</button>
					</form>
					</div>
					<div style="float: left;">
					<form action="community" style="margin: 0;">
					<button class="listDa">커뮤니티</button>
					</form>
					</div>
					<div style="float: left;">
					<button class="listDa">랭킹</button>
					</div>
					<div style="float: left;">
					<button class="listDa">오픈채팅방</button>
					</div>
				</div>
			</div>
		</div>
		<div id="menuRightDa">
			<div style="float: left; top: 18px; left: -20px; position: relative;">
			<form action="mypage">
			<button style="cursor: pointer; float: left; border: 0; outline: 0; background-color: #ffffff00;" id="profileNameDa">
			<img style="border-radius: 50%;" src="upload/profileIMG/${user_image}" id="imgProfileDa">
			${user_nickname}
			</button>
			<button style="cursor: pointer; float: left; border: 0; outline: 0; background-color: #ffffff00; font-family: 'yg-jalnan'; font-size:20px; display: inline-block; text-align: right; color:#40312E;">
			님
			</button>
			<input type="hidden" name="user_id_email" value="${user_id_email}">
			<input type="hidden" name="page_id_email" value="${user_id_email}">
			</form>
			</div>
		</div>
		</div>
		<div style="height: 15px; width: 100%;">
		</div>
</body>
</html>