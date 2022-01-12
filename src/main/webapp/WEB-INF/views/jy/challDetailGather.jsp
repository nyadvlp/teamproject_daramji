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

<link rel="stylesheet" type="text/css" href="km/css/kmStarRating.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">

<!-- CSS -->
<style type="text/css">
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

.out{margin: 0 auto; 
     width: 1200px;}

/* 경민 소통하기 CSS 시작 */
.chattr {
	height: 100px;
}

#chatBox {
	margin: 0 auto;
	width: 600px;
	height: 700px;
}

#chatScroll {
	margin: 0 auto;
	width: 650px;
	height: 700px;
}

#ProfScroll{
	margin: 0 auto;
	width: 1105px;
	height: 150px;
	overflow-x:auto; 
	margin-left: 65px;
}
/* 스크롤바 */
#ProfScroll::-webkit-scrollbar{width: 16px;}
#ProfScroll::-webkit-scrollbar-track {background-color:#f1f1f1;}
#ProfScroll::-webkit-scrollbar-thumb {background-color:#D8E4A9;border-radius: 10px;}
#ProfScroll::-webkit-scrollbar-thumb:hover {background: #555;}
#ProfScroll::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {
width:16px;height:16px;background:#D8E4A9;}

#chatScroll::-webkit-scrollbar{width: 16px;}
#chatScroll::-webkit-scrollbar-track {background-color:#f1f1f1;}
#chatScroll::-webkit-scrollbar-thumb {background-color:#D8E4A9;border-radius: 10px;}
#chatScroll::-webkit-scrollbar-thumb:hover {background: #555;}
#chatScroll::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {
width:16px;height:16px;background:#D8E4A9;}


.chatForm_others {
	margin: 0 auto;
	float: left;
}

.chatForm_mine {
	margin: 0 auto;
	float: right;
}

.chatUser_image {
	width: 70px;
	height: 70px;
	border-radius: 35px;
	float: left;
	vertical-align: bottom;
	display: inline-block;
	margin-right: 20px;
}

.nickname {
	font-family: 'yg-jalnan';
	font-size: 15px;
}

.text {
	font-family: 'ChosunGu';
	font-size: 15px;
	line-height: 50px;
	background-color: #fcf0c9;
	border-radius: 5px;
	display: inline-block;
}

.text_mine {
	font-family: 'ChosunGu';
	font-size: 15px;
	line-height: 50px;
	background-color: #fcf0c9;
	border-radius: 5px;
	float: right;
}

.time {
	font-family: 'ChosunGu';
	font-size: 10px;
	display: inline-block;
	position: relative;
	top: 13px;
	height: 10px;
	width: 50px;
}

.time_mine {
	font-family: 'ChosunGu';
	font-size: 10px;
	position: relative;
	top: 13px;
	height: 10px;
	width: 50px;
}

.chatWriteForm	{
	margin: 0 auto;
	width: 700px;
	height: 700px;
}

#msg {
	width: 80%;
	height: 32px;
	border-radius: 8px;
}

#send {
	width: 16%;
	height: 34px;
	border-radius: 50px;
	background: black;
	color: white;
} /* 경민 소통하기 CSS 끝 */

/* 경민 후기 CSS 시작 */
.reviewWriteForm{
   margin: 0 auto;
   width: 600px;
   height: 700px;
}

#reviewBox {
   margin: 0 auto;
   width: 600px;
   height: 700px;
}

#reviewScroll {
   margin: 0 auto;
   width: 650px;
   height: 700px;
}

.reviewForm_others {
   margin: 0 auto;
   float: left;
}

.reviewUser_image {
   width: 70px;
   height: 70px;
   border-radius: 35px;
   float: left;
   vertical-align: bottom;
   display: inline-block;
   margin-right: 20px;
}

.reviewText {
   font-family: 'ChosunGu';
   font-size: 15px;
   line-height: 50px;
   background-color: #fcf0c9;
   border-radius: 5px;
   display: inline-block;
}

.reviewWriteForm {
   margin: 0 auto;
   width: 700px;
   height: 700px;
}

#send {
   width: 16%;
   height: 34px;
   border-radius: 50px;
   background: #4d9549;
   color: white;
   font-family: 'ChosunGu';
   font-size: 15px;
   font-style: bold;
}

.checked {
   color: orange;
}

.fa-star{
   color : #ffe400;
}
/* 경민 후기 CSS 끝 */

/* 지예 CSS 시작*/

table,tr,td{
	border-radius: 10px;
}
.Jalnan { margin-left: 65px; 
	  	  font-family: 'yg-jalnan';}

.ChosunGu { margin-left: 65px; 
		    font-family: 'ChosunGu';}

.status { margin-left: 65px; 
		  font-family: 'ChosunGu';
		  font-size:20px; 
		  background-color:#5B874A; 
		  border-radius:5px; 
		  width:80px; 
		  line-height:30px; 
		  color:white; 
		  text-align:center;
		  display:inline-block;}
	  
.tag { 	  margin-left: 65px; 
		  font-family: 'ChosunGu';
		  font-size:15px; 
		  font-weight:bold;
		  background-color:#4d9549; 
		  border-radius:5px; 
		  width:90px; 
		  line-height:30px; 
		  color:white; 
		  text-align:center;
		  display:inline-block;}

.hashtag {margin-left: 5px; 
		  font-family: 'ChosunGu';
		  font-size:15px; 
		  font-weight:bold;
		  background-color:#D8E4A9; 
		  border-radius:5px; 
		  width:100px; 
		  line-height:30px; 
		  color:#4d593e; 
		  text-align:center;
		  display:inline-block;}
	  
hr {	margin-left: 65px;
		border-bottom:0px;
		width:92%;
		border-top: 1px solid #BFBFBF;}

.info {margin-left: 65px;
	   background-color: #F2F2F2;
	   font-family: 'ChosunGu';
	   font-weight:bold;
	   width:92%;
	  }

.infotitle { font-size: 14px;
			 width: 150px;
			 height: 20px;
}

.infotext { font-size: 14px;
			color:#4d593e;
}

.join {margin-left: 515px;
	  font-family: 'yg-jalnan';
	  font-size:20px; 
	  background-color:#D8E4A9; 
	  border-radius:5px; 
	  width:170px; 
	  line-height:40px; 
	  color:#4d593e; 
	  text-align:center;
	  margin-bottom: 10px;}
	  
.part {font-family: 'ChosunGu';
	   display:inline-block;
	   font-weight: bold;
	   font-size: 20px;
	   margin-bottom: 18px;
	   }

.totpart{font-family: 'yg-jalnan';
		 display:inline-block;
		 color:#5B874A;
		 font-size:40px;
		 vertical-align: bottom;
		 }

.agree{font-family: 'yg-jalnan'; 
	   font-size: 18px; 
	   background-color: #D8E4A9;
	   border: 0;
	   border-radius: 5px;
	   width:70px;
	   line-height: 30px;
	   margin: 5px;}

.td1part {font-family: 'yg-jalnan';
		 font-size: 20px;
		 background-color: #FFEACD;
		 color:#515543;
		 line-height: 40px;
		 width: 300px;}

.td2part {font-family: 'ChosunGu';
		 font-size: 16px;
		 font-weight: bold;
		 color:#515543;
		 line-height: 30px;
		 }

.td2_1part {font-family: 'ChosunGu';
		 font-size: 16px;
		 font-weight: bold;
		 color:#515543;
		 line-height: 30px;
		 text-align: center;
		 }

.td2_2part {font-family: 'ChosunGu';
		 font-size: 16px;
		 font-weight: bold;
		 color:#515543;
		 line-height: 30px;
		 }

.td3part {font-family: 'yg-jalnan';
		 font-size: 18px;
		 color:#9E6D5A;
		 line-height: 40px;}

.tdDotori {font-family: 'yg-jalnan';
		 font-size: 20px;
		 background-color: white;
		 color:#515543;
		 line-height: 40px;
		 width: 200px;
		 border-radius: 5px;
		 margin: 5px;}

.chgMenuList{ 
		font-family: 'ChosunGu';
    	font-size: 16px;
    	color: white;
    	margin-left: 50px;
    	text-decoration: none;
}


</style>

<!-- 자바 스크립트 -->
<script type="text/javascript">
	
	//-- 경민 소통하기 스크립트 시작 --//
	/* 채팅스크롤바 */
	$('#chatScroll').scrollTop($('#chatScroll').prop('scrollHeight'));
	
	//-- 지예 시작 --//
	/* 신청 동의서 */
	function agreeChk(warning) {
		if(warning.chkButton.disabled==true) {
			warning.chkButton.disabled=false
		}else {
			warning.chkButton.disabled=true
		}
	}
	
	$(function () {
		$("#joinChallButton").click(function (e) {
			$("#joinChall").show();
			
		});
	});
	
	/* Chg_State별 화면구현 */
 	$(function () {
		var chg_state = "${chg_state}";
		var id = "${id}";
		var masterid = "${masterid}"; //챌주아이디
		var myChgState = "${myChgState}"; //나의 이 챌린지참여여부 (참여 0, 미참여 1)
		
		/* 모집중 */
		if(chg_state == 1) {
			$("#joinChall").hide();
			$("#reviewButton").hide();
			$("#todayRandom").hide();
			$("#dotoriBar").hide();
			
			if(myChgState == 1 || id === masterid) {
				$("#joinChallButton").hide();
			} 
	
			
		 /* 모집마감 */	
		}else if(chg_state == 2) {
			
			$("#joinChall").hide();
			$("#reviewButton").hide();
			$("#todayRandom").hide();
			$("#dotoriBar").hide();
			$('#joinChallButton').hide();
		
		 /* 진행중 */
		}else if(chg_state == 3) {
			$("#joinChall").hide();
			$("#joinChallButton").hide();
			$("#reviewButton").hide();
		
			if(myChgState == 0) {
				$("#dotoriBar").hide();
			}
		
		 /* 챌린지 종료 */
		}else if(chg_state == 4) {
			$("#joinChall").hide();
			$("#todayRandom").hide();	
			$('#joinChallButton').hide();
			
			if(myChgState == 0) {
				$("#dotoriBar").hide();
			}
		  
		  /* 모집인원 미달 */
		} else if(chg_state == 5) {
			$("#joinChall").hide();
			$("#todayRandom").hide();	
			$('#joinChallButton').hide();
			$("#dotoriBar").hide();
			$("#reviewButton").hide();
		
		  /* 강제종료 */	
		} else if(chg_state == -1) {
			alert("강제종료된 챌린지입니다. 리스트로 돌아갑니다.");
		
		} else {
			alert("해당하는 state가 없습니다.")
		}
	}); 
 	
	
	// D-DAY 계산하기 
	$(function () {
		
		var chg_num = "${chg_num}";
		
		var chg_regdate ="";
		var chg_startdate ="";
		var chg_enddate ="";
		var chg_capacity ="";
		var chg_now_parti ="";
		
		$.ajax({
	         url:"<%=context%>/challTimeChk",
	         data : {
	               chg_num : chg_num, //보낼변수
	         },
	         dataType : 'json', /* json(리스트) text(값1개) xml */
	         success : function(data) {
	        	 var jsondata = JSON.stringify(data); 
	        	 
	        	 //쪼개기
	        	 $(data).each(
	        		function(){
	        			chg_regdate = this.chg_regdate; //등록일
	        			chg_startdate = this.chg_startdate; //시작일
	        			chg_enddate = this.chg_enddate; //종료일
	        			chg_capacity = this.chg_capacity; //참여정원
	        			chg_now_parti = this.chg_now_parti; //현재참여인원
	        			
	        		}		 
	        	 );
	   
	    //현재시간가져오기 = sysdate와 동일  	 
	    var now = new Date().getTime(); 
	   
       	//시간을 Date형식으로 바꿔서 저장 ([계산가능]디데이 계산용.. 비교는 불가.. 정확히 말하자면 '==' 비교 불가..)
        var d_startdate = new Date(chg_startdate); //시작일
        var d_enddate = new Date(chg_enddate); //종료일
       	var d_now = new Date(now); //오늘
       	
       		        	        	
    	//String형식으로 변경!([비교가능]Date형식을 그냥 사용하면 비교할 수 없다.. slice로 String 날짜만 자른다 (계산은 안되지만 비교는 가능하다..ㅎㅋ))
       	var str_regdate = new Date(chg_regdate).toISOString().slice(0,10); //등록일
       	var str_startdate = new Date(chg_startdate).toISOString().slice(0,10); //시작일
       	var str_enddate = new Date(chg_enddate).toISOString().slice(0,10); //종료일
       	var str_now = new Date(now).toISOString().slice(0,10); //오늘
     

        /* 디데이 구분 로직 */
         if(str_regdate <= str_now){ //등록일
	     	
	      	   	if(str_startdate < str_now){ //시작일
	      	   	
	           		 if(str_enddate < str_now){ //종료일
	           				$('#challState').append("챌린지종료");
	          		  } else{
		          			var distance = d_now - d_startdate; //진행중
		    	        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
	          				$('#challState').append("진행중 D+"+(days+1));
	        				}
	      	   					
	        	}else if (str_startdate == str_now){
	        		if(chg_now_parti < 5) { //현재인원 5명보다 작으면..
	      				$('#challState').append("인원미달종료");
	        		}else{
	        			$('#challState').append("D-DAY");
	        		}
	      			 
	      		}else{
	      			if(chg_capacity <= chg_now_parti) { //정원,현재인원 비교
	      				$('#challState').append("인원마감");
	      			}else{
			      		var distance = d_now - d_startdate; //모집중
			        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
			      		$('#challState').append("모집중 D"+days);
		      		}
	       	  	}
         } //디데이 구분로직 끝
         
         
        /* 신청서에 기입될 총 챌린지 기간  */
        var distance = d_enddate - d_startdate; //챌린지 기간
     	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
			$('#totDate').append(str_startdate+" ~ "+str_enddate+" (총 "+(days+1)+"일)");
         
	        	
     	
	    }  
	 });
   });
	


	// 배팅관련
	$(document).ready(function() {
		
		/* 문자가 들어간 경우 */
        $("#batt").on("keyup", function() {
           $(this).val($(this).val().replace(/[^0-9]/g, ""));
           
        });
        

    	 $("#batt").on("change", function() {
             var dotori = parseInt($(this).val()); //내가 입력한 도토리
             var haveDotori = parseInt(document.getElementById('point_balance').value); //내가 보유한 열매
             var imgDotori ="<img src='../jy/img/dotori.png' style='width:20px; height: 22px; vertical-align: bottom; margin-bottom: 10px;'>"
           
             
          if (dotori > haveDotori) {
            	
        		 /* 보유열매 이상으로 입력시 최대 보유열매로 바꿔주면서 10의 단위로 넣어주기 */
            	 haveDotori = Math.floor(haveDotori/10)*10;
            	 $(this).val(haveDotori); 
            	 $("#battAfter").empty(); //이전 기록 비우기
            	 $('#battAfter').append(imgDotori+" "+(haveDotori-haveDotori)+" 열매");
            	 
            	 var dotori100 = haveDotori+(haveDotori*0.5);
	           	 var dotori85up = haveDotori;
	             var dotori85down = haveDotori*0.5;
	             
	             /* 콤마찍기 */ 
	             dotori100 = dotori100.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	           	 dotori85up = dotori85up.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	             dotori85down = dotori85down.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            	 
            	 $("#100").empty(); $('#100').append(dotori100+" 열매");
        	     $("#85up").empty(); $('#85up').append(dotori85up+" 열매");
        	     $("#85down").empty(); $('#85down').append(dotori85down+" 열매");
            	 	 
             }  else {
            	 
            	 /* 10의 단위로 바꿔주기 */
	             dotori = Math.floor(dotori/10)*10;
	             $(this).val(dotori); 
	             $("#battAfter").empty();//이전 기록 비우기 
	             
	             var remainDotori = haveDotori-dotori;
	             remainDotori = remainDotori.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	     		 $('#battAfter').append(imgDotori+" "+(remainDotori)+" 열매");
	     	
	    		
	             var dotori100 = dotori+(dotori*0.5);
	           	 var dotori85up = dotori;
	             var dotori85down = dotori*0.5;
	             
	             /* 콤마찍기 */ 
	             dotori100 = dotori100.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	           	 dotori85up = dotori85up.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	             dotori85down = dotori85down.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	             
	             
	             $("#100").empty(); $('#100').append(dotori100+" 열매");
        	     $("#85up").empty(); $('#85up').append(dotori85up+" 열매");
        	     $("#85down").empty(); $('#85down').append(dotori85down+" 열매");
             }  
             
          });

     });
	
	/* 배팅 포인트 체크*/
	function battChk() {
		var value = parseInt($("#batt").val());
		
			if(0 < value) {
				
				 $('#point_minus').val(value); //input 태그에 value값 넣기.
				 $('#batting_point').val(value);
				  
		
				 var chg_startdate = document.getElementById('chg_startdate').value;
				 var chg_enddate = document.getElementById('chg_enddate').value;
				 chg_startdate = new Date(chg_startdate);
				 chg_enddate = new Date(chg_enddate);
				 var days = chg_enddate-chg_startdate;
				 days = Math.floor(days / (1000 * 60 * 60 * 24))+1;
				 $('#chg_days').val(days); //input태그에 챌린지 일자 넣기.
			
				return true; //true일 경우에만 action으로 넘어간다.
				
			}else {
				alert("값이 0보다 커야 합니다.");
				
				return false; 
		}
			
	}
 

</script>
</head>
<body>

	<div style="height: 70px; margin: 0 0 15px 0;">
	<jsp:include page="/WEB-INF/views/teamtwo/header.jsp">
		<jsp:param name="user_id_email" value="${user_id_email}"/>
		<jsp:param name="user_nickname" value="${user_nickname}"/>
	</jsp:include>
	</div>

<div class="out">
	<!-- 제목, 모집상태 -->
	<c:forEach var="chall" items="${chall}">
	   <%-- <img src="../upload/mainIMG/${chall.chg_image}" style="width:70px; height:70px;"> --%>
			<div class="Jalnan" style="font-size:40px; margin-top: 50px;"> ${chall.chg_title}</div>
			<div class="tag" id="challState"></div> <!-- 디데이 로직이 들어올 곳 -->
	</c:forEach>
	
	<!-- 해시태그 -->	
	<c:forEach var="ht2" items="${ht2}">
		<div class="hashtag" style="">#${ht2.hashtag_text}</div>
	</c:forEach><p>
	
	<!-- 챌린지 소개 -->	
	<c:forEach var="chall" items="${chall}">	
	<div class="ChosunGu" style="font-size:16px; font-weight: bold; color:#4d593e; ">${chall.chg_contents}</div>
	</c:forEach>
	<hr>
	
	<!-- 배팅보상률 안내  -->
	<table class="info" style="margin-bottom: 50px;">
	<tr><td class="infotitle">&nbsp;100% 성공</td><td class="infotext">배팅 열매 전액 페이백 + 상금(배팅 열매의 50%지급)</td></tr>
	<tr><td class="infotitle">&nbsp;85%이상 성공</td><td class="infotext">배팅 열매 전액 페이백</td></tr>
	<tr><td class="infotitle">&nbsp;85%미만 성공</td><td class="infotext">배팅 열매의 50% 페이백</td></tr>
	<tr><td></td><td></td></tr><tr><td></td><td></td></tr>
	<tr><td colspan="2" style="font-size:12px; color:#949494;">&nbsp;<img src="../jy/img/warning.png" style="width:15px; height:15px; vertical-align:bottom;">&nbsp;참가비가 높을수록 받는 열매도 많아져요.</tr>
	</table>
	
	
	<!-- 챌린지 마스터 프사, 닉네임 -->
	<div style="text-align:center;"><img src="../jy/img/crown.png" style="width:50px; height:40px; vertical-align:bottom;"></div>
		<div style="text-align:center;"><img src="../upload/profileIMG/${user.user_image}" style="width:100px; height:100px; border-radius:50px;"></div>
		<div style="text-align:center; font-family: 'yg-jalnan'; font-size: 25px;">${user.user_nickname}</div>	
		<div class="join" id="joinChallButton">챌린지 함께하기</div>
		<div class="join" id="reviewButton">후기남기기</div>
	
	<!-- 챌린지 기간 -->
	<c:forEach var="chall" items="${chall}">
		<input type="hidden" id="chg_startdate" name="chg_startdate" value="${chall.chg_startdate}">
		<input type="hidden" id="chg_enddate" name="chg_enddate" value="${chall.chg_enddate}">
		<div style="font-family: 'ChosunGu'; font-size:13px; font-weight:bold; color:gray; text-align:center; margin-bottom:50px;">챌린지기간 : ${chall.chg_startdate} ~ ${chall.chg_enddate}</div>
	</c:forEach>
	
	
	
	<!-- 챌린지 참여신청서 -->
	<div id="joinChall">
		<table style="margin-left:65px; width:92%; border: 1px solid #FFEACD; text-align: center;">
			<tr style="background-color: #FFEACD;"><td colspan="4" style="font-family: 'yg-jalnan'; font-size:25px; color:#515543; text-align: center;">챌린지 신청서</td></tr>
			<c:forEach var="chall" items="${chall}">
			<tr><td class="td1part">챌린지 명</td><td class="td2part" colspan="3">${chall.chg_title}</td></tr>
			<tr><td class="td1part">챌린지 기간</td><td class="td2part" id="totDate" colspan="3"></td></tr>
			</c:forEach>
			
			<tr><td class="td1part">내 보유 열매</td><td class="td3part" colspan="3">
				<img src="../jy/img/dotori.png" style="width:20px; height: 22px; vertical-align: bottom; margin-bottom: 10px;">
					<fmt:formatNumber value="${point_balance}" pattern="#,###" />&nbsp;열매
				</td></tr>
				
			<tr><td class="td1part">배팅 할 열매</td><td class="td2part">
				<form name="batting">
					
				<input type="number" id="batt" name="batt" min="10" max="${point_balance}" step="10">
				&nbsp;&nbsp;<input type="button" value="확인" onclick="batt()">
				</form>
				
				</td><td class="td1part" style="width:300px;">배팅 후 예상 보유 열매</td>
					<td class="td3part" id="battAfter" style="width:300px;">
						<img src="../jy/img/dotori.png" style="width:20px; height: 22px; vertical-align: bottom; margin-bottom: 10px;">
						    <fmt:formatNumber value="${point_balance}" pattern="#,###" />&nbsp;열매 </td></tr>
			<tr><td rowspan="3" class="td1part">얻을 수 있는 열매</td>
						   <td class="td2_1part">100% 성공 </td><td class="td2_2part" id="100">
						   		<fmt:formatNumber value="0" pattern="#,###" />&nbsp;열매</td></tr>
			           <tr><td class="td2_1part">85%이상 성공 </td><td class="td2_2part" id="85up">
			           	   <fmt:formatNumber value="0" pattern="#,###" />&nbsp;열매</td></tr>
			           <tr><td class="td2_1part">85%미만 성공 </td><td class="td2_2part" id="85down">
						   <fmt:formatNumber value="0" pattern="#,###" />&nbsp;열매</td></tr>
		</table>
	
		<div style="text-align: center; font-family: 'ChosunGu';">
			<form name="warning" action="insertChallJoinBatt" method="post" onsubmit="return battChk()">
			<div style="color:red; margin:5px;">※ 신청 후 취소가 불가하며, 챌린지를 포기하더라도 열매는 환급되지 않습니다.</div>
			<div><input type="checkbox" name="agree" onclick="agreeChk(warning)">위의 내용을 충분히 이해했으며, 이에 동의합니다.</div>
			<input type="hidden" id="chg_num" name="chg_num" value="1"><!-- 챌린지 넘버 -->
			<input type="hidden" id="user_id_email" name="user_id_email" value="chate@gmail.com"><!-- 이메일(아이디) -->
			<input type="hidden" id="point_balance" name="point_balance" value="${point_balance}"><!-- 내 보유열매 -->
			<input type="hidden" id="point_minus" name="point_minus" value=""><!-- 차감포인트 -->
			<input type="hidden" id="batting_point" name="batting_point" value=""><!-- 배팅포인트 -->
			<input type="hidden" id="chg_days" name="chg_days" value=""><!-- 챌린지기간 -->
			
			<input class="agree" type="submit" name="chkButton" value="확 인" disabled="disabled">
			</form>
		</div>
	</div>
	
	
	<!-- 현재 참여인원 수 -->
	<div style="margin-left: 65px; height: 50px;">
	<div class="part">현재&nbsp;</div><div class="totpart">${totpart + 1}</div><div class="part">명 참여중</div></div>	
	<hr>
	
	<!-- 참여자 프로필 사진 -->
	<div id="ProfScroll">
	<table>
	<tr style="vertical-align: bottom;">
		<td>
		<div style="width:125px; display: inline-block;">
		<div style="text-align:center;"><img src="../jy/img/crown.png" style="width:40px; height:30px; vertical-align:bottom;"></div>
		<div style="text-align:center;"><img src="../upload/profileIMG/${user.user_image}" style="width:70px; height:70px; border-radius:35px;"></div>
		<div style="text-align:center; font-family: 'yg-jalnan'; font-size: 15px;"><a href="">${user.user_nickname}</a></div>	
		</div>
		</td>
	<c:forEach var="userpart" items="${userpart}">
		<td>
		<div style="width:125px; display: inline-block;">
		<div style="text-align:center;"><img src="../upload/profileIMG/${userpart.user_image}" style="width:70px; height:70px; border-radius:35px;"></div>
		<div style="text-align:center; font-family: 'yg-jalnan'; font-size: 15px;">${userpart.user_nickname}</div>	
		</div>
		</td>
	</c:forEach>
	</tr>
	</table>
	</div>
	<hr>
	
   <!-- 도토리바 -->
   <div id="dotoriBar" style = "font-family: 'ChosunGu'; font-size: 15px; ">
      <table style="margin-left:65px; width:92%; border: 1px solid #FFEACD; background-color:#FFEACD; text-align: center;">
         <tr><td class="tdDotori" style="background-color:#D8E4A9;">나의 진행현황</td>
         <td>
         <div style="width: 100%; height:45px; background-color: white;  position: relative; border-radius: 5px;">
         <div class="myChgBar" style="float:left; width:${myPercent}% ; background-color: #9E8173; top: 14px; position: relative;">
         <fmt:formatNumber value="${myPercent }" pattern=".0'%'"></fmt:formatNumber>
         </div><div style="float:left;"><img style="width:40px; left: -15px; position: relative; " src="/pys/img/도토리.png"></div></div></td></tr>
         <tr><td class="tdDotori" style="background-color:#D8E4A9;">챌린지 진행현황</td>
         <td >
         <div style="width: 100%; height:45px; background-color: white; position: relative; border-radius: 5px;">
         <div class="myDayBar" style="float:left; width:${chgPercent}% ; background-color: #9E8173; top: 14px; position: relative;" >         
         <fmt:formatNumber value="${chgPercent }" pattern=".0'%'"></fmt:formatNumber>
         </div><div style="float:left;"><img style="width:40px; left: -15px; position: relative; " src="/pys/img/도토리.png"></div></div></td></tr>
      </table>
   </div>
   
   <!-- 오늘의 랜덤문구 -->
   <div id="todayRandom">
      <table style="margin-left:65px; margin-top:5px; width:92%; border: 1px solid #FFEACD; background-color:#FFEACD; text-align: center;">
         <tr><td style="font-family: 'yg-jalnan'; font-size:25px; color:#515543; text-align: center;">오늘의 랜덤문구</td></tr>
         <tr style="background-color: white;"><td>${today_phrase }</td></tr>
         
      </table>
   </div>
   
	<!-- 챌린지 인증방법 -->
	<c:forEach var="chall" items="${chall}">
		<table style="margin-left: 65px; margin-top:50px; margin-bottom:50px; background-color: #FFEACD; border: 1px solid #FFEACD; width:92%;">
		   <tr><td colspan="2" style="font-family: 'yg-jalnan'; font-size:25px; color:#515543; text-align: center;">챌린지 인증방법</td></tr>
		   <tr style="background-color: white; text-align: center;"><td><img src="../upload/exIMG/${chall.chg_sample_image}" style="width:200px; height:200px;"></td><td>${chall.chg_sample_text}</td></tr>
		</table>
	</c:forEach>
	
	<!-- 하단메뉴바 -->
	
    <div class="divNav" style="width: 1105px; line-height: 50px; background-color: #9E8173; border-radius: 5px; margin-left: 63px;">
       <a href="#" class="chgMenuList">소통하기</a>
       <a href="#" class="chgMenuList">인증게시판</a>
       <a href="#" class="chgMenuList">후기</a>
    </div>

	<!-- 지예 인증게시판 -->
	<div class="confirmBoard" style="text-align: center; width: 80%; margin-left: 131px;">
		<div>챌린지 인증</div>
		  <form id="form1" action="confirmPicSave" method="post" enctype="multipart/form-data" target="myBatisFrame">
		<input type="file" name="file1"> 
	    <input type="hidden" name="path" value="${pageContext.request.contextPath}/resources/image/">
	    <input type="hidden" name="chg_num" value="${chg_num}">
	    <input type="hidden" name="parti_id_email" value="${id}">
		<input type="submit">
	</form>
	
	<!-- iframe으로 써야 새창이 뜨지 않고 현재창으로 돌아오게 할수있다. 0px;로 해줘야 iframe을 숨길수 있다. -->
	<iframe name="myBatisFrame" style="width: 0px; height: 0px; border: 0px;"></iframe>

<!-- 	<script>
		function addFilePath(msg) {
			alert(msg);
			document.getElementById("form1").reset();
		}
	</script> -->

	</div>
	
	<!-- 경민 소통하기 시작 -->
	<div id="chatScroll" style="overflow: auto;">
		<table id="chatBox">
			<c:forEach var="ccb" items="${chgChatBox }" varStatus="status">
				<tr class="chattr">
					<td><c:if test="${ccb.chat_id_email != id }">
							<div class="chatForm_others">
								<div class="chatUser_image">
									<img src="../upload/profileIMG/${ccb.user_image }"
										style="width: 70px; height: 70px; border-radius: 35px;">
								</div>
								<div style="display: inline-block;">
									<div class="nickname">${ccb.user_nickname }</div>
									<div class="text">&nbsp;&nbsp;${ccb.chat_contents }&nbsp;&nbsp;</div>
									<div class="time">
										<fmt:formatDate value="${ccb.chat_timestamp }" type="time"
											timeStyle="short" />
									</div>
								</div>
							</div>
						</c:if> <!-- 내가 쓴 채팅 --> <c:if test="${ccb.chat_id_email == id }">
							<div class="chatForm_mine">

								<div style="display: inline-block;">

									<div class="text_mine">&nbsp;&nbsp;${ccb.chat_contents }&nbsp;&nbsp;</div>
									<div class="time_mine">
										<fmt:formatDate value="${ccb.chat_timestamp }" type="time" timeStyle="short" />
									</div>
								</div>
							</div>
						</c:if></td>
				</tr>
			</c:forEach>

		</table>
		
	</div>
	<div class = "chatWriteForm">
		<form id="chatForm" action="insertChat">
			<input type="hidden" name="chat_id_email" value="${id }">
			<input type="hidden" name="chg_num" value="${chg_num}">
			<input type="text" name="chat_contents" id="msg"> <input type="submit" id="send" value="전송">
		</form>
	</div><!-- 경민 소통하기 끝 -->
	
	
   <!-- 경민 후기 -->
   <div id="reviewScroll" style="overflow: auto;">
      <table id="reviewBox">
         <c:forEach var="crb" items="${chgReviewBox }" varStatus="status">
            <tr>
               <td>
                  <div class="reviewForm_others">
                     <div class="reviewUser_image">
                        <img src="../upload/profileIMG/${crb.user_image }"
                           style="width: 70px; height: 70px; border-radius: 35px;">
                     </div>
                     <div style="display: inline-block;">
                        <div class="nickname">${crb.user_nickname }</div>
                        <div class="starScore">
                           <c:if test="${crb.review_score ==1}" >
                              <span class="fa fa-star"></span>
                           </c:if>
                           <c:if test="${crb.review_score ==2}" >
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star"></span>
                           </c:if>
                           <c:if test="${crb.review_score ==3}" >
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star"></span>
                           </c:if>
                           <c:if test="${crb.review_score ==4}" >
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star"></span>
                           </c:if>
                           <c:if test="${crb.review_score ==5}" >
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star"></span>
                           </c:if>   
                        </div>
                        <div class="text">&nbsp;&nbsp;${crb.review_contents }&nbsp;&nbsp;</div>
                        <div class="time">
                           <fmt:formatDate value="${crb.review_timestamp }" type="date"
                              timeStyle="short" />
                        </div>
                     </div>
                  </div>
            </tr>
         </c:forEach>

      </table>

   </div>
   <div class="reviewWriteForm">
      <form id="reviewForm" action="updateReview">

      <div class="rating-css">    
          <div class="star-icon">
            <input type="radio" name="review_score" id="rating1" value="1">
            <label for="rating1" class="fa fa-star"></label>
            <input type="radio" name="review_score" id="rating2" value="2">
            <label for="rating2" class="fa fa-star"></label>
            <input type="radio" name="review_score" id="rating3" value="3" checked>
            <label for="rating3" class="fa fa-star"></label>
            <input type="radio" name="review_score" id="rating4" value="4">
            <label for="rating4" class="fa fa-star"></label>
            <input type="radio" name="review_score" id="rating5" value="5">
            <label for="rating5" class="fa fa-star"></label>
          </div>
        </div>
        <br>
        
         <input type="hidden" name="chg_num" value="${chg_num }"> 
         <input type="hidden" name = "user_id_email" value="${id }"> 
         <input type="text" name = "review_contents" id="msg"> 
         <input type="submit" id="send" value="후기남기기">
       
      </form>
   </div><!-- 경민 후기 끝 -->
   
   

	

</div><!-- out div 끝 -->

<div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>


</body>
</html>