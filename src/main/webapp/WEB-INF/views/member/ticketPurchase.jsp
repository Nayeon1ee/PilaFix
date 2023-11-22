<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강권구매</title>
<!-- css, js연결 -->
<link
	href="${pageContext.request.contextPath}/resources/css/templateC.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_ticket2.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
	
<!-- 내가 추가한 js -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<div class="container000">
		<section class="content000">
			<area1>
			<p>area1</p>
			</area1>
			<main>
				<!-- 왼쪽 영역 비율7 -->
				<div class='ticket'>
					<div class="slect-wrap">
						<img
							src="${pageContext.request.contextPath}/resources/images/select-arr.png"
							alt="arr Image"> 
						<!-- 로그인한 회원코드의 연동된 센터가 없으면 수강권 구매할 수 없으므로 연동센터없으면 연동센터없다고 뿌려주고 있으면 그 센터의 이름 셀렉박스 옵션으로 넣어줌 -->
						<select id="centerSelect" onchange="getCenterInfo()">
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
					
					<!-- 셀렉트박스에서 선택한 센터의 수강권 정보를 업데이트할 부분 -->
					<div id="centerInfoContainer">
							<!-- 여기에 ajax내용 들어감 -->
					</div>
					
					
					<hr>
					<div>
						<ul class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="#">전체</a></li>
							<li class="nav-item"><a class="nav-link" href="#">개인</a></li>
							<li class="nav-item"><a class="nav-link" href="#">그룹</a></li>
							</li>
						</ul>
					</div>
					<section class="ticket-list">
						<div class="list-group-ticket" id="list-item">
							<a href="#" class="list-group-item list-group-item-action active"
								aria-current="true">
								<div class="d-flex w-100 justify-content-between">
									<h5 class="mb-1">6:1 그룹 레슨 24회 (3개월)</h5>
								</div>
								<p class="mb-1">척추가 맞춰지는 필라테스</p>
								<div>
									<table>
										<td>
										<tr>2023.10.10~2024.01.01
										</tr>
										<tr>
											<span
												style="font-weight: bold; text-align: right; display: block;">
												650,000원 </span>
										</tr>
										</td>
									</table>
								</div>
							</a>
						</div>

						<div class="list-group-ticket" id="list-item">
							<a href="#" class="list-group-item list-group-item-action active"
								aria-current="true">
								<div class="d-flex w-100 justify-content-between">
									<h5 class="mb-1">6:1 그룹 레슨 24회 (3개월)</h5>
								</div>
								<p class="mb-1">척추가 맞춰지는 필라테스</p>
								<div>
									<table>
										<td>
										<tr>2023.10.10~2024.01.01
										</tr>
										<tr>
											<span
												style="font-weight: bold; text-align: right; display: block;">
												650,000원 </span>
										</tr>
										</td>
									</table>
								</div>
							</a>
						</div>
						<div class="list-group-ticket" id="list-item">
							<a href="#" class="list-group-item list-group-item-action active"
								aria-current="true">
								<div class="d-flex w-100 justify-content-between">
									<h5 class="mb-1">6:1 그룹 레슨 24회 (3개월)</h5>
								</div>
								<p class="mb-1">척추가 맞춰지는 필라테스</p>
								<div>
									<table>
										<td>
										<tr>2023.10.10~2024.01.01
										</tr>
										<tr>
											<span
												style="font-weight: bold; text-align: right; display: block;">
												650,000원 </span>
										</tr>
										</td>
									</table>
								</div>
							</a>
						</div>
						<div class="list-group-ticket" id="list-item">
							<a href="#" class="list-group-item list-group-item-action active"
								aria-current="true">
								<div class="d-flex w-100 justify-content-between">
									<h5 class="mb-1">6:1 그룹 레슨 24회 (3개월)</h5>
								</div>
								<p class="mb-1">척추가 맞춰지는 필라테스</p>
								<div>
									<table>
										<td>
										<tr>2023.10.10~2024.01.01
										</tr>
										<tr>
											<span
												style="font-weight: bold; text-align: right; display: block;">
												650,000원 </span>
										</tr>
										</td>
									</table>
								</div>
							</a>
						</div>

					</section>
				</div>
				<!-- 오른쪽 영역 비율3 -->
				<div class='content1'>
					<!-- 기본으로 보여줄 이미지 -->
					<div class="content1-img" id="content1-disappear">
						<div>
							<img
								src="${pageContext.request.contextPath}/resources/images/hand.png"
								alt="hand Image">
							<p>관심가는 수강권을 클릭해보세요!</p>
						</div>
					</div>

					<!-- 클릭시 보여줄 이미지 -->

					<div class="card-content1-replace" id="content1-replace">
						<div class="card text-center">
						<div id="ticket-detail-info">
							<!-- 여기에 ajax결과 들어옴 -->
						</div>
							<div class="card-footer text-muted">이용정책</div>
							<div class="card-body" id="ticketBuyGuide">
								<!-- 여기에 ajax결과 들어옴 -->
							</div>
							<div class="policy-area">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value=""
										id="flexCheckDefault"> <label class="form-check-label"
										for="flexCheckDefault" style="margin: 10px;"> 이용 정책을
										모두 확인 하였습니다. 이에 동의합니다.</label>
								</div>
							</div>
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#exampleModal"
								class="btn btn-primary">결제하기</button>

						</div>
					</div>
				</div>

				<!-- 모달 -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">구매가 완료
									되었습니다!</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">마이페이지에서 내 수강권을 확인하실 수 있습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
								<button onclick="location.href='#(마이페이지 링크 추가)'" type="button"
									class="btn btn-primary">마이페이지로 가기</button>
							</div>
						</div>
					</div>
				</div>

			</main>

			<area2>
			<p>area2</p>
			</area2>
		</section>

	</div>
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
								str = '<p>센터에서 등록한 수강권이 없습니다.<br> 센터에 문의하시기 바랍니다</p>'
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

											str = '<div class="list-group-ticket" id="'+item.tkCode+'">'
											//str = '<input type="hidden" name="tkCode" value="'+item.tkCode+'">'
											//str += '<a href="#" class="list-group-item list-group-item-action active" aria-current="true">'
											str += '<div class="d-flex w-100 justify-content-between">'
											str += '<h5 class="mb-1">'+ item.tkCapacity + ':1'+ item.tkLessonType + ' 레슨'+ item.tkUsageCount + '회 ('+ item.tkUsageNumMonth+ '개월)</h5>'
											str += '</div>'
											str += '<p class="mb-1">'+ item.tkName + '</p>'
											str += "<div>"
											str += "<table>"
											str += '<td>'
											str += "<tr>" + nowDate + "~"+ ticketEndDate + "</tr>"
											str += '<tr>'
											str += '<span class="tkPrice">'+ item.tkPriceAddDot+'원 </span>';
											str += "</tr>"
											str += "</td>"
											str += "</table>"
											str += "</div>"
											//str += "</a>"
											str += "</div>"
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
					str = '<div class="card-header-title">'+ticket.ticketDetail.tkName+'</div>'
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
							content += '<div class="card-body-content">'+ticketBuyGuide.ugContent+'</div>'
							$('#ticketBuyGuide').append(content);
											
					})
		        },
		        error: function() {
		            console.error("티켓 상세 정보를 가져오는데 실패했습니다.");
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

</body>
</html>