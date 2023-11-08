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
		<form action="updateCenter.do" method="post">
		<table>
			<tr>
				<th>센터코드</th>
				<td><input type="hidden" name="ctCode" value="${center.ctCode }">${center.ctCode }</td>
			</tr>
			<tr>
				<th>센터이름</th>
				<td><input type="text" name="ctName" value=${center.ctName }></td>
			</tr>
			<!-- ########### 주소 가입에서 api 완료되면 바꿀 수 있도록 수정해야 함 ###########-->
			<tr>
				<th>주소</th>
				<td>${center.ctAddress1}${center.ctAddress2 }${center.ctAddress3 }</td>
			</tr>
			<!-- ################################################################## -->
			<tr>
				<th>센터번호</th>
				
				<td>
					<select class="tel" name="ctPhoneNumber1">
							<option value="02" selected="selected">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="033">033</option>
							<option value="041">041</option>
							<option value="042">042</option>
							<option value="043">043</option>
							<option value="044">044</option>
							<option value="051">051</option>
							<option value="052">052</option>
							<option value="053">053</option>
							<option value="054">054</option>
							<option value="055">055</option>
							<option value="061">061</option>
							<option value="062">062</option>
							<option value="063">063</option>
							<option value="064">064</option>
						</select>
						<input type="text" name="ctPhoneNumber2" value=${center.ctPhoneNumber2 }><input type="text" name="ctPhoneNumber3"  value=${center.ctPhoneNumber3 }> </p>
				</td>
			</tr>
			<tr>
				<th>계약일</th>
				<td><input type="date" name="contractStartDate" value=${center.contractStartDate }></td>
			</tr>
			<tr>
				<th>계약만료일</th>
				<td><input type="date" name="contractEndDate" value=${center.contractEndDate }></td>
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
				<td><input type="email" name="ownerEmail" value=${center.ownerEmail }><button onclick="#">중복확인</button></td>
			</tr>
			<tr>
				<th>대표자 번호</th>
				<td>
					<input type="text" name="ownerPhoneNumber1" value=${center.ownerPhoneNumber1 }><input type="text" name="ownerPhoneNumber2" value=${center.ownerPhoneNumber2 }><input type="text" name="ownerPhoneNumber3" value=${center.ownerPhoneNumber3 }>
				</td>
			</tr>
			<tr>
				<th>사업자 등록 번호</th>
				<td>${center.businessRegistrationNumber}</td>
			</tr>
		</table>
		<input type="submit" value="수정">		
		</form>

		<a href="getBoardList.do">글 목록</a>
	</div>
</body>
</html>