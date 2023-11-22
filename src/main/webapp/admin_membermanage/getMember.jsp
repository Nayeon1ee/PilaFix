<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세</title>
</head>
<body>
<div align="center">
		<h1>회원 상세 조회</h1>
		<hr>
		<h3>회원 프로필</h3>
		<table>
			<tr>
				<th>이름</th>
				<td>${member.csName }</td>
			</tr>
			<tr>
				<th>이메일 아이디</th>
				<td>${member.csEmailId }</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${member.csPhoneNumber1 }${member.csPhoneNumber2 }${member.csPhoneNumber3 }</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>${member.csBirth }</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${member.csGenderMw }</td>
			</tr>
			<tr>
				<th>회원가입일</th>
				<td>${member.csRegistrationDate }</td>
			</tr>
			<tr>
				<th>회원 상태</th>
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
				

			</tr>
			<tr>
				<th>가입유형</th> 
				<td>${member.csRegistrationType }</td>
			</tr>
			<tr>
				<th>현재 연동 센터</th> 
				<td>${member.connectedCenterCode1 }&nbsp;${member.connectedCenterCode2 }&nbsp;${member.connectedCenterCode3 }</td>
			</tr>
			
		</table>
		<a href="getMemberList.do">글 목록</a>
	
		
		<c:if test="${type ne 'T' }">
				<!-- 강사의 경우 해당 화면이 보이지 않음  -->
				<hr>		
				<h3>수강권 결제내역</h3>
				<table>
					<tr>
						<th>번호</th>
						<th>수강권명</th>
						<th>센터명</th>
						<th>결제일자</th>
						<th>결제수단</th>
						<th>결제금액</th>
					</tr>
					<c:if test="${paymentList == null}">
						<tr>
							<td colspan="5">결제 내역이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="pay" items="${paymentList }">
						<tr>
							<td>${pay.paId }</td>
							<td>${pay.ticketCode }</td> <!-- 티켓코드에서 센터명 가져와야 함 --> 
							<td>${pay.ticketCode }</td> <!-- 티켓코드에서 센터명 가져와야 함 --> 
							<td>${pay.paDatetime }</td>
							<td>${pay.paMethod }</td>
							<td>${pay.paAmount }</td>
						</tr>
					</c:forEach>
				</table>
				<br><br>
		</c:if>

		
		<!-- 연동 센터 이력 추가해야 함 -->
		<hr>		
		<h3>연동 센터 이력</h3>
		<table>
			<tr>
				<th>번호</th>
				<th>센터명</th>
				<th>주소</th>
			</tr>
			<c:if test="${centerConnectList == null }">
				<tr>
					<td colspan="5">연동된 센터가 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="center" items="${centerConnectList }">
				<tr>
					<td>${center.chCode  }</td>
					<td>${center.centerName }</td> <!--센터코드로 센터명 가져와야 함-->
					<td>${center.centerName }</td><!--센터코드로 센터주소 가져와야 함-->
				</tr>
			</c:forEach>
		</table>

	
	</div>
</body>
</html>