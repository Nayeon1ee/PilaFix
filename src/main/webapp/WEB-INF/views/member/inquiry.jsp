<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html lang="kor">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Services - PILAFIX Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/animate.css/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link
	href="${pageContext.request.contextPath}/resources/member/assets/css/style.css"
	rel="stylesheet">
 <!-- 기존의 메타 태그, 스크립트, 링크 등 -->

    <style>
        .reply-content {
            padding: 10px;
            margin-top: 10px;
            background-color: #f9f9f9;
            border-radius: 5px;
        }

        .reply-title, .reply-body {
            margin-bottom: 10px;
        }

        .reply-title p, .reply-body p {
            margin-left: 10px;
            color: #333;
        }

        hr {
            border-top: 1px solid #ccc;
        }
    </style>
</head>
<!-- 내 css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style_manager_inquiry.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap_common_0.css">


<body>
    <script>
        var qsNumberToIndexMap = {};

        <c:forEach items="${questionList}" var="question" varStatus="status">
            // 각 문의사항 번호와 아코디언 인덱스를 매핑
            qsNumberToIndexMap['${question.qsNumber}'] = ${status.index};
        </c:forEach>
    </script>
    
    

	<!-- ======= Header ======= -->
	<%@ include file="member_header_common.jsp"%>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container" style="max-width: 1000px">

				<ol>
					<li><a href="main.do">Home</a></li>
					<li>inquiry</li>
				</ol>
				<h2>문의사항</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container mx-auto" style="max-width: 700px;">



				<div id="userInfo" class="d-flex align-items-center mb-2">
					<div id="myInfoLink" class="ms-4 mr-2"
						style="font-size: 18px; color: #9b56e9; font-weight: bold; text-decoration: none;">
						<i class="fas fa-cog mr-1"></i>내 정보 관리
					</div>
				</div>

					<div class="inquiry">
						<div class="inquiry-header mb-3">
							<button class="inquiry-button my-2" style="font-size: 18px;" onclick="location.href='insertQuestion.do'">센터문의하기</button>
						</div>

						<div class="inquiry-history">
							<h2>나의 문의 내역</h2>
							<hr>

							<div class="accordion mt-4" id="accordionExample">

<c:forEach items="${questionList}" var="question" varStatus="status">
    <div class="accordion-item">
        <h2 class="accordion-header" id="heading${status.index}">
            <button class="accordion-button" type="button"
                    data-bs-toggle="collapse" data-bs-target="#collapse${status.index}"
                    aria-expanded="true" aria-controls="collapse${status.index}"
                    data-qsNumber="${question.qsNumber}"
                    onclick="loadReply(${question.qsNumber})">
                <div class="inquiry-item">
                    <div class="inquiry-details">
                        <div class="inquiry-title">문의제목: ${question.qsTitle}</div>
                        <small>작성일자: ${question.qsRegdate}</small>
                        <small>수정일자: ${question.qsModifiedDate}</small>
                    </div>
                    <div class="inquiry-location">
                        <p>${question.qsAnswerYn ? '답변완료' : '답변대기'}</p>
                    </div>
                </div>
            </button>
        </h2>
        <div id="collapse${status.index}" class="accordion-collapse collapse"
             aria-labelledby="heading${status.index}" data-bs-parent="#accordionExample">
            <div class="accordion-body">
            <div class="inquiry-body">
                <strong>문의내역</strong><br> ${question.qsContent}
</div>
                <div class="text-center d-flex justify-content-end mt-2">
                    <!-- 삭제 -->
                    <!-- <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#basicModal">삭제</button> -->
                    <button type="button" class="btn btn-danger me-2" data-bs-toggle="modal" data-bs-target="#basicModal" onclick="openDeleteModal(${question.qsNumber})">삭제</button>

                    <!-- 답변이 없는 경우에만 수정 버튼 표시 -->
                    <c:if test="${!question.qsAnswerYn}">
                        <button type="button" class="btn btn-primary me-2" onclick="location.href='updateQuestion.do?qsNumber=${question.qsNumber}'">수정</button>
                    </c:if>
                </div>

                <!-- 답변 섹션 -->
                <div class="reply-content" id="replySection${status.index}">
                    <c:if test="${question.qsAnswerYn}">
                        <strong>답변 제목:</strong>
                        <p>${questionReply.reTitle}</p>
                        <hr>
                        <strong>답변 내용:</strong>
                        <p>${questionReply.reContent}</p>
                    </c:if>
                    <c:if test="${!question.qsAnswerYn}">
                        <p>등록된 답변이 없습니다.</p>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
     <input type="hidden" id="qsNumberHidden" value="${question.qsNumber}">
</c:forEach>
						</div>
					</div>
					<!-- End Our Skills Section -->
				</div>
	</section>

<!-- 삭제 버튼 모달 -->
<div class="modal fade" id="basicModal" tabindex="-1">
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
           <h5 class="modal-title">정말 삭제하시겠습니까?</h5>
           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <div class="modal-body">
           확인 버튼을 누르시면 다시 복구시킬 수 없습니다.
         </div>
         
     <input type="hidden" id="currentQsNumber" value="">    
         
     <div class="modal-footer">
       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
       <button type="button" class="btn btn-primary" onclick="deleteQuestion()">확인</button>
     </div>
       </div>
     </div>
   </div>
</main><!-- End #main -->
 

<!-- 모달의 확인 버튼 클릭 시 삭제를 진행하는 스크립트 -->
<script>
//현재 문의사항 번호를 모달에 설정하고 모달을 표시하는 함수
function openDeleteModal(qsNumber) {
    $("#currentQsNumber").val(qsNumber);
    $("#basicModal").modal('show');
}

// 모달에서 '확인' 버튼을 클릭할 때 호출되는 함수
function deleteQuestion() {
    var qsNumber = $("#currentQsNumber").val();
    fetch('/pilafix/deleteQuestion.do?qsNumber=' + qsNumber, {
        method: 'GET'
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        window.location.href = 'getQuestionList.do';
    })
    .catch(error => {
        console.error('There has been a problem with your fetch operation:', error);
    });
}
</script>	
	
	
<script>
// 답변 내용 불러오는 함수
// loadReply 함수 내에서 Ajax 요청을 수행하도록 수정
function loadReply(qsNumber) {
    qsNumber = qsNumber.toString();
    const accordionIndex = qsNumberToIndexMap[qsNumber];
    const replyContent = document.querySelector('#replySection' + accordionIndex);

    const url = 'getQuestionReplyOnJS.do?qsNumber=' + qsNumber;
    fetch(url)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json(); // JSON 데이터로 변환
        })
        .then(data => {
            // 여기서 답변 내용을 업데이트
            replyContent.innerHTML = '<strong>답변 제목:</strong> ' + data.replyTitle + '<br><strong>답변 내용:</strong> ' + data.replyContent;
        })
        .catch(error => {
            console.error('Error:', error);
        });
}
const accordionButtons = document.querySelectorAll('.accordion-button');
accordionButtons.forEach(button => {
    button.addEventListener('click', function () {
        const qsNumber = this.getAttribute('data-qsNumber');
        loadReply(qsNumber);
    });
});
</script>	


	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="member_footer_common.jsp"%>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- 내 js -->

	<script
		src="${pageContext.request.contextPath}/resources/js/quiry_inquiry.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
	<!-- Vendor JS Files -->
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/php-email-form/validate.js"></script>

<!--  아코디언 스크립트 -->
<script>
document.addEventListener("DOMContentLoaded", function () {
    var accordionButtons = document.querySelectorAll('.accordion-button');

    accordionButtons.forEach(function (button) {
        button.addEventListener('click', function () {
            console.log('Button clicked!');

            // 현재 버튼의 아코디언 바디에 색상 적용
            var accordionBody = this.closest('.accordion-item').querySelector('.accordion-body');
            accordionBody.style.backgroundColor = this.classList.contains('collapsed') ? '#f5f3ff' : '#fff';

            // 클릭한 버튼이 이미 열린 상태라면 닫음
            if (!this.classList.contains('collapsed')) {
                this.classList.add('collapsed');
                accordionBody.style.backgroundColor = '#f5f3ff';
            } else {
                // 클릭 시 다른 아코디언 버튼들을 닫음
                accordionButtons.forEach(function (otherButton) {
                    if (otherButton !== button) {
                        otherButton.classList.add('collapsed');
                        var otherAccordionBody = otherButton.closest('.accordion-item').querySelector('.accordion-body');
                        otherAccordionBody.style.backgroundColor = '#f5f3ff';
                    }
                });

                // 현재 버튼 열기
                this.classList.remove('collapsed');
                accordionBody.style.backgroundColor = '#fff';
            }
        });
    });
});
</script>
	<!-- Template Main JS File -->
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/js/main.js"></script>

</body>

</html>