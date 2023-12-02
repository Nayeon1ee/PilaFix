
//세션에 저장된 csMemberCode 가져오기 
var csMemberCode = parseInt(document.getElementById('csMemberCode').getAttribute('data-cs-member-code'), 10);


$(document).ready(function() {
    csMemberCode = document.getElementById('csMemberCode').getAttribute('data-cs-member-code'); //세션에서 코드 가져옴 
	console.log(csMemberCode);
    
	// 로그인이 되었을 때만 setInterval 타이머 설정
    if (csMemberCode !== null && csMemberCode !== 0) {
        // 타이머로 3초 설정하여 AJAX로 DB 정보 요청
    	setInterval(function() {
    		var notificationBadge = $('#NotificationBadge');
    	    // AJAX를 이용하여 서버에 정보 요청
    	    $.ajax({
    	        url: 'unReadNotificationCount.do',
    	        method: 'POST',
    	        data: { csMemberCode: csMemberCode },
    	        success: function(response) {
    	            // 서버로부터의 응답 처리
    				if (response > 0) {
    					notificationBadge.empty();
    		            notificationBadge.html('<span class="badge rounded-pill bg-danger">' + response + '</span>');
    			    } else {
    			        notificationBadge.empty();
    			    }
    	        },
    	        error: function(error) {
    	            console.error('AJAX 요청 시 에러', error);
    	        }
    	    });
    	}, 30000000); // 3초에 한 번씩 실행 추후에 3000으로 바꾸기
    }
});

//종버튼 클릭 시 
$('#notificationsDropdown').on('click', function() {
    handleNotificationClick();
});

//공통으로 사용되는 상수 정의
const NO_NOTIFICATION_MESSAGE = '알림이 존재하지 않습니다.';
const DEFAULT_CENTER_NAME = '필라픽스';

//종 버튼 클릭 시 동작하는 함수
function handleNotificationClick() {
	csMemberCode = document.getElementById('csMemberCode').getAttribute('data-cs-member-code'); //세션에서 코드 가져옴 
	
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
						let ncReadYN = item.ncReadYN;
						
						if(ncReadYN){ //사용자가 확인했다면 
							var gstr = '<a class="dropdown-item"  style="color: #3c3c3d; background-color: #515152;" onclick="requestView(\''+ eventType + '\')">'; 
						}else{
							var gstr = '<a class="dropdown-item" onclick="updateNoticeStatus(\'' + ncId + '\',\'' + eventType + '\')">'; //여기서 onclick 시에 화면이동+함수호출해야 함 호출 시 item.ncId 넣어야 함
						}
						gstr += '<div>';
	
	                    if (item.centerName !== null) {
	                        gstr += '<small class="text-muted">' + item.centerName + '</small>'; // 센터이름이 존재한다면
	                    } else {
	                        gstr += '<small class="text-muted">' + DEFAULT_CENTER_NAME + '</small>'; // 관리자이면
	                    }
	
	                    gstr += '<div class="d-flex w-100 justify-content-between">';
	                    gstr += '<h5 class="mb-1">' + item.ncNoticeContent + '</h5>';
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


// 알림 클릭 시 

// 알림 클릭 시 알림테이블 확인여부 업데이트 
function updateNoticeStatus(ncId, eventType){
	console.log('Received ncId:', ncId);
    console.log('Received eventType:', eventType);
	
	$.ajax({
	        url: 'updateNoticeStatus.do',
	        method: 'POST',
	        data: { 
				ncId: ncId,
				eventType : eventType
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
	}else{
		window.location.href='#'; //추후 공지사항으로 이동 
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


