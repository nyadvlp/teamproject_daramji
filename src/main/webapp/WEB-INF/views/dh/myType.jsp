<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<%
	String context = request.getContextPath();
%>
<meta charset="UTF-8">
<title>자신에게 맞는 취향 챌린지 찾기</title>
<script type="text/javascript">
function a1(anum){
	var id = "${id}";
	$.ajax({
		url : '<%=context%>/a1',
		data : {id : id, anum : anum},
		dataType : 'text',
		success : function(data){
			$(".s1").attr("disabled" , "disabled");
			$('#a1').text(data);
			$('#a1').show();
			$('#q2').show();
		}
	});
};

function a2(anum){
	var id = "${id}";
	$.ajax({
		url : '<%=context%>/a2',
		data : {id : id, anum : anum},
		dataType : 'text',
		success : function(data){
			$(".s2").attr("disabled" , "disabled");
			$('#a2').text(data);
			$('#a2').show();
			$('#q3').show();
		}
	});
};	

function a3(anum){
	var id = "${id}";
	$.ajax({
		url : '<%=context%>/a3',
		data : {id : id, anum : anum},
		dataType : 'text',
		success : function(data){
			$(".s3").attr("disabled" , "disabled");
			$('#a3').text(data);
			$('#a3').show();
			$('#q4').show();
		}
	});
};
var str = "";
var str2 = "";
function a41(){
	str = "";
	str2 = "";
	var id = "${id}";
	$.ajax({
		url : '<%=context%>/a41',
		data : {id : id},
		dataType : 'json',
		success : function(data){
			var jsondata = JSON.stringify(data);
			//alert("jsondata->"+jsondata);
			if(jsondata == '[]'){
				str += "추천할 챌린지가 없습니다...<p>";
				$(".s41").attr("disabled" , "disabled");
				$('#answer').show();
				$('#answer').append(str);
				$('#goLogin').show();
			}else{
			str += "<div id='list'>";
			$(data).each(function(){
				str2 = "<div class='list'>제목: <b>"+this.chg_title+"</b><p><img src='upload/mainIMG/"+this.chg_image+"' style='width:130px; height:130px;'><p>"
				+"작성자 : <sapn><b>"+this.master_nickname+"</b></span><p></div>";
				str += str2;
			});
			str += "</div>";
		$(".s41").attr("disabled" , "disabled");
		$('#answer').show();
		$('#answer').append(str);
		$('#goLogin').show();
			}
		}
	});
};
function a42(){
	$(".s41").attr("disabled" , "disabled");
	$('#goLogin').show();
};
setTimeout(function () {
	$('#ask1').show();
},1000);
setTimeout(function () {
	$('#ask2').show();
},2000);
setTimeout(function () {
	$('#q1').show();
	$('#click').show();
},3000);
</script>
<style type="text/css">
@font-face {
	font-family: 'yg-jalnan';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'ChosunGu';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
	#q1{display: none;}
	#q2{display: none;}
	#q3{display: none;}
	#q4{display: none;}
	#ask1{display: none;}
	#ask2{display: none;}
	#goLogin{display: none;}
	#answer{display: none;}
	#click{display: none;}
	.a{display: none;}
	.list{display: inline-block;}
body{
	width: 1900px;
}
	/* 스크롤바 */
body::-webkit-scrollbar{width: 16px;}
body::-webkit-scrollbar-track {background-color:#f1f1f1;}
body::-webkit-scrollbar-thumb {background-color:#D8E4A9; border-radius: 10px;}
body::-webkit-scrollbar-thumb:hover {background:#555;}
body::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {width:16px;height:16px;background:#D8E4A9;}

.myQ::-webkit-scrollbar{width: 16px;}
.myQ::-webkit-scrollbar-track {background-color:#f1f1f1;}
.myQ::-webkit-scrollbar-thumb {background-color:#D8E4A9; border-radius: 10px;}
.myQ::-webkit-scrollbar-thumb:hover {background:#555;}
.myQ::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {width:16px;height:16px;background:#D8E4A9;}
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
	font-family: 'yg-jalnan';
	display: inline-block; 
	text-align: left;
	line-height: 70px;
	float: left;
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
.myQ{
font-family: 'ChosunGu';
width: 40%;
height: 600px;
padding-top: 10px;
border: 5px solid #9E8173;
border-radius: 10px;
overflow: auto;
position: absolute;
left: 30%;
top: 20%;
}
/* 질문 말풍선 */
.q
{
position: relative;
width: 280px;
height: 190px;
padding: 0px;
background: #FBE5D6;
-webkit-border-radius: 10px;
-moz-border-radius: 10px;
border-radius: 10px;
margin-left: 30px;
margin-bottom: 30px;
padding-top: 10px;
padding-left: 30px;
}

.q:after
{
content: '';
position: absolute;
border-style: solid;
border-width: 15px 15px 15px 0;
border-color: transparent #FBE5D6;
display: block;
width: 0;
z-index: 1;
left: -15px;
top: 46px;
}
.q1
{
position: relative;
width: 280px;
height: 120px;
padding: 0px;
background: #FBE5D6;
-webkit-border-radius: 10px;
-moz-border-radius: 10px;
border-radius: 10px;
margin-left: 30px;
margin-bottom: 30px;
padding-top: 10px;
padding-left: 30px;
}

.q1:after
{
content: '';
position: absolute;
border-style: solid;
border-width: 15px 15px 15px 0;
border-color: transparent #FBE5D6;
display: block;
width: 0;
z-index: 1;
left: -15px;
top: 46px;
}
.q2
{
position: relative;
width: 550px;
height: 190px;
padding: 0px;
background: #FBE5D6;
-webkit-border-radius: 10px;
-moz-border-radius: 10px;
border-radius: 10px;
margin-left: 30px;
margin-bottom: 30px;
padding-top: 10px;
padding-left: 30px;
}

.q2:after
{
content: '';
position: absolute;
border-style: solid;
border-width: 15px 15px 15px 0;
border-color: transparent #FBE5D6;
display: block;
width: 0;
z-index: 1;
left: -15px;
top: 46px;
}

.first
{
position: relative;
width: 170px;
height: 50px;
padding: 0px;
background: #FBE5D6;
-webkit-border-radius: 10px;
-moz-border-radius: 10px;
border-radius: 10px;
margin-left: 30px;
padding-top: 10px;
padding-right: 10px;
padding-left: 10px;
}

.first:after
{
content: '';
position: absolute;
border-style: solid;
border-width: 10px 10px 10px 0;
border-color: transparent #FBE5D6;
display: block;
width: 0;
z-index: 1;
left: -10px;
top: 20px;
}
.list{
	font-size : 10;
	margin-right: 30px; 
}
/* 응답 말풍선 */
.a
{
text-align : right;
float:right;
position: relative;
width: 130px;
height: 30px;
padding: 0px;
background: #DB9C67;
-webkit-border-radius: 10px;
-moz-border-radius: 10px;
border-radius: 10px;
margin-right: 30px;
padding-top: 10px;
padding-right: 10px;
}

.a:after
{
content: '';
position: absolute;
border-style: solid;
border-width: 10px 0 10px 10px;
border-color: transparent #DB9C67;
display: block;
width: 0;
z-index: 1;
right: -10px;
top: 10px;
}
.step{
font-family: 'yg-jalnan';
display: inline-block;
width: 90px;
height: 40px;
margin-top: 30px;
margin-left: 30px;
padding-top: 10px;
}
#step12{
width : 98%;
font-family: 'yg-jalnan';
display: inline-block;
text-align: center;
}

</style>
</head>
		<!-- 상단바 -->
<div class="menuBarDa">
		<div style="text-align: center;">
			<div id="menuLeftDa" style="width: 700px;">
			할수있다람쥐<img src="../jy/img/dotori.png" id="imgDoDa">
			</div>
		</div>
</div>
<!-- STEP 1,2 -->
<div id="step12">
<div class="step" style="background-color: #BFBFBF; border-radius: 5px; color: white;">STEP 1</div> <div class="step" style="background-color: #DB9C67; border-radius: 5px; color: white;">STEP 2</div>
</div>
<div class="myQ">
<div>
	<div id="ask1" class="first">
		회원가입을 해주셔서<br>
		감사합니다.
	</div>
</div>	
<div style="margin-top: 30px;"	>
	<div id="ask2" class="first">
		이제 원하시는 카테고리를<br> 
		입력해 주시면 됩니다.
	</div>
</div>	
	<div id="q1" style="margin-top: 30px;">
	<div class="q">
	<b>${id }</b>님 반갑습니다~~<p>
	어떤 챌린지를 찾으시나요??<p>
	<c:forEach var="list1" items="${list }" varStatus="status">
		<c:if test="${list1.q_cnum == 1 }">
			<input type="button" value="${list1.chat_subject}" class="s1"  onclick="a1('${list1.a_cnum }');" style="font-family:'ChosunGu'; background: #C55A11; border: #C55A11; width: 120px; height:25px; margin: 5px; color: white;">
		</c:if>
	</c:forEach>
	</div>
	</div>
	<div style="height: 80px; ">
	<span id="a1" class="a"></span><p>
	</div>
	<div id="q2" class="q">
	<b>${id }</b>님의  주 활동시간은<br> 언제인가요??<p>
	<c:forEach var="list2" items="${list }">
		<c:if test="${list2.q_cnum == 2 }">
		<button class="s2" onclick="a2('${list2.a_cnum }');" style="font-family:'ChosunGu'; background: #C55A11; border: #C55A11; width: 120px; height:25px; margin: 5px; color: white;">${list2.chat_subject}</button>
		</c:if>
	</c:forEach>
	</div>
	<div style="height: 80px; ">
	<span id="a2" class="a"></span><p>
	</div>	
	<div id="q3" class="q">
	<b>${id }</b>님의 원하시는 활동기간을 선택해주세요<p>
	<c:forEach var="list3" items="${list }">
		<c:if test="${list3.q_cnum == 3 }">
		<button class="s3" onclick="a3('${list3.a_cnum }');" style="font-family:'ChosunGu'; background: #C55A11; border: #C55A11; width: 120px; height:25px; margin: 5px; color: white;">${list3.chat_subject}</button>		
		</c:if>
	</c:forEach>
	</div>
	<div style="height: 80px; ">
	<span id="a3" class="a"></span><p>
	</div>
	<div id="q4" class="q1">
		<b>${id }</b>님의 추천 챌린지를<br> 가져와봤습니다.<p>
		확인해 보시겠습니까??<p>
		<button class="s41" onclick="a41();" style="font-family:'ChosunGu'; background: #9E8173; border: #9E8173; border-radius: 5px; width: 60px; height:30px; color: white;">예</button>
		<button class="s41" onclick="a42();" style="font-family:'ChosunGu'; background: white; border: 1px solid  #9E8173; border-radius: 5px; width: 60px; height:30px; color: black;">아니오</button>
	</div>
	<div id="answer" class="q2">
	</div>
	<div id="goLogin" class="q1">
		수고하셨습니다<p>
		이제 로그인을 하러 가볼까요??<p>
		<button onclick="location.href='login'" style="font-family:'ChosunGu'; background: #9E8173; border: #9E8173; border-radius: 5px; width: 60px; height:30px; color: white;">LOGIN</button>
	</div>
	<div id="click" style="font-size:25; text-align:center; margin-left:80px; margin-bottom:10px; padding-top:25px; bottom: 0px; width: 80%; height: 50px; background: #9E8173; border-radius: 10px; color: white;">
		원하시는 질문을 클릭해 주세요
	</div>
</div>
<div style="position: absolute; bottom: 0px; width: 99%; height: 130px;">
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>
</body>
</html>