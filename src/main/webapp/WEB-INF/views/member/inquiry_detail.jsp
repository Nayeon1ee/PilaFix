<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style_inquiryform.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container000">

		<section class="content000">
			<area1>
			<p>area1</p>
			</area1>

			<main>

				<div id="myPage">

					
					<form action="inquiry.do" >
					<div class="inquiry-form">
						<h2>문의사항</h2>
						<hr>

						<div class="center-selection">
						    <p>센터 선택</p>
						    <select id="centerSelect" name="ctCode">
						        <c:forEach items="${connectedCenters}" var="center">
						            <option value="${center.ctCode}">${center.ctName}</option>
						        </c:forEach>
						    </select>
						</div>
						<div class="input-section">
							<p>문의하실 제목을 입력해주세요</p>
							<input type="text">
						</div>

						<div class="input-section">
							<p>문의하실 내용을 입력해주세요</p>
							<textarea></textarea>
						</div>

						<button class="submit-button">문의하기</button>
					</div>
					</form>
			</main>
			
			<area2>
			<p>area2</p>
			</area2>
		</section>

	</div>
</body>
</html>