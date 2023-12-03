<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<!-- 내 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/style_bootstrap_common_0.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_ticket.css">

	
<!-- 내가 추가한 js -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 아임포트 SDK -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<!-- jQuery 
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>-->
</head>




<body>


	<!-- ======= Header ======= -->
	<%@ include file="member_header_common.jsp"%>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">

				<ol>
					<li><a href="main.do">Home</a></li>
					<li>ticket</li>
				</ol>
				<h2>수강권 신청</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container" style="max-width: 1080px">


				<!-- 7비율 잡기 위한 컨테이너 -->
				<div class="container">

					<div class="row">
						<div class="col-md-7 ticket border" style="max-height: 700px; width: 637px; overflow-y: auto; border-radius: 10px; border-style: solid; border-color: #9259e1; padding: 10px;">
							<!-- 7비율 잡기 위한 컨테이너 -->

							<!-- 센터 셀렉트 박스 -->
								<!-- 로그인한 회원코드의 연동된 센터가 없으면 수강권 구매할 수 없으므로 연동센터없으면 연동센터없다고 뿌려주고 있으면 그 센터의 이름 셀렉박스 옵션으로 넣어줌 -->
							<div class="text-center mt-3">
								<select class="form-select p-1" id="centerSelect" onchange="getCenterInfo()">
									<c:choose>
								<c:when test="${empty connCenterList}">
									<option selected>연동센터 없음</option>
								</c:when>
								<c:otherwise>
									<c:forEach var="center" items="${connCenterList}">
										<option selected disabled hidden>센터를 선택해주세요</option>
										<option value="${center.ctCode}">센터코드: ${center.ctCode}&센터이름: ${center.ctName}</option>
									</c:forEach>
								</c:otherwise>
							</c:choose>
								</select>
							</div>
							<!-- 셀렉트박스 끝 -->


							<!-- 버튼 부분 -->
							<div class="tab-buttons text-center">
								<ul class="nav nav-tabs justify-content-center mt-3"
									id="pills-tab" role="tablist">
									<li class="nav-item flex-grow-1" role="presentation"><a
										class="nav-link active" id="pills-all-tab"
										data-toggle="pill" href="#pills-all" role="tab"
										aria-controls="pills-group" aria-selected="true">전체</a></li>
									<li class="nav-item flex-grow-1" role="presentation"><a
										class="nav-link px-auto" id="pills-individual-tab"
										data-toggle="pill" href="#pills-individual" role="tab"
										aria-controls="pills-individual" aria-selected="false">개인</a>
									</li>
									<li class="nav-item flex-grow-1" role="presentation"><a
										class="nav-link px-auto" id="pills-group-tab"
										data-toggle="pill" href="#pills-group" role="tab"
										aria-controls="pills-group" aria-selected="false">그룹</a></li>
								</ul>
							</div>


							<!-- 수강권 시작 -->
							<div class="tab-pane fade show active" id="pills-all"
								role="tabpanel" aria-labelledby="pills-all-tab">
								<!-- 셀렉트박스에서 선택한 센터의 수강권 정보를 업데이트할 부분 -->
								<div class="list-group" id="centerInfoContainer">
										<!-- 여기에 수강권 리스트 ajax내용 들어감 -->
								</div>
							</div>



							<!--  개인 티켓 목록 -->
							<div class="tab-pane fade" id="pills-individual" role="tabpanel"
								aria-labelledby="pills-individual-tab">
								<!-- 추가 수강권... 데이터 넣기~ -->

								<div class="list-group-ticket" id="list-item">
									<a href="#" class="list-group-item list-group-item-action">
										<!-- 개인 티켓 예시 --> <!-- 내용은 전체 티켓과 동일하게 추가하거나 수정 -->
									</a>
								</div>
							</div>
							<!--  개인 티켓 목록 -->

							<!-- 3비율 잡기 위한 컨테이너-->
						</div>
						<!-- 기본으로 보여줄 이미지 -->
						<div class="col-md-5 content1 h-100" style="width: 406px;">
						<div class="content1-img" id="content1-disappear">
							<button type="button" id="clickButton"
								class="btn btn-lg btn-block px-5">
								<div class="card-body text-center mx-auto">
									<canvas id="coloredCanvas"></canvas>
									<h5 class="card-title mb-4">관심 가는 수강권을 클릭해보세요!</h5>
									
								
								</div>
							</button>
						</div>
						


				
				
				
				<!-- 클릭시 보여줄 이미지 -->
				<div class = "card-content1-replace" id="content1-replace">
					 <div class="card text-center">
						<div id="ticket-detail-info">
							<!-- 여기에 ajax결과 들어옴 -->
						</div>
						<div class="card-footer text-muted">이용정책</div>
						<div class="card-body pt-0" id="ticketBuyGuide">
								<!-- 여기에 ajax결과 들어옴 -->
							</div>
							<div class = "policy-area">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"> 
									<label class="form-check-label m-0" for="flexCheckDefault" style="margin:10px;"> 이용 정책을 모두 확인 하였습니다. 이에 동의합니다.</label>
							</div>
						 
							</div>
						<button class="btn btn-primary" id="ticketBuy">결제하기</button> 
						
					</div>
					</div>
					</div>
				</div>
				</div>
				

			</div> <!-- 전체 영역 -->
			
		<!-- Modal 보유 수강권 있으면 구매 못하게 하는  -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
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
									<p>이미 보유중인 수강권이 있습니다</p>
									<p>수강권을 다 사용하신 뒤 구매하시기 바랍니다.</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary"
										data-bs-dismiss="modal">확인</button>
								</div>
							</div>
						</div>
					</div>
				</div>
		<!-- 결제 완료시 보이는 모달  -->
				<div class="modal fade" id="purchaseModal" tabindex="-1"
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
									<p>결제가 성공적으로 완료되었습니다!<br>
									<strong>마이페이지</strong>에서 내 수강권을 확인하실 수 있습니다.
									</p>
									
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</button>
										<button type="button" class="btn btn-primary" onclick="location.href='/pilafix/ct.do'" >마이페이지 이동</button>
								</div>
							</div>
						</div>
					</div>
				</div>
		<!-- 결제 실패시 보이는 모달  -->
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
									<p>결제에 실패하였습니다.<br>
									다시 결제해주시기 바랍니다.
									</p>
									
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary"
										data-bs-dismiss="modal">확인</button>
								</div>
							</div>
						</div>
					</div>
				</div>
		<!-- 서버 로직처리실패시(디비에 정보저장 트랜잭션처리시 오류로 롤백되었을 때)보이는 모달  -->
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
									<p>서버 오류로 결제가 자동 취소처리 되었습니다.<br>
									결제를 원하시면 다시 시도해주시기 바랍니다.
									</p>
									
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary"
										data-bs-dismiss="modal">확인</button>
								</div>
							</div>
						</div>
					</div>
				</div>
		</section>
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="member_footer_common.jsp"%>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- 내 js -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
	<!--  이미지 색 바꾸기 위한 js -->
	<script>
		const canvas = document.getElementById('coloredCanvas');
		const ctx = canvas.getContext('2d');
		const image = new Image();
		image.src = '${pageContext.request.contextPath}/resources/images/hand.png';

		image.onload = function() {

			ctx.drawImage(image, 0, 0, canvas.width, canvas.height);

			ctx.globalCompositeOperation = 'source-atop';
			ctx.fillStyle = '#946CEE';
			ctx.fillRect(0, 0, canvas.width, canvas.height);

			ctx.globalCompositeOperation = 'source-over';
		};

		const button = document.getElementById('clickButton');
		button.addEventListener('click', function() {

		});
	</script>
	
<!-- 셀렉트박스에서 센터 선택하면 해당 센터의 수강권정보 가져오는 js  -->
	<script>
		function getCenterInfo() {
			var selectedCenterCode = document.getElementById("centerSelect").value;
			console.log("선택한 지점 코드 : " + selectedCenterCode);
			// Ajax 요청
			$.ajax({
						type : "Post",
						url : "getCenterTicketInfo.do", // 적절한 URL로 변경
						data : {ctCode : selectedCenterCode},
						success : function(centerTicketInfo) {
							// 성공 시 아래에 정보 업데이트
							console.log("값 가져옴")

							var str = "";
							//  centerInfoContainer라는 아이디 가진 영역의 기존 내용을 지움
							$('#centerInfoContainer').html('');
							if (centerTicketInfo.length < 1) {
								str = '<p style= "font-size: 18px; text-align: center; color: #333;">센터에서 등록한 수강권이 없습니다.<br> 센터에 문의하시기 바랍니다</p>'
								$('#centerInfoContainer').append(str);
							} else {
								centerTicketInfo.forEach(function(item) {
									

											/* 구매일로부터 사용기간 계산 */
											// 현재 날짜를 가져옴
											var currentDate = new Date();
											//tkUsageNumMonth 개월을 더한 날짜 계산
											var endDate = new Date(currentDate.getFullYear(),currentDate.getMonth()+ parseInt(item.tkUsageNumMonth),currentDate.getDate());
											// 날짜를 "YYYY-MM-DD" 형식으로 포맷
											var nowDate = currentDate.toISOString().split('T')[0];
											var ticketEndDate = endDate.toISOString().split('T')[0];

											str = '<a href="#" class="list-group-item list-group-item-action" id="'+item.tkCode+'">'
											str += '<div class="d-flex w-100 justify-content-between">'
											str += '<h5 class="mb-1">'+ item.tkCapacity + ':1'+ item.tkLessonType + ' 레슨'+ item.tkUsageCount + '회 ('+ item.tkUsageNumMonth+ '개월)</h5>'
											str += '</div>'
											str += '<p class="mb-1">'+ item.tkName + '</p>'
											str += '<p class="mb-1">' + nowDate + "~"+ ticketEndDate + "</p>"
											str += '<span class="tkPrice">'+ item.tkPriceAddDot+'원 </span>';
											str += "</a>"
									
											// centerInfoContainer라는 아이디를 가진 영역에 위의 내용 삽입해줌
											$('#centerInfoContainer').append(str);
											
											// 수강권을 클릭하면 수강권 상세정보 가져오는 함수 실행
											$('#'+item.tkCode).click(function() {
												var tkCode = item.tkCode;
												var centerCode = item.centerCode;
												console.log("ajax요청으로 가져온 티켓코드: "+tkCode +" ajax요청으로 가져온 센터코드: "+centerCode)
												
												// Hide content1-img
												$('.content1-img').css('display', 'none');
										        // Show card-content1-replace
										        $('.card-content1-replace').css('display', 'block');
												showTicketDetails(tkCode,centerCode);
										});
								});

							}
						},
						error : function() {
							console.error("Ajax 요청 실패");
						}
					});
		}
		
		// 선택한 티켓 코드(tkCode,centerCode)를 기반으로 상세 정보,수강권 이용정책 디비가서 가져온다음 뿌려줌
		function showTicketDetails(tkCode,centerCode) {
			console.log("함수로 넘어온 티켓코드: "+tkCode +" 함수로 넘어온  센터코드: " +centerCode )
		    $.ajax({
		        type: "GET",  
		        url: "getTicketDetail.do",  
		        data: { 
		        		tkCode: tkCode,
		        		centerCode: centerCode
		        },
		        success: function(ticket) {
		            // 맵으로 받아온 상세 정보를 출력하거나 처리하는 코드(ticketGuide/ticketDetail)
		            //console.log("티켓 상세 정보 확인용: ", ticket.ticketDetail.tkName);
		        	var str = "";
		        	var content = "";
		        	
		        	/* 구매일로부터 사용기간 계산 */
					// 현재 날짜를 가져옴
					var currentDate = new Date();
					//tkUsageNumMonth 개월을 더한 날짜 계산
					var endDate = new Date(currentDate.getFullYear(),currentDate.getMonth()+ parseInt(ticket.ticketDetail.tkUsageNumMonth),currentDate.getDate());
					// 날짜를 "YYYY-MM-DD" 형식으로 포맷
					var nowDate = currentDate.toISOString().split('T')[0];
					var ticketEndDate = endDate.toISOString().split('T')[0];
					
		       		//  ticket-detail-info라는 아이디 가진 영역의 기존 내용을 지우고 ajax로 가져온 결과 뿌려줌
					$('#ticket-detail-info').html('');
					str = '<div class="card-footer text-muted">'+ticket.ticketDetail.tkName+'</div>'
					str += '<div class="card-body-detail ticket">'
					str += '<ul>'
					str += '<li class="ticket-list-li"><img class="bar-icon" alt="bar Image"> 수업 유형 :'+ ticket.ticketDetail.tkCapacity+':1'+ticket.ticketDetail.tkLessonType+'레슨</li>'
					str += '<li class="ticket-list-li"><img class="bar-icon" alt="bar Image"> 수업 횟수 :'+ ticket.ticketDetail.tkUsageCount +'회</li>'
					str += '<li class="ticket-list-li"><img class="bar-icon" alt="bar Image"> 사용 기간 :'+ nowDate+'~'+ticketEndDate +'</li>'
					str += '<li class="ticket-list-li"><img class="bar-icon" alt="bar Image"> 금액 :'+ ticket.ticketDetail.tkPriceAddDot +'원</li>'
					str += '<li class="ticket-list-li"><img class="bar-icon" alt="bar Image"> 수강권 설명 :'+ ticket.ticketDetail.tkDescription +'</li>'
					str += "</ul>"
					str += '</div>'
					$('#ticket-detail-info').append(str);
						
					//수강권 상세의 이용정책부분 ajax결과로 뿌려줌	
					$('#ticketBuyGuide').html('');
					ticket.ticketGuide.forEach(function(ticketBuyGuide) {

							content = '<div class="card-body-title">'+ticketBuyGuide.ugName+'</div>'
							content += '<textarea>'+ticketBuyGuide.ugContent+'</textarea>'
							$('#ticketBuyGuide').append(content);
											
					})
					//여기서 받아온 값 결제시에 필요해서 변수에 담아 넘겨줌
					const tkPrice = parseInt(ticket.ticketDetail.tkPriceAddDot.replace(/,/g, ''));
					const tkName = ticket.ticketDetail.tkName;
					const tkCode = ticket.ticketDetail.tkCode;
					const tkLessonType = ticket.ticketDetail.tkLessonType;
					const tkCount = ticket.ticketDetail.tkUsageCount;
					const tkStartDate = nowDate;
					const tkEndDate = ticketEndDate;
					const csName = ticket.member.csName;
					const csEmail = ticket.member.csEmailId;
					const csNumber = ticket.member.csPhoneNumber;
					const csCode = ticket.member.csMemberCode;
					
					// 버튼 클릭 시 requestPay 함수 호출
		             $('#ticketBuy').off('click').on('click', function () {
		            	ticketCheck(tkPrice, tkName,tkCode,tkLessonType,tkCount,tkStartDate,tkEndDate,csName, csEmail, csNumber, csCode);
		                //requestPay(tkPrice, tkName,tkCode,tkLessonType, csName, csEmail, csNumber, csCode);
		            });
					
		        },
		        error: function() {
		            console.error("티켓 상세 정보를 가져오는데 실패했습니다.");
		        }
		    });
		}	
	<!-- 수강권 보유중인지 확인하고 오는 메서드-->
	function ticketCheck(tkPrice, tkName,tkCode,tkLessonType,tkCount,tkStartDate,tkEndDate,csName, csEmail, csNumber, csCode){
		var ajaxUrl;
		console.log("수강권 보유중인지 확인하고 오는 스크립트: "+csCode);
	    // 조건에 따라 다른 URL 선택
	    if (tkLessonType === '그룹') {
	        ajaxUrl = "groupTicketCheck.do";
	    } else {
	        ajaxUrl = "personalTicketCheck.do";
	    }
		$.ajax({
	        url: ajaxUrl, 
	        type: 'POST',  
	        data: {
	            csCode: csCode
	        },
	        success: function(data) {
	            console.log('서버 응답:', data);
	         // 문자열 "null" 체크
	            if (data === "null" || data=="") {
	            	requestPay(tkPrice, tkName,tkCode,tkLessonType,tkCount,tkStartDate,tkEndDate,csName, csEmail, csNumber, csCode);
	            } else {
	                //alert('이미 보유중인 수강권이 있습니다. 수강권을 다 사용하신 뒤 구매하시기 바랍니다.');
	            	$('#exampleModal').modal('show');
	            	
	            }
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            console.error('AJAX 오류:', textStatus, errorThrown);
	        }
	    });
		
	}
	<!-- 결제 관련 스크립트 -->
	//결제 요청 전에 수강권보유하고 있는지 확인하고 보유중이면 결제 취소시킴 
	
    IMP.init('imp80610750') //가맹점 식별코드 입력
    
    function requestPay(tkPrice, tkName,tkCode,tkLessonType,tkCount,tkStartDate,tkEndDate,csName, csEmail, csNumber, csCode) {
        IMP.request_pay({
          pg: "kcp", // 사용할 pg사의 요청 키워드
          pay_method: "card",
         // merchant_uid: "ORD20131-011",   // 주문번호
          name: tkName, //결제 상품 이름
          amount: tkPrice,  // 금액(숫자 타입)
          buyer_email: csEmail,
          buyer_name: csName,
          buyer_tel: csNumber
        }, function (rsp) { // callback
          //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
        	if ( rsp.success ) {
        // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
         // jQuery로 HTTP 요청
    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    	console.log("rsp.imp_uid :"+rsp.imp_uid +"tkPrice:"+tkPrice+"tkCode"+tkCode+"rsp.pay_method"+rsp.pay_method+"rsp.paid_at: "+rsp.paid_at);
    	jQuery.ajax({
    		url: "payments.do", 
    		type: 'POST',
    		dataType: 'json',
    		data: {
    			paId : rsp.imp_uid, // 결제 고유번호
    			paAmount : tkPrice,
	    		ticketCode : tkCode,
	    		paMethod : rsp.pay_method,
	    		paymentDateTime : rsp.paid_at, //결제 승인시간
	    		memberCode : csCode,
	    		tkLessonType:tkLessonType,
	    		ticketRemainingCount: tkCount,
	    		ticketStartDate: tkStartDate,
	    		ticketExpiryDate : tkEndDate
    		},
    		 success: function (data) {
    			 console.log(data)
                 //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                 var msg = '결제가 완료되었습니다.';
                 msg += '\n고유ID : ' + rsp.imp_uid;
                 msg += '\결제 금액 : ' + rsp.paid_amount;
                 msg += '카드 승인번호 : ' + rsp.apply_num;
				 
                 console.log(msg);
                 //alert("결제가 성공적으로 완료되었습니다.");
                 $('#purchaseModal').modal('show');
    
             },
             error: function (data,jqXHR, textStatus, errorThrown) {
            	 //console.log(data)
                 //[3] 아직 제대로 결제가 되지 않았습니다.
                 //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                 //alert("ajax실패 + 결제 실패");
                 cancelPay(rsp.imp_uid,rsp.paid_amount)
             }
    	});
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        console.log(msg);
        //alert(msg);
        $('#failModal').modal('show');
    }
        
        
        });
      }
	
	//결제 취소 스크립트
    function cancelPay(imp_uid,amount) {
        jQuery.ajax({
          url: "cancel.do", 
          type: "POST",
          data: {
        	  imp_uid : imp_uid, // 고유번호
           	  reason : "내부 서버 오류", // 환불사유
          },success: function (data) {
        	  console.log("취소처리 완료하고 ajax응답성공 : "+data)
 			 //alert("서버 오류로 결제가 자동 취소처리 되었습니다.")
 			$('#cancelModal').modal('show');

         },
         error: function (data,jqXHR, textStatus, errorThrown) {
        	 
         }
        });
      }
	
    </script>	
	<!-- 클릭하면 우측 화면 디폴트에서 상세화면으로 바뀌게 하는 js 
		 왼쪽에 수강권 클릭하면 이 함수 실행
	
	<script>
		// JavaScript를 사용하여 요소 클릭 시 내용 교체
		const listGroupItem = document.getElementById('list-item');
		const content1img = document.getElementById('content1-disappear');
		const content1Replace = document.getElementById('content1-replace');

		listGroupItem.addEventListener('click', function() {
			content1img.style.display = 'none'; // content1-img클래스 숨김
			content1Replace.style.display = 'block'; // card-content1-replace클래스부분이 보임
		});
	</script>
	 -->
	
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
	<script src="assets/js/main.js"></script>

</body>

</html>