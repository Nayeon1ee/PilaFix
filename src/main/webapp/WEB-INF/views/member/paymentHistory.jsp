<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="kor">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Services - PILAFIX Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

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

<!-- 내가 넣은 js -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<!-- 내 css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style_paymentHistory.css">

<body>

	<!-- ======= Header ======= -->
	<%@ include file="member_header_common.jsp"%>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container" style="max-width: 1000px">

				<ol>
					<li><a href="main.do">Home</a></li>
					<li>payment History</li>
				</ol>
				<h2>결제내역</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
		<!-- 결체취소 카드 부분 전체 영역 -->
			<div class="container mx-auto" style="max-width: 700px;">

				<div id="userInfo" class="d-flex align-items-center mb-2">
					<div id="myInfoLink" class="ms-4 mr-2"
						style="font-size: 18px; color: #9b56e9; font-weight: bold; text-decoration: none;">
						<i class="fas fa-cog mr-1"></i>내 정보 관리
					</div>
				</div>
					
					<!-- 결제 정보 카드 -->
					<c:forEach var="paymentInfo" items="${paymentInfo}">
					<div class="payment-history">
						<div class="payment-item">
						
							<div class="payment-status">
								<c:choose>
									<c:when test="${paymentInfo.paCancelYn eq true}">결제 취소</c:when>
									<c:otherwise>결제완료</c:otherwise>
								</c:choose>
								<span class="payment-id">(${paymentInfo.paId})</span>
							</div>
							<div class="payment-details">
								<div class="payment-description">${paymentInfo.centerName} [${paymentInfo.paMethod }결제]</div>
								<!-- 결체취소 가능시간이 24시간이라 24시간 지나면 결제 취소 글씨 없어짐 / 결제 취소한 건에는 시간 상관없이 결제 취소 글자 없어야함 -->
								<c:choose>
									<c:when test="${paymentInfo.paCancelYn eq true}"></c:when>
									<c:otherwise>
										<c:set var="currentTime" value="<%=System.currentTimeMillis()%>" />
										<c:set var="expiryDateTime" value="${paymentInfo.paDateTime.time + (24*60*60*1000)}" />
										<c:if test="${expiryDateTime gt currentTime}">
										    <button type="button" class="btn btn-sm btn-secondary" style="float:right" onclick="cancelPayment('${paymentInfo.paId}','${paymentInfo.tkLessonType}','${paymentInfo.tkUsageCount }')">결제취소</button>
										</c:if>
									</c:otherwise>
								</c:choose>
								
								<div class="payment-description">${paymentInfo.tkCapacity }:1 ${paymentInfo.tkLessonType}레슨 ${paymentInfo.tkUsageCount }회(${paymentInfo.tkUsageNumMonth}개월)</div>
								<div class="payment-amount">${paymentInfo.paAmount}원
								<span class="payment-date">${paymentInfo.paDateTime}</span>
								</div>
							
						</div>
					</div>
					</c:forEach>
					
					
		<!-- 결제취소 요청시 수강권횟수와 보유수강권의 횟수가 다를 때 보이는 모달  -->
				<div class="modal fade" id="failModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div
							class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<p>수강권을 사용하셔서 결제취소가 불가합니다.<br>
									결제 취소를 원하신다면 예약하신 수업을 취소하시고 다시 진행해주시기 바랍니다.
									</p>
									
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</button>
										<button type="button" class="btn btn-primary" onclick="location.href='/pilafix/schedule.do'" >내 스케줄로 이동</button>
								</div>
							</div>
						</div>
					</div>
				</div>		
		<!-- 결제취소 요청시 서버오류로 결제 실패한 경우 보이는 모달  -->
				<div class="modal fade" id="serverErrorfailModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div
							class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<p>서버오류로 결제 취소가 진행되지않았습니다.<br>
									다시 진행해주시기 바랍니다.
									</p>
									
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>		




				<!-- End Our Skills Section -->
			</div><!-- 결체치소 카드 부분 전체 영역 끝-->
		</section>
	</main>

	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="member_footer_common.jsp"%>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- 결제 취소 누르면 취소 요청하는 js -->
	<script>
    function cancelPayment(paymentId,tkType,tkUsageCount) {
        console.log("결제 번호: "+paymentId);
        console.log("수강권 타입: "+tkType);
        console.log("수강권 횟수: "+tkUsageCount);
        $.ajax({
            type: "POST",
            url: "memberCancel.do",
            data: {
            	imp_uid : paymentId,
            	tkLessonType :tkType,
            	tkUsageCount : tkUsageCount
            },
            success: function(response) {
            	//리턴값이 0이면 결제취소 완료/100이면 수강권은 사용안했지만 서버오류로 결제 실패/1이면 수강권 사용해서 결제 취소 진행 x
                if(response == 1){
                	$('#failModal').modal('show');
                }else{
                	if(response == 0){
                		alert("결제 취소 완료")
                		location.reload();
                	}else{
                		$('#serverErrorfailModal').modal('show');
                	}
                	
                }
            },
            error: function(error) {
                console.error("수강권횟수 확인 ajax 오류", error);
                $('#serverErrorfailModal').modal('show');
            }
        });
    }
    
  
</script>

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

	<!-- Template Main JS File -->
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/js/main.js"></script>

</body>

</html>