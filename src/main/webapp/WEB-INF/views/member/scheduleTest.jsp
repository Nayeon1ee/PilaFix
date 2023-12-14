<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
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
<!-- fullcalender -->
<link rel='stylesheet'
	href="${pageContext.request.contextPath}/resources/temparycss/main.css">
	
<!-- Template Main CSS File -->
<link
	href="${pageContext.request.contextPath}/resources/member/assets/css/style.css"
	rel="stylesheet">

<!-- fullcalender -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/temparyjs/main.js"></script>

<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/locales/ko.js"></script>	
</head>

<!-- 내 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common_0.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_myschedule.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style_insert_calendar.css">
<style>
.circleMarker {
    width: 10px;
    height: 10px;
    border-radius: 50%; 
    margin-top: 5px; 
    display: block; 
    margin: 0 auto; 
}
</style>
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
					<li>Check schedule</li>
				</ol>
				<h2>스케줄 확인</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container mx-auto" style="max-width: 1100px;">

				<!-- 7:3 비율 잡기 위한 컨테이너 -->
				<div class="container d-flex justify-content-center p-0 m-0">
					<div class="row">
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
					</div>
					<!-- 7:3 비율 컨테이너 닫기 -->


					<!-- 두 번째 컬럼 (7:3) -->
					<div class="col-md-5 content1 ms-2">
							<div class="card rounded mt-4">
								<div class="card-header bg-light" style="height: 100px;">
									<div class="text-center">
										<font style="font-weight: bold;">당월 출석 현황</font><br> <br>
									</div>
									<ul id="nav5" class="nav justify-content-around">
										<li class="nav-item"><a class="nav-link active"
											style="color: #0070c0; text-weight: bold; text-decoration: none;">예약&nbsp;${count.reservCount }건</a></li>
										<li class="nav-item"><a class="nav-link"
											style="color: #088A08; text-weight: bold; text-decoration: none;">출석&nbsp;${count.attendCount }건</a></li>
										<li class="nav-item"><a class="nav-link"
											style="color: #ff6600; text-weight: bold; text-decoration: none;">결석&nbsp;${count.absentCount }건</a></li>
									</ul>
								</div>
							</div>
						<div class="content border rounded p-3"
							style="min-height: 565px; max-height: 565px; ">



							<div class="card-header-con py-1 mt-1 custom-rounded">
								<div class="btn-group d-flex py-1" role="group"
									aria-label="Basic radio toggle button group">

									<input type="button" class="btn-check" name="options" id="option1" autocomplete="off" > 
									<label class="btn btn-outline-primary1" for="option1" id="allSchedule">전체</label> 
										<input type="button" class="btn-check" name="options"  autocomplete="off"> 
										<label class="btn btn-outline-primary2" for="option2" id="reservation">예약</label> 
										<input type="button" class="btn-check" name="options" id="option3" autocomplete="off"> 
										<label class="btn btn-outline-primary3" for="option3"id="attend" >출석</label> 
										<input type="button" class="btn-check" name="options" id="option4" autocomplete="off"> 
										<label class="btn btn-outline-primary4" for="option4" id="absent">결석</label>
								</div>
							</div>
							
							<!-- 카드영역 -->
							<div class="schedule-card" style=" min-height: 450px; max-height: 450px;">
								
								<!-- 전체 스케줄 -->
								<div id="allInfo">
									
								</div>
								
								<!-- 예약 수업정보 가져오는 곳 -->
								<div id="reservInfo">
									<!-- 여기에 예약수업 리스트 나올거임-->
								</div>
								<div id="attendInfo">
									<!-- 여기에 당월 출석한 수업 리스트가 나올거임-->
								</div>
								<div id="absentInfo">
									<!-- 여기에 당월 결석한 수업 리스트가 나올거임-->
								</div>
							</div> 
							<!-- 카드영역 끝 -->
						


						</div>
					</div>
				
				</div>



				<!-- 내용 -->


				<!-- End Our Skills Section -->
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!--  캘린더 js 1 -->

<!-- 캘린더 js 2-->


<script>
let reservDateList;

window.onload = function() {
	buildCalendar();
} // 웹 페이지가 로드되면 buildCalendar 실행

let nowMonth = new Date(); // 현재 달을 페이지를 로드한 날의 달로 초기화
let today = new Date(); // 페이지를 로드한 날짜를 저장
today.setHours(0, 0, 0, 0); // 비교 편의를 위해 today의 시간을 초기화



//getMonthSchedule.do로부터 날짜 리스트를 가져오는 함수
function getMonthSchedule() {
	// 현재 달력이 표시되고 있는 년, 월 정보 추출
    let nowYear = nowMonth.getFullYear();
    let nowMonthString = leftPad(nowMonth.getMonth() + 1);
 	
    // 날짜 정보를 합친 형태로 생성(2023-01-01의 형태로 변환)
    let date = nowYear + "-" + nowMonthString + "-" + "1"; // 서버에서는 연도와 월만 필요함으로 일은 1로 고정해둠
    console.log("현재 달력의 날짜: "+date);
    
    $.ajax({
        type: "POST",
        url: "getMonthSchedule.do",
        data: {calenderDate:date},
        async:false, // 전역변수에 값 담기위해 동기방식사용
        dataType: "json",
        success: function (dateList) {
            // 받아온 날짜 리스트를 기반으로 동적으로 이미지 추가
            console.log(dateList);
            reservDateList = dateList.slice(); // 배열 복사
            console.log("전역변수로 선언한거에 리스트 담나 보기"+reservDateList);
        },
        error: function () {
            console.error("Failed to get month schedule.");
        }
    });
}

// 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
function buildCalendar() {

	let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1); // 이번달 1일
	let lastDate = new Date(nowMonth.getFullYear(),
			nowMonth.getMonth() + 1, 0); // 이번달 마지막날

	let tbody_Calendar = document.querySelector(".Calendar > tbody");
	document.getElementById("calYear").innerText = nowMonth.getFullYear(); // 연도 숫자 갱신
	document.getElementById("calMonth").innerText = leftPad(nowMonth
			.getMonth() + 1); // 월 숫자 갱신
	
	getMonthSchedule(); // 달력 빌드 시 해당월의 예약 날짜 리스트를 가져오도록 추가
	
	while (tbody_Calendar.rows.length > 0) { // 이전 출력결과가 남아있는 경우 초기화
		tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
	}

	let nowRow = tbody_Calendar.insertRow(); // 첫번째 행 추가           

	for (let j = 0; j < firstDate.getDay(); j++) { // 이번달 1일의 요일만큼
		let nowColumn = nowRow.insertCell(); // 열 추가
	}

	for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay
			.getDate() + 1)) { // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  

		let nowColumn = nowRow.insertCell(); // 새 열을 추가하고

		let newDIV = document.createElement("p");
		newDIV.innerHTML = leftPad(nowDay.getDate()); // 추가한 열에 날짜 입력
		nowColumn.appendChild(newDIV);
		
		
		//console.log("제발 나와라:"+reservDateList);
		 // AJAX로 가져온 날짜 데이터를 반복하여 처리
	    reservDateList.forEach(dateString => {
	        let userSpecifiedDate = new Date(dateString);
	        
	        if (nowDay.getFullYear() == userSpecifiedDate.getFullYear() &&
	            nowDay.getMonth() == userSpecifiedDate.getMonth() &&
	            nowDay.getDate() == userSpecifiedDate.getDate()) {
	            // 동적으로 마커 추가
	            let circleImage = document.createElement("img");
	            circleImage.src = '/pilafix/resources/images/attend_dot3.png';
	            circleImage.alt = "Circle";
	            circleImage.className = "circleMarker";
	            nowColumn.appendChild(circleImage);
	        }
	    });
		 /*
		//달력에 예약 dot
		let userSpecifiedDate = new Date("2023-12-15"); 
		if (nowDay.getFullYear() == userSpecifiedDate.getFullYear() &&  nowDay.getMonth() == userSpecifiedDate.getMonth() && nowDay.getDate() == userSpecifiedDate.getDate()) {
		    // 동그라미 이미지를 나타내기 위해 img 요소 생성
		    let circleImage = document.createElement("img");
		    circleImage.src = '/pilafix/resources/images/attend_dot1.png';
		    circleImage.alt = "Circle";
		    circleImage.className = "circleMarker";
		    nowColumn.appendChild(circleImage);
		}
		*/

		

		if (nowDay.getDay() == 6) { // 토요일인 경우
			nowRow = tbody_Calendar.insertRow(); // 새로운 행 추가
		}

		if (nowDay < today) { // 지난날인 경우
			newDIV.className = "pastDay";
		} else if (nowDay.getFullYear() == today.getFullYear()
				&& nowDay.getMonth() == today.getMonth()
				&& nowDay.getDate() == today.getDate()) { // 오늘인 경우           
			newDIV.className = "today";
			newDIV.onclick = function() {
				choiceDate(this);
			}
		} else { // 미래인 경우
			newDIV.className = "futureDay";
			newDIV.onclick = function() {
				choiceDate(this);
			}
		}
	}
	
}

// 날짜 선택
function choiceDate(newDIV) {
	if (document.getElementsByClassName("choiceDay")[0]) { // 기존에 선택한 날짜가 있으면
		document.getElementsByClassName("choiceDay")[0].classList
				.remove("choiceDay"); // 해당 날짜의 "choiceDay" class 제거
	}
	newDIV.classList.add("choiceDay"); // 선택된 날짜에 "choiceDay" class 추가
}

// 이전달 버튼 클릭
function prevCalendar() {
	nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1,
			nowMonth.getDate()); // 현재 달을 1 감소

	buildCalendar(); // 달력 다시 생성
}
// 다음달 버튼 클릭
function nextCalendar() {
	nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1,
			nowMonth.getDate()); // 현재 달을 1 증가

	buildCalendar(); // 달력 다시 생성
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
	
<!-- 예약정보 가져오는 js -->
	<script type="text/javascript">
	 $("#reservation").click(function() {
         // AJAX 요청
         $.ajax({
             type: "POST",
             url: "getReservList.do",
             success: function(reservInfoList) {
                 console.log("AJAX 요청 성공");
                 
                 $('#allInfo').html('');
                 $('#reservInfo').html('');
                 $('#attendInfo').html('');
                 $('#absentInfo').html('');
                 if (reservInfoList.length < 1) {
						$('#reservInfo').append('<p>예약된 수업이 없습니다.</p>');
					} else {
						reservInfoList.forEach(function(item) {
							//console.log(item);
							// lsDate를 월-일(요일) 형태로 포맷팅
		                    var date = new Date(item.lsDate);
		                    var formattedDate = new Intl.DateTimeFormat('ko-KR', {
		                        month: 'short',
		                        day: 'numeric',
		                        weekday: 'short'
		                    }).format(date);
		                    
		                    /// lessonDatetime을 Timestamp로 파싱
		                    var lessonDatetime = new Date(item.lessonDatetime);
		                    var fourHoursBefore = new Date(lessonDatetime);
		                    var currentDatetime = new Date();
		                    fourHoursBefore.setHours(lessonDatetime.getHours() - 4); // 수업시작시간에서 4시간 을 뺀 시간이 저장됌

									var str = '<div class="card" style="border-radius: 0;">';
									str += '<div class="card-header bg-light">'+formattedDate+'</div>';
									str += '<div class="card-body">'
									str += '<div class="mt-3" style="margin-top:0px!important">'
									str += '<small class="text-muted"><strong id="reservColor">예약</strong> &nbsp; '+item.lsTime+' ~ '+item.lsEndTime+'</small>'
									str += '<div class="d-flex w-100 justify-content-between">'
									str += '<h5 class="my-auto" style="color: black;">'+item.lsName+'</h5>'
									// 수업시간 4시간 전까지는 취소하기 버튼 표시 (그 이후는 취소 불가라서 취소하기 버튼 없음)
				                    if (currentDatetime < fourHoursBefore) {
				                    	// rsCode, lsCode, centerCode 변수에 저장
				                        var rsCode = item.rsCode;
				                      //  var lsCode = item.lsCode;
				                       // var centerCode = item.centerCode;
				                        console.log("변수에 담을 때 값 유지되나?"+rsCode);
				                        str += '<button type="button" class="btn btn-outline-primary btn-reservation" onclick="redirectToCancelPage(\'' + rsCode + '\')">취소하기</button>';
				                    }
									str += '</div>'
									str += '<small class="text-muted">'+item.trainerMemberName+' 강사</small><br>'
									str += '<small class="text-muted">'+item.centerName+' - '+item.lsType+'수업</small>'
									str += '</div>'
									str += '</div>'
									str += '</div>'
									$('#reservInfo').append(str);
						});

					}
			},
             error: function(error) {
                 console.error("AJAX 요청 실패", error);
             }
         });
     });
	 // 취소버튼 
	 function redirectToCancelPage(rsCode) {
		    // rsCode를 파라미터로 받아서 취소 페이지로 이동
		    window.location.href = 'cancelPage.do?rsCode=' + rsCode;
		}
	<!-- 출석정보 가져오는 js -->
	 $("#attend").click(function() {
         // AJAX 요청
         $.ajax({
             type: "POST",
             url: "getAttendList.do",
             success: function(reservInfoList) {
                 console.log("AJAX 요청 성공");
                 $('#allInfo').html('');
                 $('#reservInfo').html('');
                 $('#attendInfo').html('');
                 $('#absentInfo').html('');
                 if (reservInfoList.length < 1) {
						$('#attendInfo').append('<p>이번달에 출석한 수업이 없습니다.</p>');
					} else {
						reservInfoList.forEach(function(item) {
							// lsDate를 월-일(요일) 형태로 포맷팅
		                    var date = new Date(item.lsDate);
		                    var formattedDate = new Intl.DateTimeFormat('ko-KR', {
		                        month: 'short',
		                        day: 'numeric',
		                        weekday: 'short'
		                    }).format(date);
		                    
									var str = '<div class="card" style="border-radius: 0;">';
									str += '<div class="card-header bg-light">'+formattedDate+'</div>';
									str += '<div class="card-body">'
									str += '<div class="mt-3" style="margin-top:0px!important">'
									str += '<small class="text-muted"><strong id="attendColor">출석</strong> &nbsp; '+item.lsTime+' ~ '+item.lsEndTime+'</small>'
									str += '<div class="d-flex w-100 justify-content-between">'
									str += '<h5 class="my-auto" style="color: black;">'+item.lsName+'</h5>'
									str += '</div>'
									str += '<small class="text-muted">'+item.trainerMemberName+' 강사</small><br>'
									str += '<small class="text-muted">'+item.centerName+' - '+item.lsType+'수업</small>'
									str += '</div>'
									str += '</div>'
									str += '</div>'
									$('#attendInfo').append(str);
						});

					}
			},
             error: function(error) {
                 console.error("AJAX 요청 실패", error);
             }
         });
     });
	
	<!-- 결석정보 가져오는 js -->
	 $("#absent").click(function() {
         // AJAX 요청
         $.ajax({
             type: "POST",
             url: "getAbsentList.do",
             success: function(reservInfoList) {
                 console.log("AJAX 요청 성공");
                 $('#allInfo').html('');
                 $('#reservInfo').html('');
                 $('#attendInfo').html('');
                 $('#absentInfo').html('');
                 if (reservInfoList.length < 1) {
						$('#absentInfo').append('<p>이번달에 결석한 수업이 없습니다.</p>');
					} else {
						reservInfoList.forEach(function(item) {
							// lsDate를 월-일(요일) 형태로 포맷팅
		                    var date = new Date(item.lsDate);
		                    var formattedDate = new Intl.DateTimeFormat('ko-KR', {
		                        month: 'short',
		                        day: 'numeric',
		                        weekday: 'short'
		                    }).format(date);
		                    
									var str = '<div class="card" style="border-radius: 0;">';
									str += '<div class="card-header bg-light">'+formattedDate+'</div>';
									str += '<div class="card-body">'
									str += '<div class="mt-3" style="margin-top:0px!important">'
									str += '<small class="text-muted"><strong id="absentColor">결석</strong> &nbsp; '+item.lsTime+' ~ '+item.lsEndTime+'</small>'
									str += '<div class="d-flex w-100 justify-content-between">'
									str += '<h5 class="my-auto" style="color: black;">'+item.lsName+'</h5>'
									str += '</div>'
									str += '<small class="text-muted">'+item.trainerMemberName+' 강사</small><br>'
									str += '<small class="text-muted">'+item.centerName+' - '+item.lsType+'수업</small>'
									str += '</div>'
									str += '</div>'
									str += '</div>'
									$('#absentInfo').append(str);
						});

					}
			},
             error: function(error) {
                 console.error("AJAX 요청 실패", error);
             }
         });
     });
	 
	 //전체 스케줄 가져오는 js (페이지로드되면 나와야하고 버튼 클릭해도 나와야해서 함수로 뻄)
	 $(document).ready(function () {
	    // 페이지 로드 시 AJAX 요청
	    getAllSchedlue();
	 });
    // #allSchedule 버튼 클릭 시 AJAX 요청
    $('#allSchedule').click(function () {
    	getAllSchedlue();
	});
    function getAllSchedlue() {
         // AJAX 요청
         $.ajax({
             type: "POST",
             url: "getAllInfo.do",
             success: function(allInfo) {
                 console.log("AJAX 요청 성공");
                 console.log(allInfo);
                 $('#allInfo').html('');
                 $('#reservInfo').html('');
                 $('#attendInfo').html('');
                 $('#absentInfo').html('');
                 //반환된 맵이 비어있으면 출력
                 if (Object.keys(allInfo).length === 0) {
                	 	console.log("맵이 비어있음");
						$('#allInfo').append('<p>이번달에 스케줄이 없습니다.</p>');
					} else {
						if (allInfo.reservInfo) {
					        console.log("reservInfo 존재함" + allInfo.reservInfo);
					        allInfo.reservInfo.forEach(function(item) {
					        	// lsDate를 월-일(요일) 형태로 포맷팅
			                    var date = new Date(item.lsDate);
			                    var formattedDate = new Intl.DateTimeFormat('ko-KR', {
			                        month: 'short',
			                        day: 'numeric',
			                        weekday: 'short'
			                    }).format(date);
			                    
			                    /// lessonDatetime을 Timestamp로 파싱
			                    var lessonDatetime = new Date(item.lessonDatetime);
			                    var fourHoursBefore = new Date(lessonDatetime);
			                    var currentDatetime = new Date();
			                    fourHoursBefore.setHours(lessonDatetime.getHours() - 4); // 수업시작시간에서 4시간 을 뺀 시간이 저장됌

								var str = '<div class="card" style="border-radius: 0;">';
								str += '<div class="card-header bg-light">'+formattedDate+'</div>';
								str += '<div class="card-body">'
								str += '<div class="mt-3" style="margin-top:0px!important">'
								str += '<small class="text-muted"><strong id="reservColor">예약</strong> &nbsp; '+item.lsTime+' ~ '+item.lsEndTime+'</small>'
								str += '<div class="d-flex w-100 justify-content-between">'
								str += '<h5 class="my-auto" style="color: black;">'+item.lsName+'</h5>'
								// 수업시간 4시간 전까지는 취소하기 버튼 표시 (그 이후는 취소 불가라서 취소하기 버튼 없음)
			                    if (currentDatetime < fourHoursBefore) {
			                    	// rsCode, lsCode, centerCode 변수에 저장
			                        var rsCode = item.rsCode;
			                      //  var lsCode = item.lsCode;
			                       // var centerCode = item.centerCode;
			                        console.log("변수에 담을 때 값 유지되나?"+rsCode);
			                        str += '<button type="button" class="btn btn-outline-primary btn-reservation" onclick="redirectToCancelPage(\'' + rsCode + '\')">취소하기</button>';
			                    }
								str += '</div>'
								str += '<small class="text-muted">'+item.trainerMemberName+' 강사</small><br>'
								str += '<small class="text-muted">'+item.centerName+' - '+item.lsType+'수업</small>'
								str += '</div>'
								str += '</div>'
								str += '</div>'
								$('#allInfo').append(str);
					        }); //예약리스트 foreach문 끝
						
					}// 예약리스트에 정보 있는지 if문 끝
					if (allInfo.attendanceInfo) {
						console.log("attendanceInfo 존재함");
				        allInfo.attendanceInfo.forEach(function(item) {
						// lsDate를 월-일(요일) 형태로 포맷팅
	                    var date = new Date(item.lsDate);
	                    var formattedDate = new Intl.DateTimeFormat('ko-KR', {
	                        month: 'short',
	                        day: 'numeric',
	                        weekday: 'short'
	                    }).format(date);
	                    
								var str = '<div class="card" style="border-radius: 0;">';
								str += '<div class="card-header bg-light">'+formattedDate+'</div>';
								str += '<div class="card-body">'
								str += '<div class="mt-3" style="margin-top:0px!important">'
								if(item.atAttendanceYn === true){
									str += '<small class="text-muted"><strong id="attendColor">출석</strong> &nbsp; '+item.lsTime+' ~ '+item.lsEndTime+'</small>'
								}else {
									str += '<small class="text-muted"><strong id="absentColor">결석</strong> &nbsp; '+item.lsTime+' ~ '+item.lsEndTime+'</small>'
								}
								str += '<div class="d-flex w-100 justify-content-between">'
								str += '<h5 class="my-auto" style="color: black;">'+item.lsName+'</h5>'
								str += '</div>'
								str += '<small class="text-muted">'+item.trainerMemberName+' 강사</small><br>'
								str += '<small class="text-muted">'+item.centerName+' - '+item.lsType+'수업</small>'
								str += '</div>'
								str += '</div>'
								str += '</div>'
								$('#attendInfo').append(str);
				        });//출결리스트 foreach문 끝
					}//출결리스트에 정보 있나 확인하는 if문 끝
				}
			},
             error: function(error) {
                 console.error("AJAX 요청 실패", error);
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

	<script src="${pageContext.request.contextPath }/resources/js/notice.js"></script>
</body>

</html>