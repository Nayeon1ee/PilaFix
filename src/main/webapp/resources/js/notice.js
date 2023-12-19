
//세션에 저장된 csMemberCode 가져오기 
var csMemberCode = parseInt(document.getElementById('csMemberCode').getAttribute('data-cs-member-code'), 10);


$(document).ready(function() {
   csMemberCode = document.getElementById('csMemberCode').getAttribute('data-cs-member-code'); //세션에서 코드 가져옴 
   console.log(csMemberCode);
   
    // 로그인이 되었을 때만 SSE 연결 
    if (csMemberCode !== "0" && csMemberCode !== null) {

        // SSE 연결을 시도하는 함수
        function connectSSE() {
            const eventSource = new EventSource('sse/stream.do?csMemberCode=' + csMemberCode);

            // SSE 이벤트 핸들러 등록 
            eventSource.onmessage = function (event) {
                const response = JSON.parse(event.data);
                if (response > 0) {
                    updateNotificationBadge(response);
                }
            };

            // SSE 연결 오류 핸들러 
            eventSource.onerror = function (error) {
                console.error('SSE connection error:', error);
                $('#NotificationBadge').empty();

                // 일정 시간 후에 재시도
                setTimeout(connectSSE, 5000); // 5초 후에 재시도 (원하는 시간으로 수정 가능)
            };
        }

        // 최초 SSE 연결 시도
        connectSSE();
    }
});

// 알림 수 업데이트 함수
function updateNotificationBadge(count) {
    var notificationBadge = $('#NotificationBadge');
    notificationBadge.empty();

    if (count > 0) {
        notificationBadge.html('<span class="badge rounded-pill bg-danger">' + count + '</span>');
    }
}

//종버튼 클릭 시 
$('#notificationsDropdown').on('click', function() {
    handleNotificationClick();
	$('#notificationsDropdown').toggleClass('show');  // 토글 클래스 사용
    $('#notificationsContentDropdown').toggleClass('show');  // 토글 클래스 사용
});

//공통으로 사용되는 상수 정의
const NO_NOTIFICATION_MESSAGE = '알림이 존재하지 않습니다.';
const DEFAULT_CENTER_NAME = '필라픽스';

//종 버튼 클릭 시 동작하는 함수
function handleNotificationClick() {
   csMemberCode = document.getElementById('csMemberCode').getAttribute('data-cs-member-code'); //세션에서 코드 가져옴 
   
   console.log("handleNotificationClick 호출됨");
   
   $.ajax({
           url: 'getUnReadNotification.do',
           method: 'POST',
           data: { csMemberCode: csMemberCode },
           success: function(response) {
              console.log("success 수신 ");
               console.log(response);
               
               $('#NotificationsList').html('');
               
               if (response.length < 1) {
                   $('#NotificationsList').append('<div class="dropdown-item">' + NO_NOTIFICATION_MESSAGE + '</div>');
               } else {
                   response.forEach(function (item) {
                       let eventType = item.eventType; 
                  let ncId = item.ncId;
                  let ncReadYn = item.ncReadYn;
                  
                  if(ncReadYn){ //사용자가 확인했다면 
                     var gstr = '<a class="dropdown-item" style="background-color: #f8f9fa; border-bottom:1px solid #f0f0f0;"  onclick="requestView(\''+ eventType + '\')">'; 
                  }else{
                     var gstr = '<a class="dropdown-item" style="background-color: #f8f4ff; border-bottom:1px solid #f0f0f0;" onclick="updateNoticeStatus(\'' + ncId + '\',\'' + eventType + '\')">'; //여기서 onclick 시에 화면이동+함수호출해야 함 호출 시 item.ncId 넣어야 함
                  }
                  gstr += '<div>';
   
                       if (item.centerName !== null) {
                           gstr += '<small class="text-muted">' + item.centerName + '</small>'; // 센터이름이 존재한다면
                       } else {
                           gstr += '<small class="text-muted">' + DEFAULT_CENTER_NAME + '</small>'; // 관리자이면
                       }
   
                       gstr += '<div class="d-flex w-100 justify-content-between">';
                       gstr += '<h5 class="mb-1"><font style="font-weight:bold;">' + item.ncNoticeContent + '</font></h5>';
                       gstr += '</div>';
                       gstr += '<small class="text-muted">' + formatTimestamp(item.eventDatetime) + '</small>';
                       gstr += '</div>';
                       gstr += '</a>';
   
   
                       $('#NotificationsList').append(gstr);
                   });
             }
            },
           error: function(error) {
               console.error('AJAX 요청 시 에러', error);
           }
       });
}

// 알림 클릭 시 알림테이블 확인여부 업데이트 
function updateNoticeStatus(ncId, eventType){
   console.log('Received ncId:', ncId);
    console.log('Received eventType:', eventType);
   
   $.ajax({
           url: 'updateNoticeStatus.do',
           method: 'POST',
           data: { 
            ncId: ncId,
            eventType: eventType
          },
           success: function(response) {
              console.log("확인여부 업데이트 완료");
            requestView(eventType);
           },
           error: function(error) {
               console.error('AJAX 요청 시 에러', error);
           }
       });
}

// 확인한 알림 클릭 시 화면 이동 
function requestView(eventType){
   if(eventType === '예약' || eventType  === '예약취소'){ //예약이거나 예약취소이면 내스케줄 페이지
      window.location.href='schedule.do';
   }else if(eventType === '답변등록'){
      window.location.href='questionPage.do'; //문의사항
   }else{
      window.location.href='myNoticePage.do'; //공지사항 
   }
}


// "yyyy.MM.dd HH:mm" 형식으로 날짜를 변환하는 함수
function formatTimestamp(timestamp) {
    const date = new Date(timestamp);
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    const hours = String(date.getHours()).padStart(2, '0');
    const minutes = String(date.getMinutes()).padStart(2, '0');

    return `${year}.${month}.${day} ${hours}:${minutes}`;
}

