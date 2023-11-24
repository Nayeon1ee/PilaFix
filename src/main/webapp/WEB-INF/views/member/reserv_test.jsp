<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title>달력</title>
</head>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/test_calendar.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common.css">

<body>
    <div>
        <table class="Calendar">
            <thead>
                <tr>
                    <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
                    <td colspan="5">
                        <span id="calYear"></span>년
                        <span id="calMonth"></span>월
                    </td>
                    <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
                </tr>
                <tr>
                    <td>일</td>
                    <td>월</td>
                    <td>화</td>
                    <td>수</td>
                    <td>목</td>
                    <td>금</td>
                    <td>토</td>
                </tr>
            </thead>

            <tbody>
            </tbody>
        </table>
    </div>
    
		<!-- 셀렉트 박스 - 연동된 센터의 목록 -->
		<select id="centerSelect" onchange="getLessonInfoByCenter()">
			<c:choose>
				<c:when test="${empty lessonList}">
					<option selected>연동센터 없음</option>
				</c:when>
				<c:otherwise>
					<c:forEach var="center" items="${connCenterList}">
						<option value="${center.ctCode}">센터코드: ${center.ctCode}&센터이름: ${center.ctName}</option>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</select>
		
		<!-- 셀렉트박스에서 선택한 센터의 수강권 정보를 업데이트할 부분 -->
		<div id="lessonListContainer">
				<!-- 페이지 첫 로딩 시에 띄워주고 ajax 요청 시 초기화하여 내용 재생성 -->
			<c:if test="${empty lessonList }">
				<p>개설된 수업이 없습니다.<br> 센터에 문의하시기 바랍니다</p>
			</c:if>
			<c:forEach var="item" items="${lessonList}">
			
			
			</c:forEach>
			<div class="list-group-ticket" id="item.lsCode'">
		        <c:forEach var="item" items="${lessonList}">
		        <h5 class="mb-1" style="font-weight: bold;">${ item.lsName }</h5>
		         <div>
			           <table>
				           	<tr>
				           		<td>${item.lsTime } ~ ${item.lsEndTime }</td>
				           		<td>${item.trainerMemberCode } 강사 | 신청인원 ${item.lsCurrentApplicants } | 정원 ${item.lsCapacity }명</td>
				           	</tr>
	                  </table>
	               	   <div class="mymodal">
	                  		<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#reservModal" onclick="getReservationInfo('${item.lsCode}', '${item.centerCode }')">예약하기</button>
	                   </div>
                 </c:forEach>
		    </div>
		 </div>
		
		
		<!-- Modal -->
		<div class="modal fade" id="reservModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<!-- model-lg는 모달 크기 조절 -->
				<div class="modal-dialog modal-dialog-scrollable">
					<!-- 모달 내 스크롤 가능토록 -->
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="staticBackdropLabel">예약 상세 페이지</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
						
							<!-- 수업 정보 조회 -->
							<div class="card" style="width: 100%;">
								<div class="card-header"><b>수업 정보 확인</b></div>
								<div class="lesson-info">
									<ul class="list-group list-group-flush">
										<li class="list-group-item"><span id="centerName"></span> | <span id="lessonType"></span></li>
										<li class="list-group-item"><h5><span id="lessonName"></span></h5></li>
										<li class="list-group-item"><img alt="bar" src="${pageContext.request.contextPath}/resources/images/purple_bar.png"> 강사명  :<span id="trainerName"></span></li>
										<li class="list-group-item"><img alt="bar" src="${pageContext.request.contextPath}/resources/images/purple_bar.png"> 예약일자 :<span id="lsTime"></span></li>
										<li class="list-group-item"><img alt="bar" src="${pageContext.request.contextPath}/resources/images/purple_bar.png"> 예약시간 :<span id="lsEndTime"></span></li>
									</ul>
								</div>
							</div>
							
							<!-- 내 수강권 정보 조회 -->
							<div class="card" style="width: 100%;">
								<div class="card-header"><b>내 수강권 정보 확인</b></div>
								<div class="ticket-info">
									<ul class="list-group list-group-flush">
										<li class="list-group-item"><span id="ticketName"></span></li>
										<li class="list-group-item"><img alt="bar" src="${pageContext.request.contextPath}/resources/images/purple_bar.png"> 잔여횟수 :<span id="remainingCount"></span></li>
										<li class="list-group-item"><img alt="bar" src="${pageContext.request.contextPath}/resources/images/purple_bar.png"> 만료일 :<span id="expirationDate"></span></li>
									</ul>
								</div>
							</div>
							
							<!-- 이용정책 조회  -->
							<div class="card" style="width: 100%;">
								<div class="card-header"><b>이용정책</b></div>
								<div class="userguide-info">
									<ul class="list-group list-group-flush">
										<div id="userguideContainer"> <!-- 여기에 받아온 이용정책 들어감 --> </div>
									</ul>
								</div>
							</div>

							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"> 
								<label class="form-check-label" for="flexCheckDefault">
									이용 정책을 전부 확인하였습니다. 이에 동의합니다.</label>
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"	data-bs-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary">예약하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>	
		
		
		
	<script>
	 window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행

	    let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
	    let today = new Date();     // 페이지를 로드한 날짜를 저장
	   	let selectedDate = new Date(); // 선택한 날짜를 저장할 변수 (오늘 날짜로 초기화)
		let selectedCenterCode = "";   // 빈 문자열로 초기화
	    today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화

	    // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
	    function buildCalendar() {

	        let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
	        let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날

	        let tbody_Calendar = document.querySelector(".Calendar > tbody");
	        document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
	        document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신

	        while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
	            tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
	        }

	        let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가           

	        for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
	            let nowColumn = nowRow.insertCell();        // 열 추가
	        }

	        for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  

	            let nowColumn = nowRow.insertCell();        // 새 열을 추가하고


	            let newDIV = document.createElement("p");
	            newDIV.innerHTML = leftPad(nowDay.getDate());        // 추가한 열에 날짜 입력
	            nowColumn.appendChild(newDIV);

	            if (nowDay.getDay() == 6) {                 // 토요일인 경우
	                nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
	            }

	            if (nowDay < today) {                       // 지난날인 경우
	                newDIV.className = "pastDay";
	            }
	            else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
	                newDIV.className = "today";
	                newDIV.onclick = function () { choiceDate(this); }
	            }
	            else {                                      // 미래인 경우
	                newDIV.className = "futureDay";
	                newDIV.onclick = function () { choiceDate(this); }
	            }
	        }
	    }

	    // 날짜 선택
	   	function choiceDate(newDIV) {
	        if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
	            document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
	        }
	        newDIV.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
	        selectedDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), newDIV.innerHTML);
		    getLessonInfoByCenter(); // 선택한 날짜와 센터에 기반하여 수업을 업데이트하기 위해 함수 호출
	    }

	    // 이전달 버튼 클릭
	    function prevCalendar() {
	        nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
	        buildCalendar();    // 달력 다시 생성
	    }
	    // 다음달 버튼 클릭
	    function nextCalendar() {
	        nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
	        buildCalendar();    // 달력 다시 생성
	    }

	    // input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
	    function leftPad(value) {
	        if (value < 10) {
	            value = "0" + value;
	            return value;
	        }
	        return value;
	    }
		
	</script>
	<!-- 센터 선택 시, 날짜 선택 시 해당 센터의 수업 목록 조회 -->
	<script>
		function getLessonInfoByCenter() {
			var selectedCenterCode = document.getElementById("centerSelect").value;
			console.log("선택한 지점 코드 : " + selectedCenterCode);
			console.log("선택한 날짜 : " + selectedDate);
			
		    // 만약 선택한 날짜가 있으면 data에 추가
		    var data = {
		        ctCode: selectedCenterCode,
		    };

		    if (selectedDate) {
		        data.selectedDate = selectedDate;
		    }
			
			// Ajax 요청
			$.ajax({
						type : "Post",
						url : "getLessonList.do", // 적절한 URL로 변경
						data : data,
						success : function(lessonList) {
							// 성공 시 아래에 정보 업데이트
							console.log("값 가져옴")

							var str = "";
							//  lessonListContainer라는 아이디 가진 영역의 기존 내용을 지움
							$('#lessonListContainer').html('');
							if (lessonList.length < 1) {
								str = '<p>개설된 수업이 없습니다.<br> 센터에 문의하시기 바랍니다</p>'
								$('#lessonListContainer').append(str);
							} else {
								lessonList.forEach(function (item) {
				                    str = '<div class="list-group-ticket" id="' + item.lsCode + '">';
				                    str += '<h5 class="mb-1" style="font-weight: bold;">' + item.lsName + '</h5>';
				                    str += '<div>';
				                    str += '<table>';
				                    str += '<td>';
				                    str += '<tr>' + item.lsTime + '~' + item.lsEndTime+ '</tr>';
				                    str += '<tr>';
				                    str += item.trainerMemberCode + ' 강사 | 신청인원 ' + item.lsCurrentApplicants + '명 | 정원 ' + item.lsCapacity + '명';
				                    str += '</tr>';
				                    str += '</td>';
				                    str += '</table>';
				                    str += '<div class="mymodal">'
				                    str += '<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#reservModal" onclick="getReservationInfo(\'' + item.lsCode + '\', \'' + item.centerCode + '\')">예약하기</button>';
				                    str += '</div>'
				                    str += '</div>';
				                    str += '</div>';
				                    // lessonListContainer라는 아이디를 가진 영역에 위의 내용 삽입해줌
				                    $('#lessonListContainer').append(str);
										
								});

							}
						},
						error : function() {
							console.error("Ajax 요청 실패");
						}
					});
		}
		
	<!-- 예약하기 버튼 클릭 시 수업 정보, 수강권 정보, 이용정책 Map으로 받아옴 -->
	<!-- 요청시 파라미터로 센터코드, 수업코드 넘겨야 함 -->
	function getReservationInfo(lsCode, ctCode) {
	    $.ajax({
	        type: "GET",
	        url: "getMyTicketInfo.do",
	        data: {
	            lsCode: lsCode,
	            ctCode: ctCode
	        },
	        success: function (data) {
	            // Map에 담긴 각각의 객체 저장 
	            var lessonDetail = data.lessonDetail;
	            var myTicket = data.myTicket;
	            var reservGuideList = data.reservGuide;

	            // 수업 내용 조회 
	            $('#centerName').text(lessonDetail.ctName);
	            $('#lessonType').text(lessonDetail.lsType);
	            $('#lessonName').text(lessonDetail.lsName);
	            $('#trainerName').text(lessonDetail.trainerMemberName);
	            $('#lsTime').text(lessonDetail.lsTime);
	            $('#lsEndTime').text(lessonDetail.lsEndTime);

	            // 수강권 내역 조회 // 개인 수업 시 해당 컬럼 변경 필요  
	            $('#ticketName').text(myTicket.ticketNameGroup1);
	            $('#remainingCount').text(myTicket.ticketRemainingCountGroup1);
	            $('#expirationDate').text(myTicket.ticketExpiryDateGroup1);

	            // 이용정책 조회 및 추가
	            var userguideContainer = $('#userguideContainer'); // userguideContainer에 삽입됨 
	            userguideContainer.empty(); // 기존 내용 초기화 

	            reservGuideList.forEach(function (reservGuide) {
	                // 이용정책의 개수만큼 생성 
	                var listItem = $('<li class="list-group-item"></li>');
	                listItem.append('<b>' + reservGuide.ugName + '</b>');
	                listItem.append('<span>' + reservGuide.ugContent + '</span>');

	                userguideContainer.append(listItem);
	            });

	            // 위 정보를 토대로 모달 띄워짐 
	            $('#reservModal').modal('show');
	        },
	        error: function () {
	            console.error("getMyTicketInfo.do 호출 시 Ajax 요청 실패 ");
	        }
	    });
	}
	
	function getReservationInfo(lsCode, ctCode) {
	    $.ajax({
	        type: "GET",
	        url: "getMyTicketInfo.do",
	        data: {
	            lsCode: lsCode,
	            ctCode: ctCode
	        },
	        success: function (data) {
	            if (data && data.lessonDetail && data.myTicket && data.reservGuideList) {
	                var lessonDetail = data.lessonDetail;
	                var myTicket = data.myTicket;
	                var reservGuideList = data.reservGuideList;

	                // 수업 내용 조회 
	                $('#centerName').text(lessonDetail.ctName);
	                $('#lessonType').text(lessonDetail.lsType);
	                $('#lessonName').text(lessonDetail.lsName);
	                $('#trainerName').text(lessonDetail.trainerMemberName);
	                $('#lsTime').text(lessonDetail.lsTime);
	                $('#lsEndTime').text(lessonDetail.lsEndTime);

	                // 수강권 내역 조회
	                $('#ticketName').text(myTicket.ticketNameGroup1);
	                $('#remainingCount').text(myTicket.ticketRemainingCountGroup1);
	                $('#expirationDate').text(myTicket.ticketExpiryDateGroup1);

	                // 이용정책 조회 및 추가
	                var userguideContainer = $('#userguideContainer');
	                userguideContainer.empty();

	                if (reservGuideList.length > 0) {
	                    reservGuideList.forEach(function (reservGuide) {
	                        var listItem = $('<li class="list-group-item"></li>');
	                        listItem.append('<b>' + reservGuide.ugName + '</b>');
	                        listItem.append('<span>' + reservGuide.ugContent + '</span>');
	                        userguideContainer.append(listItem);
	                    });
	                } else {
	                    userguideContainer.append('<li class="list-group-item">이용정책이 없습니다.</li>');
	                }

	                $('#reservModal').modal('show');
	            } else {
	                console.error("서버 응답 데이터가 비어있거나 유효하지 않습니다.");
	            }
	        },
	        error: function () {
	            console.error("getMyTicketInfo.do 호출 시 Ajax 요청 실패 ");
	        }
	    });
	}


	

	
	
	<!-- 동의 체크박스에 체크 하면 버튼 색상 바뀌는 것으로 (동의 체크 안 한채로 버튼 누르면 동의 하라고 떠야 함)-->
	
	
		
		
	</script>
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/test_calendar.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
</body>

</html>