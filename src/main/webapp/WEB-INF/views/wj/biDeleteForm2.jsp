<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 입고관리 삭제</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
table {
	width: 100%;
}
</style>

<script type="text/javascript">
	function chk() {
		var list = new Array();
		var bookname;
		var check1;
		var listCnt  = 0;
	 	<c:forEach items="${list }" var="list" >	
	        bookname = document.frm.bookname[listCnt++].value;
	        list.push(bookname);
		</c:forEach>
		
       alert("list.length->"+list.length);
       
       
		for (var i=0; i<list.length;){
			alert("list->"+ i + " :  "+ list[i++]);
		}
		return false;
	}	
	
	function fn_eaChange(index) {
		var i = index;
		var test;
		var check;

	test = document.frm.bookname[i].value;
	check = document.frm.check1[i].value;
	alert("test->"+test);
	alert("check->"+check);

	}
	function fn_chkClick(index) {
		var i = index;
		var test;
		var check;
		if(document.frm.check1[i].checked) {
		   document.frm.check1[i].value = '1';
		}else {
		   document.frm.check1[i].value = '0';
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

	<h2>도서 입고 리스트 삭제  --> biDeleteForm2.jsp</h2>
	<form action=""   name="frm" method="post"  onsubmit="return chk()">
			<table>
				<tr>
					<th>삭제구분</th>
					<th>도서 순서</th>
					<th>도서 유형</th>
					<th>도서 번호</th>
					<th>도서 일련번호</th>
					<th>도서명</th>
					<th>저자</th>
					<th>도서상태</th>
					<th>대여구분 </th>
				</tr>
				<c:if test="${totCnt > 0 }">
					<c:forEach var="bookIn" items="${list }"  varStatus="status" >
							<input type="hidden" name="book_kind"   value="${bookIn.book_kind}">
		                   <input type="hidden" name="bookno"          value="${bookIn.bookno}">
		                   <input type="hidden" name="bookseq"        value="${bookIn.bookseq}">
		                <%--    <input type="hidden" name="bookname"     value="${bookIn.bookname}"> --%>
				    	<%--   <input type="hidden" name="check"              value="${bookIn.check }"> --%>
						<tr>
							<td>
<!-- 	    					   <select name="check1" required="required"  >
										<option value="0">유지  </option>
										<option value="1">삭제  </option>
						      </select> 			
 -->						     
                               	삭제<input type="checkbox" name="check1" value="0" onclick="fn_chkClick(${status.index})"><br>
						      	       
							</td>
							<td>${startNum }</td>
							<td>${bookIn.book_kind }</td>
			    			<td>${bookIn.bookno }</td>
			    			<td>${bookIn.bookseq }</td>
							<td class=left width=200>
							        <c:if test="${bookIn.booklent_yn == 'Y'}">
								         	<img src='images/hot.gif'>
								   </c:if>
									    <input type="text" name="bookname"    id="bookname${status.index}"   onchange="fn_eaChange(${status.index})"    value="${bookIn.bookname}">
							</td>
							<td>${bookIn.write}</td>
							<td>${bookIn.bookstate}</td>
							<td>${bookIn.booklent_yn}</td>
						</tr>
						<c:set var="startNum" value="${startNum - 1 }" />
					</c:forEach>
				</c:if>
				<c:if test="${totCnt == 0 }">
					<tr>
						<td colspan=7>데이터가 없네</td>
					</tr>
				</c:if>
			</table>
			<tr>
			    <td><input type="submit" value="확인kk"></td>
				<td><input type="reset" value="다시작성"></td>
			</tr>			
	</form>
	<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href='biDeleteForm.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='biDeleteForm.do?pageNum=${i}'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='biDeleteForm.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div>
	
	<div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>
</body>
</html>