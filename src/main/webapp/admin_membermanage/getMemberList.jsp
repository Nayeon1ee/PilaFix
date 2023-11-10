<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
</head>
<body>

	<div align="center">
		<h1>회원 목록</h1>
		<hr>
		<table>
			<tr>
				<th>No</th>
				<th>가입유형</th>
				<th>이메일 아이디</th>
				<th>회원명</th>
				<th>생년월일</th>
				<th>가입일자</th>
				<th>회원상태</th> 
				<th>상세보기</th> 
			</tr>
			<c:if test="${memberList == null }">
				<tr>
					<td colspan="5">등록된 회원이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="member" items="${memberList }">
				<tr>
					<td>${member.csMemberCode }</td>
					<td>${member.csRegistrationType }</td>
					<td>${member.csEmailId }</td>
					<td>${member.csName }</td>
					<td>${member.csBirth }</td>
					<td>${member.csRegistrationDate }</td>

					<!-- 탈퇴 상태에 대한 처리 -->
					<!-- 탈퇴여부 Y이면 탈퇴회원 N이면 일반회원-->
					<c:choose>
						<c:when test="${member.csDeleteYn}">
							<td>탈퇴회원</td>
						</c:when>
						<c:otherwise>
							<td>일반회원</td>
						</c:otherwise>
					</c:choose>

					<td><a href="getMember.do?csMemberCode=${member.csMemberCode }">상세보기</a></td>
					
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>