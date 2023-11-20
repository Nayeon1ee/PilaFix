<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의사항</title>
        
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  

    <!-- Bootstrap CSS 추가 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap_Nayeon.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <div align="center">
        <h1>문의사항</h1>
        <div class="accordion" id="accordionExample">
            <c:forEach var="list" items="${questionList}">
                <div class="card">
                    <div class="card-header" id="heading${list.qsNumber}">
                        <h2 class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" 
                            data-target="#collapse${list.qsNumber}" aria-expanded="true" 
                            aria-controls="collapse${list.qsNumber}" onclick="loadQuestionDetails(${list.qsNumber})">
                            	<div>${list.qsTitle}</div>
        						<small>작성일: ${list.qsRegdate}</small> / <small>수정일: ${list.qsModifiedDate}</small>
                            </button>
                    <!-- 수정 버튼 (답변 대기 상태일 때만 활성화) -->
				    <c:if test="${!list.qsAnswerYn}">
				        <button onclick="location.href='updateQuestionForm.do?qsNumber=${list.qsNumber}'">수정</button>
				    </c:if>
				    <!-- 삭제 버튼 -->
				    <button data-bs-toggle="modal" data-bs-target="#deleteModal" onclick="setDeleteId(${list.qsNumber})">삭제</button>
                        </h2>
                    </div>

                    <div id="collapse${list.qsNumber}" class="collapse" aria-labelledby="heading${list.qsNumber}" data-parent="#accordionExample">
                        <div class="card-body">
                            <p>답변 여부: ${list.qsAnswerYn}</p>
                            <!-- AJAX로 불러온 답변 내용을 여기에 표시 -->
                            
                            <div id="detail-view-${list.qsNumber}"></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <br><br>
        <a href="insertQuestion.do">문의사항 작성</a>
        
        
        
<!-- 삭제 버튼 모달 -->
<div class="modal fade" id="deleteQuestionModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">정말 삭제하시겠습니까?</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                확인 버튼을 누르시면 다시 복구시킬 수 없습니다.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <!-- 여기서 deleteQuestion(${question.qsNumber})는 적절한 문의사항 삭제 함수로 대체해야 함 -->
                <button type="button" class="btn btn-primary" onclick="deleteQuestion(${question.qsNumber})">확인</button>
            </div>
        </div>
    </div>
</div>
    </div>

    <!-- Bootstrap JS 추가 -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
    
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script>
        function loadQuestionDetails(qsNumber) {
            $.ajax({
                type: "get",
                url: "getQuestionReplyOnJS.do",
                dataType: "json",
                data: { qsNumber: qsNumber },
                success: function (data) {
                    var output = "";
                    if(data && data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            output += "<p><strong>답변 번호:</strong> " + data[i].reNumber + "</p>";
                            output += "<p><strong>답변 제목:</strong> " + data[i].reTitle + "</p>";
                            output += "<p><strong>답변 내용:</strong> " + data[i].reContent + "</p>";
                            output += "<p><strong>답변 작성일:</strong> " + data[i].reRegdate + "</p>";

                        }
                    } else {
                        output = "<p>답변이 없습니다.</p>";
                    }
                    $('#detail-view-' + qsNumber).html(output);
                },
                error: function () {
                    console.log("Error loading question details");
                }
            });
        }

        
	    function deleteQuestion(qsNumber) {
	    		fetch('/pilafix/deleteQuestion.do?qsNumber=' + qsNumber, {
	    			method: 'GET'
	    		})
	    			.then(response => {
	    				if (!response.ok) {
	    					throw new Error('error');
	    				}
	    				window.location.href = 'getQuestionList.do'; // 커뮤니티 목록 페이지로 리다이렉트
	    			})
	    			.catch(error => {
	    				console.error(error);
	    			});
	    	
	    };
    </script>
  
</body>
</html>
