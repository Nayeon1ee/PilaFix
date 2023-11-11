<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 폼</title>
<!-- <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script> -->
</head>
<body>

<form action="insertFaqInfo.do" method="post">
	구분 
	<select id="selectbox" name="fqType" >
			<option value="COMMON" selected="selected">공통</option>
	    	<option value="ME" >회원</option>
	    	<option value="TR">강사</option>
	</select>
	FAQ 제목 <input type="text" name="fqTitle">
	FAQ 내용 <input type="text" name="fqContent">
	 
	<!-- <input type="radio" name="fqOpenYn" value=true>공개 
	<input type="radio" name="fqOpenYn" value=false>비공개 -->
	<input type="submit" value="가입">
</form>
<a href="getFaqInfoList.do">글 목록</a>
<!-- <script type="text/javascript">
	$(document).ready(function(){
		$("#selectbox").change(function(){
			$("#changeInput").val($(this).val());
		});
	}); 
</script> -->
</body>
	

</html>