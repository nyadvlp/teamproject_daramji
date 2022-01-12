<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
     
     $(window).ready(function() {
    	 var arr = new Array();    
    		
         <c:forEach var="titleName" items="${chatbotList}">
                    arr.push({
                    	name:"${titleName.chg_title}"
                    });
         </c:forEach>
         
         $.each(arr, function(index, item) {
    		
        	 var result = "";
        	 var cutlength = 15;
        	 var machim = "..";
        	 if(item.name.length > cutlength){
        		   result += item.name.substr(0,cutlength)+machim;    		   
        	 }else{
        		  result += item.name;
        	 }
        	       	
        	 $('#titleCut'+index).html(result);
        	
        	 
    	});
         
	});
     
       
</script>
<style type="text/css">
   
    
      .divsearch{
     margin-left: 400px;
     width:800px;
    border: 1px solid black; /* 추후에 삭제 */
 }
 
 .search{
    display: inline-block;
 }
 
 input::-webkit-input-placeholder{ 
      text-align: center;
      color:#d3d3d3;
      font-size: 22px;
 }
 
 .aMoretag{
   color:#9f6e54;
   font-size:10px;
   font-family: 'ChosunGu';
 }
 
  .divSearchChallenge{
    margin-left: 400px;
    width:800px;
    border: 1px solid black; /* 추후에 삭제 */
 }
 
 .divSearchChallengeFont{
    font-size: 25px;
    font-family: 'yg-jalnan';
 }
 
 .divSearchChallengeList{
    margin-left: 400px;
    width:800px;
    border: 1px solid black; /* 추후에 삭제 */
 }
 
 .divSearchListBase{
    display:inline-block;
    vertical-align : top;
    width: 250px;
    height: 300px;
    margin-top : 20px;
    margin-right: 16.5px;
    border: 1px solid black; /* 추후에 삭제 */
 }
 
 .divSearchListImg{
    position: relative;
    vertical-align: top;
    width:  249px;
    height: 180px;
    border: 1px solid black; /* 추후에 삭제 */
 }
 
 .SearchUser_count{
    
    position: absolute;
    width:70px;
    height: 25px;
    background-color: black;
    border-radius: 30px;
    top: 10px;
    right: 10px;
 }
 
 .divSearchUser_count_img{
    margin-top:2.5px;
    margin-left:6px;
    display:inline-block;
    width:20px; 
    height:20px;
 }
 
 .SearchUser_count_img{
    width:20px; 
    height:20px;
    
 }
 
 .divSearchUser_count{
     display: inline-block;
     vertical-align:top;
     padding-top:5.5px;
     width: 30px;
     height: 25px;
     color: white;
    font-family: 'ChosunGu';
    font-size: 15px;
 }
 
 .divSearchListTitle{
    width: 249px;
    height: 30px;
    border: 1px solid black; /* 추후에 삭제 */
 }
 
 .divSearchListTitleFont{
   font-family:'yg-jalnan';
    font-size:16px;
 }
 
  .divSearchListImgsize{
     width: 249px;
     height: 180px;
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

    <div><!-- Search 부분 (제목 / 작성자 / 내용)start -->
       <form action="mainSearch">
         <input type="hidden" name="user_id_email" value="${user_id_email}">
         <input type="hidden" name="user_nickname" value="${user_nickname}">
         <input type="hidden" name="user_image" value="${user_image}">
       <div class="divsearch">
       <div class="search"><input type="text" name="mainSearchName" value="${mainSearchName}" required="required" placeholder="검색창" style=" font-size:15px;  width: 690px; height: 60px; border: 2px solid #9f6e54;"></div>
       <div class="search"><input type="submit" value="검색" style="width: 100px; height: 60px; border:0; background: #9f6e54; color: white;"></div>
       </div>
       </form>
    </div><!-- Search 부분 (제목 / 작성자 / 내용)end -->
    
    <!-- 모든 페이지에 들어가는 상단부분 end -->
    
     <div style="margin-top: 30px;"></div>
     
     <div class="divSearchChallenge">
        <div class="divSearchChallengeFont"><b style="color:#ebd39f;">${mainSearchName}</b>
                                           <b style="color:#9f6e54;">에 해당하는 </b>
                                           <b style="color:#ebd39f;">제목</b>
                                           <b style="color:#9f6e54;">을 가진 챌린지</b>
                                           </div>
     </div>
     
     <div style="margin-top: 10px;"></div>
     
     <div>
         
         
          <div class="divSearchChallengeList">
                 <c:choose>
                  <c:when test="${chatbotList.size() > 0 }">
                   <c:forEach var="chatbotList" items="${chatbotList}" varStatus="status">
                            <div class="divSearchListBase">
                                 <div class="divSearchListImg">
                                    <a href="#"><img class="divSearchListImgsize" alt="" src="upload/mainIMG/${chatbotList.chg_image}"></a>
                                    <div class="SearchUser_count">
                                         <div class="divSearchUser_count_img"><img alt="" src="teamtwo/img/wj_board_user_icon.png" class="SearchUser_count_img"></div>
                                         <div class="divSearchUser_count">${chatbotList.chg_now_parti}명</div>
                                    </div>
                                 </div>
                                  <div class="divSearchListTitle"><a href="#" id="titleCut${status.index}" class="divChatbotListTitleFont"></a></div>
                                  <div>모집중D-2</div>
                                  <div>해시태그</div>
                            </div>
                   </c:forEach>
                   </c:when>
                   <c:otherwise>
                         ${user_nickname }님에게 추천해드릴 챌린지가 없습니다.
                   </c:otherwise>
                   </c:choose>
          </div>
      </div>
      
      <div style="margin-top: 30px;"></div>

<div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>

</body>
</html>