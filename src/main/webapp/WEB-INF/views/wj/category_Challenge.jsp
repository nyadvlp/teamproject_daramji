<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
var listcount;
var Vlc_num;
var Vmc_num;
var Vsc_num;
var liststr = "";
var chg_regdate = "";
var chg_startdate = "";
var chg_enddate = "";
var chg_capacity = "";
var chg_now_parti = "";
var timeResult = "";
var now = new Date().getTime();
$(window).ready(function() {
 Vlc_num = $('#lc_num').val();
 Vmc_num = $('#mc_num').val();
 Vsc_num = $('#sc_num').val();
 
  $.ajax({
     url:"category_ajax_listCount",
     data:{lc_num : Vlc_num, mc_num : Vmc_num, sc_num : Vsc_num},
     dataType:'json',
     success:function(data){ 
        $(data).each(function() {
           listcount = this.count;                 
            $.ajax({
                   url:"category_ajax",
                   data:{lc_num : ${lc_num},mc_num : ${mc_num}, sc_num : ${sc_num}, count : listcount},
                   dataType:'json',
                   success:function(data){
                      $(data).each(function(index,item) {    
                         
                       var result = "";
                         var cutlength = 15;
                         var machim = "..";
                         if(item.chg_title.length > cutlength){
                              result += item.chg_title.substr(0,cutlength)+machim;             
                         }else{
                             result += item.chg_title;
                         }               
                                                                         
                     var wj_chg_startdate = new Date(item.chg_startdate);
                      var wj_chg_regdate = new Date(item.chg_regdate);
                      var wj_chg_enddate = new Date(item.chg_enddate);
         
                      if(wj_chg_regdate <= now && item.chg_now_parti < item.chg_capacity){
                         // alert(wj_chg_regdate);
                          
                            if(wj_chg_startdate < now){
                                                
                              if(wj_chg_enddate <= now){
                                      timeResult = "챌린지종료";
                               }else{
                                  var distance = now - wj_chg_startdate; //진행중
                                 var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                                  timeResult = "진행중 D+"+days;                                     
                                }
                              
                          }else if (wj_chg_startdate = now){
                                 timeResult = "D-DAY";
                                 } 
                         }else if(item.chg_now_parti >= item.chg_capacity){
                                 timeResult = "모집마감";
                         }else{
                              var distance = now - wj_chg_startdate; //모집중
                             var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                             timeResult = "모집중 D"+days;
                              } 
                         
                         if(listcount == 0){
                            liststr += "리스트가 없습니다.";
                         }else{
                            liststr += "<div class='divChatbotListBase' id='chatbotList"+index+"'>";
                            liststr += "<div class='divChatbotListImg'>";
                            liststr += "<a href='#'><img class='divChatbotListImgsize' alt='' src='upload/mainIMG/"+item.chg_image+"'></a>";
                            liststr += "<div class='chatbotUser_count'>";
                            liststr += "<div class='divChatbotUser_count_img'><img alt='' src='teamtwo/img/wj_board_user_icon.png' class='chatbotUser_count_img'></div>";
                            liststr += "<div class='divChatbotUser_count'>"+item.chg_now_parti+"명</div>";
                            liststr += "</div></div>";
                            liststr += "<div class='divChatbotListTitle'><a href='#'class='divChatbotListTitleFont'>"+result+"</a></div>";
                            liststr += "<div class='chatbotListTimeFont'><div id='chatbotListTime'>"+timeResult+"</div></div>";
                            var hashtag = item.hashtag_text.split(",");
                            for( var i in hashtag){
                                liststr += "<div class='divHashtag'>"+hashtag[i]+"</div>";
                            }
                            liststr += "</div></div>";
                         }
                    }); 

                     $('#challengeList').append(liststr);
                   }
              }); 
            
      });
     }
  });       
});

</script>
<style type="text/css">
  .divLoveChallengeList{
    margin-left: 400px;
    width:830px;
    border: 1px solid black; /* 추후에 삭제 */
 }
 
 .divChatbotListBase{
    display:inline-block;
    vertical-align : top;
    width: 250px;
    height: 300px;
    margin-top : 20px;
    margin-right: 16.5px;
    border: 1px solid black; /* 추후에 삭제 */
 }
 
 .divChatbotListImg{
    position: relative;
    vertical-align: top;
    width:  249px;
    height: 180px;
    border: 1px solid black; /* 추후에 삭제 */
 }
 
 .chatbotUser_count{
    
    position: absolute;
    width:70px;
    height: 25px;
    background-color: black;
    border-radius: 30px;
    top: 10px;
    right: 10px;
 }
 
 .divChatbotUser_count_img{
    margin-top:2.5px;
    margin-left:6px;
    display:inline-block;
    width:20px; 
    height:20px;
 }
 
 .chatbotUser_count_img{
    width:20px; 
    height:20px;
    
 }
 
 .divChatbotUser_count{
     display: inline-block;
     vertical-align:top;
     padding-top:5.5px;
     width: 30px;
     height: 25px;
     color: white;
    font-family: 'ChosunGu';
    font-size: 15px;
 }
 
 .divChatbotListTitle{
    width: 249px;
    height: 30px;
    border: 1px solid black; /* 추후에 삭제 */
 }
 
 .divChatbotListTitleFont{
   font-family:'yg-jalnan';
    font-size:16px;
 }
 
  .divChatbotListImgsize{
     width: 249px;
     height: 180px;
  }
  
  .chatbotListTimeFont{
      margin-left:2px;
      font-size: 12px;
      font-family: 'yg-jalnan'
  }
 
 .divHashtag{
     display: inline-block;
     margin-right:2px;
     margin-left:4px;
     width: 70px;
     height: 20px;
     font-size: 8px;
     border-radius: 30px;
     background-color: #f7ceb6;
     border: 1px solid #9f6e54;
     padding-top : 10px;
     text-align: center;
 }
</style>
</head>
<body>

	<div style="height: 70px; margin: 0 0 15px 0;">
	<jsp:include page="/WEB-INF/views/teamtwo/header.jsp">
		<jsp:param name="user_id_email" value="${user_id_email}"/>
		<jsp:param name="user_nickname" value="${user_nickname}"/>
	</jsp:include>
	</div>
	
     체크용
      ${lc_num }
      ${mc_num }
      ${sc_num }
      <input type="text" name="lc_num" id="lc_num" value="${lc_num}">
      <input type="text" name="mc_num" id="mc_num" value="${mc_num}">
      <input type="text" name="sc_num" id="sc_num" value="${sc_num}">
      
      <div class="divLoveChallengeList" id="challengeList">
      
      </div>
      
      <div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>
      
</body>
</html>