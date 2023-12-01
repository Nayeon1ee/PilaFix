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
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_myschedule.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_insert_calendar.css">

<!-- 달력 -->



<!--  달력 -->

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
					<li>Check schedule</li>
				</ol>
				<h2>스케줄 확인</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container mx-auto" style="max-width: 1000px;">

				<!-- 7:3 비율 잡기 위한 컨테이너 -->
				<div class="container d-flex justify-content-center p-0 m-0">
					<div class="row">
					<div id='calendar'></div>
					</div>
					<!-- 7:3 비율 컨테이너 닫기 -->


					<!-- 두 번째 컬럼 (7:3) -->
					<div class="col-md-5 content1 ms-4">
							<div class="card rounded">
								<div class="card-header bg-white" style="height: 100px;">
									<font style="font-weight: bold;">당월 출석 현황</font><br> <br>
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
							style="min-height: 500px; max-height: 500px; ">



							<div class="card-header-con py-1 mt-1 custom-rounded">
								<div class="btn-group d-flex py-1" role="group"
									aria-label="Basic radio toggle button group">
									<input type="button" class="btn-check" name="options" id="option1" autocomplete="off"> 
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
							<div class="schedule-card" style=" max-height: 400px;">
								
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
	

<!-- 캘린더 js -->
<script>
   document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {
         initialView: 'dayGridMonth',
         contentHeight: '500', // 캘린더 세로 크기 설정
         locale: 'ko',
         editable: true, // 수정 여부
         headerToolbar: {
            left: 'prev',
            center: 'title',
            right: 'next'
         },
         
         selectable: true,
         themeSystem: 'bootstrap', // 부트스트랩 테마 사용
         bootstrapFontAwesome: false, // 부트스트랩 아이콘 사용 안 함
         customButtons: {
            prev: {
               text: '이전',
               click: function() {
                  calendar.prev();
               }
            },
            next: {
               text: '다음',
               click: function() {
                  calendar.next();
               }
            }
         },
         
         buttonText: {
            today: '오늘',
            month: '월',
            week: '주',
            day: '일',
            list: '목록'
         },
         eventContent: function(arg) {
            return {
               html: '<div style="background-color: #9b56e9; color: white; padding: 5px;">' + arg.event.title + '</div>'
            };
         },
         
       // ajax로 캘린더에 일정 넣기
         eventSources: [{
     		events: function(info, successCallback) {
     			//달력의 시작 날짜 가져옴 (11월이면 10월 마지막주 날짜로 시작해서 10 더해줌/ 서버에서 월만 쓸거라 정확한 날짜 중요x) 
     			var startDate = new Date(info.start);
     			startDate.setDate(startDate.getDate() + 10);

     			var calenderDate = startDate.toISOString().slice(0, 10);
     			console.log("달력의 날짜"+calenderDate);
     		
     			$.ajax({
     				url: 'getMonthSchedule.do',
     				type: 'POST',
     				dataType: 'json',
     				data: {calenderDate:calenderDate },
     				success: function(data) {
     					successCallback(data);
     				}
     			});
     		}
     	}],
         eventClick: function(info) {
            window.location.href(info.event.url);
         }
      });

      // 전체 텍스트 색상 변경
      calendarEl.style.color = '#9b56e9';

      calendar.render();
   });

 
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
									str += '<div class="card-header bg-white">'+formattedDate+'</div>';
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
									str += '<div class="card-header bg-white">'+formattedDate+'</div>';
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
									str += '<div class="card-header bg-white">'+formattedDate+'</div>';
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
                 $('#allInfo').html('');
                 $('#reservInfo').html('');
                 $('#attendInfo').html('');
                 $('#absentInfo').html('');
                 //반환된 맵이 비어있으면 출력
                 if (Object.keys(allInfo).length === 0) {
                	 	console.log("맵이 비어있음");
						$('#allInfo').append('<p>이번달에 스케줄이 없습니다.</p>');
					} else {
						if (allInfo.hasOwnProperty('reservInfo')) {
			                console.log("reservInfo 존재함");
			                // reservInfo가 존재하는 경우의 작업 수행
			                var reservInfoList = allInfo.reservInfo;
			                // reservInfoList를 이용한 작업 수행
			            }else if (allInfo.hasOwnProperty('attendanceInfo')){
			            	console.log("attendanceinfo존재함")
			            }
						/*	// allInfo는 맵이므로 배열 메서드가 아닌 맵을 다루는 방식으로 접근해야 합니다.
			            // 예: allInfo.forEach(...)가 아닌 Object.values(allInfo).forEach(...)를 사용
			            Object.values(allInfo).forEach(function (item) {
			                // lsDate를 월-일(요일) 형태로 포맷팅
			                var date = new Date(item.lsDate);
			                var formattedDate = new Intl.DateTimeFormat('ko-KR', {
			                    month: 'short',
			                    day: 'numeric',
			                    weekday: 'short'
			                }).format(date);

			                var str = '<div class="card" style="border-radius: 0;">';
			                str += '<div class="card-header bg-white">' + formattedDate + '</div>';
			                str += '<div class="card-body">';
			                str += '<div class="mt-3" style="margin-top:0px!important">';
			                str += '<small class="text-muted"><strong id="absentColor">결석</strong> &nbsp; ' + item.lsTime + ' ~ ' + item.lsEndTime + '</small>';
			                str += '<div class="d-flex w-100 justify-content-between">';
			                str += '<h5 class="my-auto" style="color: black;">' + item.lsName + '</h5>';
			                str += '</div>';
			                str += '<small class="text-muted">' + item.trainerMemberName + ' 강사</small><br>';
			                str += '<small class="text-muted">' + item.centerName + ' - ' + item.lsType + '수업</small>';
			                str += '</div>';
			                str += '</div>';
			                str += '</div>';
			                $('#absentInfo').append(str);
			            });*/

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

</body>

</html>