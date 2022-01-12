<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
     
	     var categorystr1 ="";
	     var categorystr2 ="";
	     var categorystr3 ="";
	     var category_backstr ="";	     
	     
		 var now = new Date().getTime();    
     $(window).ready(function() { // main이 실행될때
    	 var arr = new Array();        		
         <c:forEach var="titleName" items="${chatbotList}">
                    arr.push({
                    	name:"${titleName.chg_title}"
                    });
         </c:forEach>           
         //alert('arr1 => ' + arr);
         $.each(arr, function(index, item) { // 챌린지제목 길이 자르기용   		
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
          
         var arr2 = new Array();
         
         <c:forEach var="timeChg_num" items="${chatbotList}">
                     arr2.push({
                    	 chg_num_dumi:"${timeChg_num.chg_num}" 
                     });
         </c:forEach>
         
         //alert('arr2 =>'+arr2);
         
         var chg_regdate = "";
         var chg_startdate = "";
         var chg_enddate = "";
         var chg_capacity = "";
         var chg_now_parti = "";
         
         $.each(arr2,function(index2, item2) {
			   
        	// alert('chg_num =>' + item2.chg_num_dumi);
        	 
        	 $.ajax({
        		 url:"getChgTimeChk",
        		 data:{chg_num : item2.chg_num_dumi},
        		 dataType:'json',
        		 success : function(data){
        			 //var jsondata = JSON.stringify(data);
    				 //alert('jsondata=>'+jsondata);
    				 $(data).each(
    							function(){
    									
    								chg_regdate = this.chg_regdate;
    			        			chg_startdate = this.chg_startdate;
    			        			chg_enddate = this.chg_enddate;
    			        			chg_capacity = this.chg_capacity;
    			        			chg_now_parti = this.chg_now_parti;
    								
    			        			var wj_chg_startdate = new Date(chg_startdate);
    			    	        	var wj_chg_regdate = new Date(chg_regdate);
    			    	        	var wj_chg_enddate = new Date(chg_enddate);
    			    	        	
    			    	        	
    			    	        	if(wj_chg_regdate <= now && chg_now_parti < chg_capacity){
    			   		      	     // alert(wj_chg_regdate);
    			   		      	     
    			   		      	   	if(wj_chg_startdate < now){
    			   		                                    
    			   		           		 if(wj_chg_enddate <= now){
    			   		           		        $('#chatbotListTime'+index2).append("챌린지종료");
    			   		          		  } else{
    			   			          			var distance = now - wj_chg_startdate; //진행중
    			   			    	        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    			   			    	        	$('#chatbotListTime'+index2).append("진행중 D+"+days);
    			   			    	        	 // $('div#chatbotList'+index2).empty(); // 삭제
    			   		        				}
    			   		           		 
    			   		        	}else if (wj_chg_startdate = now){
    			   		        		$('#chatbotListTime'+index2).append("D-DAY");
    			   		      			} 
    			   		       }else if(chg_now_parti >= chg_capacity){
    			   		    	        $('#chatbotListTime'+index2).append("인원마감");
    			   		       }else{
    			   		      		var distance = now - wj_chg_startdate; //모집중
    			   		        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    			   		        	$('#chatbotListTime'+index2).append("모집중 D"+days);
    			   		       	  }
    			        		
    			    	       
    			    	        	   								
    							}
    							
    							//alert('chg_regdate =>' + chg_regdate);
    						 );
        		//	 alert('data 넘어온 값 :' + this.chg_sample_text);
        		//	 alert('data 넘어온 값 :' + this.chg_regdate);
        		 }
        	 });
		}); 
	});
   
     
     
     
     function getCategoryLc_num(Vlc_num) { //대분류 선택했을때
		categorystr1 = "";
    	//alert('getCategoryLc_num =>' + Vlc_num);
    	$('#categorylc_num').val(Vlc_num);
	    $('#btaglc_num').html(Vlc_num);
		$.ajax({
			  url:"getCategoryLcNum",
			  data:{lc_num : Vlc_num},
			  dataType:'json',
			  success:function(data){
				   //$('div').remove('.divCategory_menu');
				   $('div.divCategory_menu').empty();
					// var jsondata = JSON.stringify(data);
					// alert('jsondata=>'+jsondata);	
 				  $(data).each(
					 function() {
						 categorystr1 += "<button class='divLcnum_css' onclick='getCategoryMc_num("+Vlc_num+","+ this.mc_num +")' >";
						 categorystr1 += this.subject;
						 categorystr1 += "</button>";						 
					}	  				  				  
				  );
				  $('#category_menu').append(categorystr1);

 		       }
		});
	}
     
     
     function getCategoryMc_num(Vlc_num,Vmc_num) { // 중분류 선택햇을때
 		categorystr2 = "";
     	//alert('getCategoryLc_num =>' + Vmc_num);
     	$('#categorymc_num').val(Vmc_num);
 	    $('#btagmc_num').html(Vmc_num);
 		$.ajax({
 			  url:"getCategoryMcNum",
 			  data:{lc_num : Vlc_num, mc_num : Vmc_num},
 			  dataType:'json',
 			  success:function(data){
 				   //$('div').remove('.divCategory_menu');
 				   $('div.divCategory_menu').empty();
 					// var jsondata = JSON.stringify(data);
 					// alert('jsondata=>'+jsondata);	
  				  $(data).each(
 					 function() {
 						 categorystr2 += "<button class='divLcnum_css' onclick='getCategorysc_num("+Vlc_num+","+ Vmc_num +","+ this.sc_num +")' >";
 						 categorystr2 += this.subject;
 						 categorystr2 += "</button>";						 
 					}	  				  				  
 				  );
 				  $('#category_menu').append(categorystr2);

  		       }
 		});
 	} 
     
     
     function getCategorysc_num(Vlc_num,Vmc_num,Vsc_num) { //소분류 선택했을때
    	 categorystr3 = "";
    	 $('#categorysc_num').val(Vsc_num);
  	     $('#btagsc_num').html(Vsc_num);
  	     $('div.divCategory_menu').empty();
  	     categorystr3 += "<div class='divCategoryClick_LastFont'>";
  	     categorystr3 += "<b style='color:#ebd39f;'>모두</b>";
  	     categorystr3 += "<b style='color:#9f6e54;'>선택 하셨습니다.</b>";
  	     categorystr3 += "</div>";
         
  	     $('#category_menu').append(categorystr3);
	}
       
	    function getCategory_Back() { // 카테고리 뒤로가기 로직
			var lc_num_value = $('#categorylc_num').val();
			var mc_num_value = $('#categorymc_num').val();
			var sc_num_value = $('#categorysc_num').val();
			category_backstr ="";
			//alert('lc_num => ' + lc_num_value);
			//alert('mc_num => ' + mc_num_value);
			//console.log('sc_num => ' + sc_num_value);
			//alert('sc_num =>' + sc_num_value);
			//alert('sc_num_value.length->' + sc_num_value.length);
			if(sc_num_value === null || sc_num_value.length == 0){
				  // alert('sc_num은 널');
					   if(mc_num_value === null || mc_num_value.length == 0){
						    
							   if(lc_num_value === null || lc_num_value.length == 0){
								     alert('뒤로갈수없습니다.');   
							   }else{
								   $('#categorylc_num').val(null);
							 	   $('#btaglc_num').html(null);
							 	  $('div.divCategory_menu').empty();
							 	  category_backstr += "<button type='button' class='divLcnum_css' onclick='getCategoryLc_num(10)'>건강/피트니스</button>";
							 	  category_backstr += "<button type='button' class='divLcnum_css' onclick='getCategoryLc_num(20)'>학습/자기계발</button>";
							 	  category_backstr += "<button type='button' class='divLcnum_css' onclick='getCategoryLc_num(30)'>소설/힐링</button>";
							 	  category_backstr += "<button type='button' class='divLcnum_css' onclick='getCategoryLc_num(40)'>취미/기타</button>";
							      
							 	 $('#category_menu').append(category_backstr);
							   }
					   }else{
						   $('#categorymc_num').val(null);
					 	      $('#btagmc_num').html(null);
						   getCategoryLc_num(lc_num_value);
					   }
			}else {
				//alert('sc_num은 널이아님');
				  $('#categorysc_num').val(null);
		 	      $('#btagsc_num').html(null);
		 	    
				getCategoryMc_num(lc_num_value,mc_num_value);				
			}	    	
		}
	    
	    function checking() { // from 태그 보내기전에 null값인 애들 0으로 바꿈
			if(fr_ca.sc_num.value.length == 0){
				 $('#categorysc_num').val(0);
			}
			if(fr_ca.mc_num.value.length == 0){
				 $('#categorymc_num').val(0);
			}
			if(fr_ca.lc_num.value.length == 0){
				 alert('선택하고 검색해주세요.');
				 return false;
			}
			return true;
		}
</script>
<style type="text/css">
 
      .divsearch {
     margin-left: 400px;
     width:830px;
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
 
 .divLoveChallenge{
    margin-left: 400px;
    width:830px;
    border: 1px solid black; /* 추후에 삭제 */
 }
 
 .divLoveChallengeFont{
    font-size: 25px;
    font-family: 'yg-jalnan';
 }
 
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
 
 .divCategory{
    margin-left: 400px;
    width:830px;
    border: 1px solid black; /* 추후에 삭제 */
 }
 
 .divCategoryFont{
    display:inline-block;
    font-size: 25px;
    font-family: 'yg-jalnan';
 }
 
 .divCategory_menu{
    margin-left: 400px;
    width:830px;
    border: 1px solid black; /* 추후에 삭제 */
 }
 
 .divLcnum_css{
    display: inline-block;
    vertical-align: top;
    width:130px;
    height:130px;
    margin-bottom: 20px;
    margin-right: 20px;
    border-radius: 70%;
    font-family: 'yg-jalnan';
    font-size: 12px;
    background-color: #f7ceb6;
    text-align: center;
    line-height: 100px;
    border: 0;
    outline: none;
 }
 
 
 .divCategory_choice{
     margin-left: 400px;
    width:830px;
    border: 1px solid black;
    font-family: 'yg-jalnan';
    font-size: 15px;
 }
 
 .divCategoryClick_LastFont{
    width: 700px;
    height:130px;
    margin-top: 50px;
    margin-left:50px;
    font-family: 'yg-jalnan';
    font-size: 40px;
 }
 
 .buttonCategory_back{
    width: 100px;
    height: 30px;
    border-radius:30px;
    background-color:#f7ceb6;
    font-family: 'yg-jalnan';
    font-size: 15px;
    border: 0;
    outline: none;
 }
 
 .buttonCategory_search{
    width: 130px;
    height: 30px;
    border-radius:30px;
    background-color:#f7ceb6;
    font-family: 'yg-jalnan';
    font-size: 15px;
    border: 0;
    outline: none;
 }
 
 .divPointandLikeTop3{
    margin-left: 400px;
    width:830px;
    border: 1px solid black; /* 추후에 삭제 */
 }
 
 .divPointRankTop3{
    display: inline-block;
    vertical-align:top;
    width: 350px;
    height: 200px;
    border: 1px solid black; /* 추후에 삭제 */
 }
 
 .divLikeTop3{
    display: inline-block;
    vertical-align:top;
    width: 350px;
    height: 200px;
    margin-left: 90px;
    border: 1px solid black; /* 추후에 삭제 */
 }
 
 .divPointRankTop3Font{
    display:inline-block;
    font-size: 25px;
    font-family: 'yg-jalnan';
 }
 
 .divPointRankTop3more{
    display:inline-block;
    width:50px;
    margin-left:20px;
    font-size: 15px;
    color: #d3d3d3;
 }
 
 .divLikeTop3Font{
    display:inline-block;
    font-size: 25px;
    font-family: 'yg-jalnan';
 }
 
 .divLikeTop3more{
    display:inline-block;
    width:50px;
    margin-left:20px;
    font-size: 15px;
    color: #d3d3d3;
 }
 
 .divPointRankTop3List{
    /* 추후에 point list용 div만들예정 */
 }
 
 .divPointRankTop3Listblank{
    /* 추후에 point list용 div만들예정 */
 }
 
 .divLikeTop3List{
    /* 추후에 like list용 div만들예정 */
 }
 
 .divLikeTop3Listblank{
    /* 추후에 like list용 div만들예정 */
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
       <form action="mainSearch" method="post">
         <input type="hidden" name="user_id_email" value="${user_id_email}">
         <input type="hidden" name="user_nickname" value="${user_nickname}">
         <input type="hidden" name="user_image" value="${user_image}">
       <div class="divsearch">
       <div class="search"><input type="text" name="mainSearchName" required="required" placeholder="검색창" style=" font-size:15px;  width: 690px; height: 60px; border: 2px solid #9f6e54;"></div>
       <div class="search"><input type="submit" value="검색" style="width: 100px; height: 60px; border:0; background: #9f6e54; color: white;"></div>
       </div>
       </form>
    </div><!-- Search 부분 (제목 / 작성자 / 내용)end -->
    
    <div><!-- 추천 챌린지 부분 (우재님을 위한 추천 챌린지)start -->
         <div class="divLoveChallenge">
         <div class="divLoveChallengeFont"><b style="color:#ebd39f;">${user_nickname}</b>
                                           <b style="color:#9f6e54;">님을 위한 </b>
                                           <b style="color:#ebd39f;">추천 </b>
                                           <b style="color:#9f6e54;">챌린지</b>
                                           </div>
         </div>
    </div><!-- 추천 챌린지 부분 (우재님을 위한 추천 챌린지)end -->
      
      <div style="margin-top: 10px;"></div>
      
      <div>
         
         
          <div class="divLoveChallengeList">
                 <c:choose>
                  <c:when test="${chatbotList.size() > 0 }">
                   <c:forEach var="chatbotList" items="${chatbotList}" varStatus="status">
                            <div class="divChatbotListBase" id="chatbotList${status.index}">
                                 <div class="divChatbotListImg">
                                    <a href="#"><img class="divChatbotListImgsize" alt="" src="upload/mainIMG/${chatbotList.chg_image}"></a>
                                    <div class="chatbotUser_count">
                                         <div class="divChatbotUser_count_img"><img alt="" src="teamtwo/img/wj_board_user_icon.png" class="chatbotUser_count_img"></div>
                                         <div class="divChatbotUser_count">${chatbotList.chg_now_parti}명</div>
                                    </div>
                                 </div>
                                  <div class="divChatbotListTitle"><a href="challengeDetail?chg_num=${chatbotList.chg_num }&user_id_email=${user_model.getUser_id_email()}&user_nickname=${user_model.getUser_nickname()}&user_image=${user_model.getUser_image()}" id="titleCut${status.index}" class="divChatbotListTitleFont"></a></div>
                                  <div class="chatbotListTimeFont"><div id="chatbotListTime${status.index}"></div></div>
                                  <c:set var="hashtag" value="${fn:split(chatbotList.hashtag_text,',')}"/>
                                  <c:forEach var="hashtag_text" items="${hashtag}" varStatus="status2">
                                         <div class="divHashtag">${hashtag_text}</div>
                                  </c:forEach>
                                  
                                  
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
      
    <div> <!-- Categori title부분 (카테고리별로 보기)start -->
         <div class="divCategory">
         <div class="divCategoryFont"><b style="color:#ebd39f;">카테고리별</b>
                                      <b style="color:#9f6e54;">로 보기</b></div>
         </div>
    </div> <!-- Categori title부분 (카테고리별로 보기)end -->
       
       <div style="margin-top: 10px;"></div>
       
    <div><!-- Category Menu 부분 (코딩 / 다이어트 / 운동 / 저축 )start -->
         <div class="divCategory_menu" id="category_menu">
         <button type="button" class="divLcnum_css" onclick="getCategoryLc_num(10)">건강/피트니스</button>
         <button type="button" class="divLcnum_css" onclick="getCategoryLc_num(20)">학습/자기계발</button>
         <button type="button" class="divLcnum_css" onclick="getCategoryLc_num(30)">소설/힐링</button>
         <button type="button" class="divLcnum_css" onclick="getCategoryLc_num(40)">취미/기타</button>
        </div>
        <div class="divCategory_choice">
                                        <form action="category_searchs" method="post" name="fr_ca" id="category_search" onsubmit="return checking()">
                                                <input type="hidden" name="user_id_email" value="${user_id_email}">
                                                <input type="hidden" name="user_nickname" value="${user_nickname}">
                                                <input type="hidden" name="user_image" value="${user_image}">
                                                <input type="hidden" name="lc_num" id="categorylc_num">
		                                        <input type="hidden" name="mc_num" id="categorymc_num">
		                                        <input type="hidden" name="sc_num" id="categorysc_num">
                                        </form>                                       
                                        <button type="submit" class="buttonCategory_search" form="category_search">카테고리 검색</button>
                                        <button type="button" class="buttonCategory_back" onclick="getCategory_Back()">뒤로..</button>
                                        <b style="color:#9f6e54;">선택한</b>
                                        <b style="color:#ebd39f;">카테고리 : </b>
                                        <b id="btaglc_num"></b>
                                        <b id="btagmc_num"></b>
                                        <b id="btagsc_num"></b>
                                        </div>
                                                                          
    </div><!-- Categori Menu 부분 (코딩 / 다이어트 / 운동 / 저축 )end -->
       
       <div style="margin-top: 30px;"></div>
       
    <div><!-- Point Rank Top3 (더보기를 누르면 랭킹으로 이동) / Like Board Top3 (더보기를 누르면 커뮤니티로 이동) 부분 start -->
         <div class="divPointandLikeTop3">
              <div class="divPointRankTop3">
                  <div class="divPointRankTop3Font"><b style="color:#9f6e54;">열매 랭킹</b>
                                                    <b style="color:#ebd39f;"> TOP3</b></div>
                  <div class="divPointRankTop3more"><a href="#" class="aMoretag">more..</a></div>
                  <div>                     
                  </div>
              </div>
              
              <div class="divLikeTop3">
                  <div class="divLikeTop3Font"><b style="color:#9f6e54;">인기 게시물</b>
                                               <b style="color:#ebd39f;"> TOP3</b></div>
                  <div class="divLikeTop3more"><a href="#" class="aMoretag">more..</a></div>
                  <div>                     
                  </div>
                  </div>
              </div>
    </div><!-- Point Rank Top3 (더보기를 누르면 랭킹으로 이동) / Like Board Top3 (더보기를 누르면 커뮤니티로 이동) 부분 end -->
      
      <div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>

</body>
</html>