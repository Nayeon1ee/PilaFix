<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>센터 목록</title>
</head>
<body>

	<div align="center">
		<h1>센터 관리</h1>
		<hr>
		<table>
			<tr>
				<th>센터코드</th>
				<th>센터이름</th>
				<th>주소</th>
				<th>센터번호</th>
				<th>계약일</th>
				<th>계약만료일</th>
				<th>아이디</th> 
				<th>계약 상태</th> 
				<th>만료여부</th> 
			</tr>
			<c:if test="${centerList == null }">
				<tr>
					<td colspan="5">등록된 센터가 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="center" items="${centerList }">
				<tr>
					<td></td>
					<td></td>
					<td>${center.ctAddress1}${center.ctAddress2 }${center.ctAddress3 }</td>
					<td>${center.ctPhoneNumber1 }${center.ctPhoneNumber2 }${center.ctPhoneNumber3 }</td>
					<td>${center.contractStartDate }</td>
					<td>${center.contractEndDate }</td>
					<td>${center.ctId }</td>

					<!-- 계약 상태에 대한 처리 -->
					<!-- 만료여부 Y이면 만료/해지여부 Y이면 해지/둘 다 N값이면 계약  -->
					<c:choose>
						<c:when test="${center.contractExpiryYN eq false and center.contractRevokeYN eq false}">
							<td>계약</td>
						</c:when>
						<c:when test="${center.contractExpiryYN eq true and center.contractRevokeYN eq false}">
							<td>만료</td>
						</c:when>
						<c:when test="${center.contractExpiryYN eq false and center.contractRevokeYN eq true}">
							<td>해지</td>
						</c:when>
					</c:choose>

					<td>${center.contractExpiryYN }</td>
					
				</tr>
			</c:forEach>
		</table>
		<a href="insertCenter.do">센터 등록</a>
	</div>

</body>
</html>