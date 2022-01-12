<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<script type="text/javascript">


$(document).ready(function(){
	   $("#capa_self").hide(); 
	   $("#capa_default").show(); 
});



function selfbtn(){
	console.log('self button clicked');
	$("input[id='rad']").attr('disabled',true);
	$("input[id='rad2']").attr('disabled',true);
	$("input[id='rad3']").attr('disabled',true);
	$("input[id='rad4']").attr('disabled',true);
	$("#capa_self").show(); 
}

$(function() {
	
	$("#duration_msg").hide(); 
	

    <!-- startDate datepicker -->
    
      var today = new Date();
      console.log('today : ' + today)
      
      var dd = today.getDate() + 5;
      var s_minDate = new Date();
      s_minDate.setDate(dd);
      
/*       $("#regDate").datepicker(); 
      $("#regDate").datepicker("setDate", today); 
      
      $("#regDate").datepicker({
          dateFormat: 'yy-mm-dd' 
      });
      
      $('input[name=chg_regdate]').datepicker('disable');     */
      
      
    $("#startDate").datepicker({
        dateFormat: 'yy-mm-dd' 
        ,showOtherMonths: true
        ,showMonthAfterYear:true 
        ,changeMonth: true              
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택"                
        ,yearSuffix: "년" 
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
        ,dayNamesMin: ['일','월','화','수','목','금','토'] 
       ,minDate: s_minDate

 
    });    
      
    
    
    $("#startDate").change(function(){
       $('#startDate').empty();
       var startDate = document.getElementById("startDate").value;
       chknone();
    });
    
    <!-- endDate datepicker -->

  
    $("#endDate").datepicker({
        dateFormat: 'yy-mm-dd' 
        ,showOtherMonths: true
        ,showMonthAfterYear:true 
        ,changeMonth: true              
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택"                
        ,yearSuffix: "년" 
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
        ,dayNamesMin: ['일','월','화','수','목','금','토'] 
       ,minDate: s_minDate

 
    });    
    
    $("#endDate").change(function(){
       $('#endDate').empty();
       var endDate = document.getElementById("endDate").value;
       chknone();
    });
 

    
    $('#startDate').datepicker("option", "maxDate", $("#endDate").val());
    $('#startDate').datepicker("option", "onClose", function ( selectedDate ) {
            $("#endDate").datepicker( "option", "minDate", selectedDate );
        });
    
   /*  $('#endDate').datepicker("option", "minDate", $("#startDate").val()); */
        $('#endDate').datepicker("option", "onClose", function ( selectedDate ) {
            $("#startDate").datepicker( "option", "maxDate", selectedDate );
        });
    
       
        
        
    <!-- 둘다 값이 있으면 날짜를 계산 -->
    function chknone(){
       console.log('chknone() started');
       if($("#startDate").datepicker("getDate") === null || $("#endDate").datepicker("getDate") === null) {
          } else{
            calcDiff();
          }
       console.log('chknone() finished');
    }
        
        
    <!-- 날짜 차이 계산하는 함수 (위에서도 호출될 예정) -->
    function calcDiff(){
        var start = $("#startDate").datepicker("getDate");
        var end = $("#endDate").datepicker("getDate");
        var days = ((end - start) / (1000 * 60 * 60 * 24)) + 1;
        
        if (days < 5) {
        	alert('챌린지는 최소 5일 이상이어야 등록이 가능해요!');
        	$("#duration").val('등록 불가능!');
        	$("#duration_msg").show(); 
        } else {
        $("#duration_msg").hide(); 
        $("#duration").val(days + '일간 힘내봐요!');
        }
    }
    
    
    
         
});






<%
String context = request.getContextPath();
%>

$(document).ready(function(){
   $('#textarea_chg_contents').on('keyup', function(){
      $('#chg_contents_count').html("("+$(this).val().length+" / 100)");
      
      if($(this).val().length > 100) {
         $(this).val($(this).val().substring(0, 100));
         $('#chg_contents_count').html("(100 / 100)");
      }
   })
});

$(document).ready(function(){
   $('#text_explain').on('keyup', function(){
      $('#text_explain_count').html("("+$(this).val().length+" / 50)");
      
      if($(this).val().length > 50) {
         $(this).val($(this).val().substring(0, 50));
         $('#text_explain_count').html("(50 / 50)");
      }
   })
});




$(document).ready(function(){
   $("#mc_numdiv").hide(); 
   $("#sc_numdiv").hide(); 

   $("#lc_num").change(function(){
      var lc_num = document.getElementById("lc_num");
      <!-- 선택한 값을 저장 -->
      var selected_lc_num = lc_num.options[lc_num.selectedIndex].value;
      console.log("lc_num : " + selected_lc_num);
      

      $("#mc_numdiv").show(); 
      $("#sc_numdiv").hide(); 
      
      $.ajax({ 
          url:"<%=context%>/readCategory2" ,
          data:{lc_num : selected_lc_num},
          dataType:'json',
          success:function(data){
            str    = "<option value='0'>== 중분류 ==</option>";
            str2   = "";

             $(data).each(
                function(){
                   str2 = "<option value='" + this.mc_num + "'>" + this.subject + "</option>";
                   str += str2;
                }      
             );
            $("#mc_num").empty(); 
            $("#sc_num").empty();
            $('#mc_num').append(str);   
         }            
      });
      
      
      
      $("#mc_num").change(function(){
         var lc_num = document.getElementById("lc_num");
         <!-- 선택한 값을 저장 -->
         var selected_lc_num = lc_num.options[lc_num.selectedIndex].value;
         var mc_num = document.getElementById("mc_num");
         <!-- 선택한 값을 저장 -->
         var selected_mc_num = mc_num.options[mc_num.selectedIndex].value;
         console.log("lc_num & mc_num : " + selected_lc_num + " and " + selected_mc_num);
         

         $("#sc_numdiv").show(); 
         
      
         
         $.ajax({ 
             url:"<%=context%>/readCategory3" ,
             data:{mc_num : selected_mc_num, lc_num : selected_lc_num},
             dataType:'json',
             success:function(data){
               str    = "<option value='0'>== 소분류 ==</option>";
               str2   = "";

                $(data).each(
                   function(){
                      str2 = "<option value='" + this.sc_num + "'>" + this.subject + "</option>";
                      str += str2;
                   }      
                );
               $("#sc_num").empty();
               $('#sc_num').append(str);   
            }            
         });

      });   
      
   });
   
});



</script>



<style type="text/css">
@font-face {
	font-family: 'ChosunGu';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.makeChal {
	width: 1000px;
	display: inline-block;
	margin-left: 300px;
	vertical-align: top;
	text-align: center;
}

.makeChalTitleFont {
	display: inline-block;
	vertical-align: baseline;
	font-size: 30px;
	font-family: 'JalnanOTF';
}

.subTitleFont {
	display: inline-block;
	vertical-align: baseline;
	font-size: 20px;
	font-family: 'JalnanOTF';
}

.duration_msg {
	color: red;
}

.explainFont {
	display: inline-block;
	vertical-align: baseline;
	font-size: 10px;
	color: gray;
	font-family: 'ChosunGu';
}

.contentFont {
	display: inline-block;
	vertical-align: baseline;
	font-size: 14px;
	color: #9f6e54;
	font-family: 'ChosunGu';
}

.maintable {
	width: 600px;
	margin: 20px;
	border: 1px solid #ebd39f;
	font-size: 12pt;
	font-family: 'ChosunGu';
	vertical-align: top;
	margin: auto;
	padding: 10px;
	border: 1px solid #ebd39f;
}

.numberbox {
	background: white;
	border: 1px solid #daa35b;
	border-radius: 3px;
	width: 40px;
	height: 30px;
	box-sizing: border-box;
	outline: none;
	font-family: ChosunGu;
	font-size: 13px;
	color: #9f6e54;
}

select {
	padding: .5em .5em;
	border: 1px solid #daa35b;
	font-family: inherit;
	background: url('ban/img/arrow.png') no-repeat 97% 50%;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	color: #9f6e54;
}

.select150 {
	width: 150px;
}

.select225 {
	width: 225px;
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

button:hover {
	color: black;
}

.greenbutton {
	width: 70px;
	height: 25px;
	background-color: #4d9549;
	border: none;
	border-radius: 3px;
	color: #fff;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px;
	cursor: pointer;
}

select:hover {
	border-color: #daa35b;
	background-color: #daa35b;
	color: white;
	box-shadow: 0 1px 0 1px rgba(0, 0, 0, 0.04);
}

select::-ms-expand {
	display: none;
}

.textbox {
	background: #daa35b;
	border: 1px solid #daa35b;
	border-radius: 3px;
	width: 457px;
	height: 33px;
	box-sizing: border-box;
	outline: none;
	font-family: JalnanOTF;
	font-size: 16px;
	color: white;
}

.textbox::placeholder {
	color: white;
}

.lightTextbox {
	background: white;
	border: 1px solid #daa35b;
	border-radius: 3px;
	width: 457px;
	height: 30px;
	box-sizing: border-box;
	outline: none;
	font-family: ChosunGu;
	font-size: 13px;
	color: #9f6e54;
}

.lightsmallTextbox {
	background: white;
	border: 1px solid #daa35b;
	border-radius: 3px;
	width: 150px;
	height: 30px;
	box-sizing: border-box;
	outline: none;
	font-family: ChosunGu;
	font-size: 13px;
	color: #9f6e54;
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

.tagTextbox::placeholder {
	color: white;
}

.lightsmallTextbox::placeholder {
	color: #9f6e54;
}

.smalltext {
	font-size: 11px;
	color: gray;
}

.selectdiv {
	float: left;
	margin-right: 5px;
}

.empty {
	height: 17px;
	width: 100%;
	margin: 10px;
	float: left;
}

textarea {
	width: 457px;
	height: 100px;
	padding: 10px;
	box-sizing: border-box;
	border: 1px solid #daa35b;
	border-radius: 3px;
	font-size: 14px;
	font-family: ChosunGu;
	resize: both;
	color: #9f6e54;
}

.capa_self {
	float: left;
}

.makeChal:after {
	content:"";
	display:block;
	clear:both;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/teamtwo/header.jsp">
		<jsp:param name="user_id_email" value="${user_id_email }"/>
		<jsp:param name="user_nickname" value="${user_nickname }"/>
	</jsp:include>
	
	<div class="makeChal">

		<form name="makeChalForm"
			action="confirmChal?user_id_email=${userinfo.user_id_email }"
			method="post">

			<!-- 유저가 입력하지 않는 정보 -->


			<!--  끌어온 정보 : 챌린지 번호 -->
			<input type="hidden" value="999999" name="chg_num">

			<!--  끌어온 정보 : 유저 이메일, 닉네임 -->
			<input type="hidden" value="${userinfo.user_id_email}"
				name="chg_master"> <input type="hidden"
				value="${userinfo.user_nickname}" name="master_nickname">



			<!-- 기본값 세팅 : 좋아요 수, 챌린지 상태, 현재 참여인원, 등록일 -->
			<input type="hidden" value="0" name="chg_like_count"> <input
				type="hidden" value="1" name="chg_state"> <input
				type="hidden" value="0" name="chg_now_parti"> <input
				type="hidden" value="보류" name="chg_confirm_time"><input
				type="hidden" value="1988-11-03" name="chg_regdate"> <br />


			<!--  챌린지 등록 시작 -->

			<b class="makeChalTitleFont">어떤 챌린지를 만들어볼까요?</b><br /> <br />
			<table class="maintable">

				<tr height=40px>
					<td colspan="2"><b class="subTitleFont" align="center">챌린지
							주요 정보</b></td>
				</tr>


				<tr height=40px>
					<!--  챌린지명 -->
					<td>챌린지명</td>
					<td><input type="text" size="80" name="chg_title"
						required="required" maxlength="50" class="textbox"
						placeholder="예시 : 하루 한 번 할수있다람쥐 접속하기! (최대 50자)"></td>
				</tr>

				<tr height=40px>
					<!--  정적카테고리 -->
					<td>카테고리</td>
					<td>

						<div class="selectdiv">
							<select name="lc_num" id="lc_num" class="select150"
								required="required">
								<option value="0">== 대분류 ==</option>
								<c:forEach var="list" items="${category1 }" varStatus="status">
									<option value="${list.lc_num }">${list.subject }</option>
								</c:forEach>
							</select>
						</div>


						<div id="mc_numdiv" class="selectdiv">
							<select name="mc_num" id="mc_num" class="select150"
								required="required">


							</select>
						</div>


						<div id="sc_numdiv" class="selectdiv">
							<select name="sc_num" id="sc_num" class="select150"
								required="required">


							</select>
						</div>

					</td>

				</tr>

				<tr height=50px>
					<!--  챗봇추천분류 -->
					<td>챌린지 성격</td>
					<td>
						<!-- 테이블 안의 테이블 시작 -->
						<table class="subtable">
							<tr>
								<td><b class='contentFont'>어떤 의미가 있나요?</b></td>
								<td><select name="q_cnum_1" class="select225"
									required="required">
										<option value="1">미래를 위한 투자</option>
										<option value="2">마음 돌보기</option>
										<option value="3">습관 형성</option>
										<option value="4">티끌모아 태산</option>
								</select></td>
							</tr>
							<tr>
								<td><b class='contentFont'>주로 언제 이루어질 활동인가요?</b></td>
								<td><select name="q_cnum_2" class="select225"
									required="required">
										<option value="1">아침 (06~11시)</option>
										<option value="2">낮 (11~18시)</option>
										<option value="3">저녁 (18~20시)</option>
										<option value="4">밤 (20~0시)</option>
										<option value="5">새벽 (0~6시)</option>
										<option value="6">하루종일</option>
								</select></td>
							</tr>
						</table>
					</td>
				<tr height=40px>
					<!--  대표이미지 -->
					<td>대표이미지</td>
					<td><input type="text" size="30" name="chg_image"
						required="required"><br /> <b class="explainFont">등록된
							이미지는 수정이 불가능하니 신중하게 등록해주세요!</b></td>
				</tr>


				<tr height=50px>
					<!--  챌린지소개 -->
					<td>챌린지 소개</td>
					<td><textarea name="chg_contents" cols="65" rows="3"
							required="required" id="textarea_chg_contents"
							placeholder="100글자 이하로 챌린지를 소개해주세요.&#13;&#10;(예시: 하루 한 번 할수있다람쥐에 접속하는 챌린지입니다.)"></textarea>

						<div id="chg_contents_count" class="smalltext">(0 / 100)</div></td>

				</tr>

			</table>
			<div class="empty"></div>



			<table class="maintable">
				<tr height=40px>
					<td colspan="2"><b class="subTitleFont" align="center">챌린지
							상세 정보</b></td>
				</tr>

				<tr height=40px>
					<!--  참여가능인원수 -->
					<td>챌린지 정원</td>
					<!--  음수 안 되게 로직 걸기  -->
					<td>
						<div id="capa_default">
							<label><input type="radio" name="chg_capacity" id="rad"
								value="10">10명</label> <label><input type="radio"
								name="chg_capacity" id="rad2" value="30">30명</label> <label><input
								type="radio" name="chg_capacity" id="rad3" value="50">50명</label>
							<label><input type="radio" name="chg_capacity" id="rad4"
								value="70">70명</label><br />
							<button id="capa_self_btn" type="button" onclick="selfbtn()">직접설정</button>
						</div>
						<div id="capa_self">
							<input type="number" class="numberbox" name="chg_capacity"
								min="5" max="100" value="5">명
						</div>


					</td>
				</tr>


				<tr height=40px>
					<!--  챌린지시작일자 -->
					<td>챌린지 시작일</td>
					<td><input type="text" id="startDate" name="chg_startdate"
						class="lightsmallTextbox" placeholder="시작일을 입력하세요!"></td>
				</tr>


				<tr height=30px>
					<!--  챌린지종료일자 -->
					<td>챌린지 종료일</td>
					<td><input type="text" id="endDate" name="chg_enddate"
						class="lightsmallTextbox" placeholder="종료일을 입력하세요!"></td>
				</tr>


				<tr height=30px>
					<td>챌린지 기간</td>
					<td><div id="datesbetween">
							<input type="text" id="duration" placeholder="챌린지 기간 (자동입력)"
								class="lightsmallTextbox" readonly>
						</div>

						<div id="duration_msg">기간을 다시 설정해주세요.</div></td>

				</tr>




				<tr height=40px>
					<!--  태그 -->
					<td>태그</td>
					<td><input type="text" placeholder="태그를" class="tagTextbox"
						id="hash1" name="hash1"><input type="text"
						placeholder="설정해" class="tagTextbox" id="hash2" name="hash2"><input
						type="text" placeholder="주세요" class="tagTextbox" id="hash3"
						name="hash3"> <b class="explainFont">해시태그는 3개까지만 등록
							가능해요!</b></td>
				</tr>

				<tr height=40px>
					<!--  인증예시 이미지 -->
					<td>인증예시 이미지</td>
					<td><input type="text" name="chg_sample_image"
						required="required"></td>
				</tr>



				<tr height=40px>
					<!--  인증방법 -->
					<td>인증방법 설명</td>
					<td><input type="text" size="80" name="chg_sample_text"
						required="required" class="lightTextbox" id="text_explain"
						placeholder="50글자 이하로 인증사진 촬영방법을 설명해주세요.">

						<div id="text_explain_count" class="smallTextbox">(0 / 50)</div></td>
				</tr>



				<tr>
					<td></td>
					<td></td>
				</tr>



			</table>

			<div class="empty"></div>

			<input type="button" value="취소"> <input type="submit"
				value="등록">
		</form>



	</div>
	<!—  makeChal div class 종료—>

<div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>


</body>
</html>