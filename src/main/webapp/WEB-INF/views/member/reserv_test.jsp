<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title>달력</title>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Questrial&display=swap');

        body { background-color : skyblue; } 

        div {
            background-color : white;
            height: auto;
            width: 400px;
            margin: 0px;
            padding: 20px;
            margin: 0 auto;
            border-radius:5px;
            box-shadow:0px 40px 30px -20px rgba(0,0,0,0.3);
        }

        td {
            width: 50px;
            height: 50px;
        }

        .Calendar {
            text-align: center;
        }

        .Calendar>thead>tr:first-child>td {
            font-family: 'Questrial', sans-serif;
            font-size: 1.1em;
            font-weight: bold;
        }

        .Calendar>thead>tr:last-child>td {
            font-family: 'Questrial', sans-serif;
            font-weight: 600;     
        }

        .Calendar>tbody>tr>td>p {
            font-family: 'Montserrat', sans-serif;
            height: 45px;
            width: 45px;
            border-radius: 45px;
            transition-duration: .2s;
            line-height: 45px;
            margin: 2.5px;
            display: block;
            text-align: center;
        }        

        .pastDay {
            color: lightgray;
        }

        .today {
            background-color: #F5D042;            
            color: #fff;
            font-weight: 600;
            cursor: pointer;
        }

        .futureDay {
            background-color: #FFFFFF;
            cursor: pointer;
        }
        .futureDay:hover{
            background:#eee;
        }

        .futureDay.choiceDay,
        .today.choiceDay {
            background: #0A174E;
            color: #fff;
            font-weight: 600;
            cursor: pointer;
        }
    </style>

    <script>
        window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행

        let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
        let today = new Date();     // 페이지를 로드한 날짜를 저장
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
</head>

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
		<select id="centerSelect" onchange="getLessongInfoByCenter()">
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
		
		<!-- 셀렉트박스에서 선택한 센터의 수강권 정보를 업데이트할 부분 -->
		<div id="lessonListContainer">
				<!-- 여기에 ajax내용 들어감 -->
		</div>
		
<!-- 셀렉트박스에서 센터 선택하면 해당 센터의 수강권정보 가져오는 js  -->
	<script>
		function getLessongInfoByCenter() {
			var selectedCenterCode = document.getElementById("centerSelect").value;
			console.log("선택한 지점 코드 : " + selectedCenterCode);
			// Ajax 요청
			$.ajax({
						type : "Post",
						url : "getLessonList.do", // 적절한 URL로 변경
						data : {ctCode : selectedCenterCode},
						success : function(lessonList) {
							// 성공 시 아래에 정보 업데이트
							console.log("값 가져옴")

							var str = "";
							//  centerInfoContainer라는 아이디 가진 영역의 기존 내용을 지움
							$('#lessonListContainer').html('');
							if (lessonList.length < 1) {
								str = '<p>센터에서 등록한 수강권이 없습니다.<br> 센터에 문의하시기 바랍니다</p>'
								$('#lessonListContainer').append(str);
							} else {
								lessonList.forEach(function(item) {

											str = '<div class="list-group-ticket" id="'+item.lsCode+'">'
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
											
											// 예약하기 클릭 시 상세 가져오는 화면 작성 
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
</body>

</html>