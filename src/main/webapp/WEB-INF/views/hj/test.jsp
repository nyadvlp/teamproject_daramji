<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(".replyUpdateBtn").on("click", function(){
	location.href = "/board/replyUpdateView?bno=${read.bno}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}"
					+ "&rno="+$(this).attr("data-rno");
});
</script>
</head>
<body>
	<div>
  <button type="button" class="replyUpdateBtn" data-rno="${replyList.rno}">수정</button>
  <button type="button" class="replyDeleteBtn" data-rno="${replyList.rno}">삭제</button>
</div>
</body>
</html>