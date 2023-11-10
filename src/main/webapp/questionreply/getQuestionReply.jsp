<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
		<h1>글 목록</h1> 
		<hr>
		<table>
			<tr>
				<th>No</th>
				<td>${question.qsNumber }</td>
			</tr>
			<tr>
				<th>문의제목</th>
				<td>${question.qsTitle }</td>
			</tr>
			<tr>
				<th>문의내용</th>
				<td>${question.qsContent }</td>
			</tr>
			<tr>
				<th>작성자회원코드</th>
				<td>${question.qsWriterMemberCode }</td>
			</tr>
			<tr>
				<th>작성일자</th>
				<td>${question.qsRegdate }</td>
			</tr>
			<tr>
				<th>최근수정일자</th>
				<td>${question.qsModifiedDate }</td>
			</tr>
			<tr>
				<th>답변여부</th>
				<td>${question.qsAnswerYn }</td>
			</tr>
		</table>
		<hr>
		<table>
			<!-- 답변 영역 -->
			<c:choose>
                <c:when test="${question.qsAnswerYn == true && not empty questionReply}"> <!-- 답변여부가 Y이면서, reply가 null이 아니면  -->
					<tr>
						<th>No</th>
						<td>${questionReply.reNumber }</td>
					</tr>
					<tr>
						<th>답변제목</th>
						<td>${questionReply.reTitle }</td>
					</tr>
					<tr>
						<th>답변내용</th>
						<td>${questionReply.reContent }</td>
					</tr>
					<tr>
						<th>작성자권한코드</th>
						<td>${questionReply.writerRoleCode }</td>
					</tr>
					<tr>
						<th>작성자회원코드</th>
						<td>${questionReply.writerMemberCode }</td>
					</tr>
					<tr>
						<th>작성일시</th>
						<td>${questionReply.reRegdate }</td>
					</tr>
					<tr>
						<th>원글유형</th>
						<td>${questionReply.reTargetPostType }</td>
					</tr>
					<tr>
						<th>원글번호</th>
						<td>${questionReply.reTargetPostNumber }</td>
					</tr>
                </c:when>
                <c:otherwise>
					<form action="insertQuestionReply.do" method="post">
						<input type="hidden" name="reTargetPostNumber" value="${question.qsNumber}">
                		
                		<%--  
                		############### 센터 로그인 완료되면 ###########
                		<input type="hidden" name="writerMemberCode" value="여기에 세션에서 센터코드 뽑기" >
                		--> 회원의 문의사항에 답변이 보이게 
                		#######################################
                		--%>
                		
                		<tr>
							<td>답변제목 <input type="text" name="reTitle"></td>
						</tr>
						<tr>
							<td>답변내용 <input type="text" name="reContent"></td>
						</tr>
						<tr>
							<td><input type="submit" value="답변등록"></td>
						</tr>
					</form>
                </c:otherwise>
            </c:choose>
			</table>
		
		<a href="deleteQuestionReply.do?reNumber=${questionReply.reNumber }">삭제</a></td>		
		<a href="getQuestionReplyList.do">글 목록</a>
	</div>

</body>
</html>