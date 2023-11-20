<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
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
                    <form action="updateQuestion.do" method="post">
                        <div class="inquiry-form">
                            <h2>문의사항 수정</h2>
                            <hr>

                            <!-- 여기서 qsNumber는 수정하려는 문의사항의 고유 번호 -->
                            <input type="hidden" name="qsNumber" value="${question.qsNumber}">

                            <div class="center-selection">
                                <p>센터 선택</p>
                                <select id="centerSelect" name="ctCode" disabled>
                                    <c:forEach items="${connectedCenters}" var="center">
                                        <option value="${center.ctCode}" ${center.ctCode == question.ctCode ? 'selected' : ''}>${center.ctName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="input-section">
                                <p>문의하실 제목을 입력해주세요</p>                              
                                <input type="text" name="qsTitle" value="${question.qsTitle}">
                            </div>
                            <div class="input-section">
                                <p>문의하실 내용을 입력해주세요</p>
                                <textarea name="qsContent">${question.qsContent}</textarea>
                            </div>

                            <button class="submit-button">수정하기</button>
                        </div>
                    </form>
                </div>
            </main>
			
			<area2>
			<p>area2</p>
			</area2>
		</section>

	</div>
</body>
</html>