<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세</title>
</head>
<script type="text/javascript" src="/js/script.js"></script>
<body>
<div align="center">
		<h1>글 목록</h1>
		<hr>
		<h3>센터 프로필</h3>
		<table>
			<tr>
				<th>센터코드</th>
				<td>${center.ctCode }</td>
			</tr>
			<tr>
				<th>센터이름</th>
				<td>${center.ctName }</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${center.ctAddress1}${center.ctAddress2 }${center.ctAddress3 }</td>
			</tr>
			<tr>
				<th>센터번호</th>
				<td>${center.ctPhoneNumber1 }${center.ctPhoneNumber2 }${center.ctPhoneNumber3 }</td>
			</tr>
			<tr>
				<th>계약일</th>
				<td>${center.contractStartDate }</td>
			</tr>
			<tr>
				<th>계약만료일</th>
				<td>${center.contractEndDate }</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${center.ctId }</td>
			</tr>
			<tr>
				<th>계약 상태</th>
				<!-- 만료여부 Y이면 만료/해지여부 Y이면 해지/둘 다 N값이면 계약  -->
				<c:choose>
					<c:when	test="${center.contractExpiryYN eq false and center.contractRevokeYN eq false}">
						<td>계약</td>
					</c:when>
					<c:when test="${center.contractExpiryYN eq true and center.contractRevokeYN eq false}">
						<td>만료</td>
					</c:when>
					<c:when	test="${center.contractExpiryYN eq false and center.contractRevokeYN eq true}">
						<td>해지</td>
					</c:when>
				</c:choose>
			</tr>
			<tr>
				<th>만료여부</th> 
				<td>${center.contractExpiryYN }</td>
			</tr>
		</table>
		<hr>		
		<h3>대표자 정보</h3>
		<table>
			<tr>
				<th>대표자 이름</th>
				<td>${center.ownerName }</td>
			</tr>
			<tr>
				<th>대표자 이메일</th>
				<td>${center.ownerEmail }</td>
			</tr>
			<tr>
				<th>대표자 번호</th>
				<td>${center.ownerPhoneNumber1 }${center.ownerPhoneNumber2 }${center.ownerPhoneNumber3 }</td>
			</tr>
			<tr>
				<th>사업자 등록 번호</th>
				<td>${center.businessRegistrationNumber}</td>
			</tr>
		</table>
		
		<button onclick="alert('해지하면 계약상태를 되돌릴 수 없습니다. 정말로 해지하시겠습니까?')">계약해지</button>
		<button onclick="">비밀번호 초기화</button>
		
		
		<!-- 문자발송이력 테이블 추가해야 함 -->
		<hr>		
		<h3>문자발송이력</h3>
		<table>
		<!--
			<tr>
				<th>번호</th>
				<th>내용</th>
				<th>수신인</th>
				<th>발송일자</th>
			</tr>
			<c:if test="${# == null }">
				<tr>
					<td colspan="5">등록된 센터가 없습니다.</td>
				</tr>
			</c:if>
			<tr>
			
				<td>#</td>
				<td>#</td>
				<td>#</td>
				<td>#</td>
			
			</tr>
		-->
		</table>

		<a href="getBoardList.do">글 목록</a>
	</div>
</body>
</html>