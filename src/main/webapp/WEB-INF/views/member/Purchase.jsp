<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- 아임포트 -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script>
    IMP.init('imp80610750')
    
    function requestPay() {
        IMP.request_pay({
          pg: "kcp", // 사용할 pg사의 요청 키워드
          pay_method: "card",
          //merchant_uid: "ORD20180131-011",   // 주문번호
          name: "노르웨이 회전 의자",
          amount: 100,                         // 금액(숫자 타입) 100원이상 결제해야오류 안나는거같음
          buyer_email: "gildong@gmail.com",
          buyer_name: "홍길동",
          buyer_tel: "010-4242-4242",
        }, function (rsp) { // callback
          //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
        	if ( rsp.success ) {
        // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
         // jQuery로 HTTP 요청
    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    	jQuery.ajax({
    		url: "payments.do", //cross-domain error가 발생하지 않도록 주의해주세요
    		type: 'POST',
    		dataType: 'json',
    		data: {
	    		imp_uid : rsp.imp_uid // 결제 고유번호
	    		//기타 필요한 데이터가 있으면 추가 전달
    		}
    	}).done(function(data) {
    		
    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
    		if ( everythings_fine ) {
    			var msg = '결제가 완료되었습니다.';
    			msg += '\n고유ID : ' + rsp.imp_uid;
    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
    			msg += '\결제 금액 : ' + rsp.paid_amount;
    			msg += '카드 승인번호 : ' + rsp.apply_num;
    			
    			alert(msg);
    		} else {
    			//[3] 아직 제대로 결제가 되지 않았습니다.
    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
    		}
    	});
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg; //결제 실패 메세지
        console.log(rsp.error_code);
        
        alert(msg);
    }
        
        
        });
      }
    </script>
    <meta charset="UTF-8">
    <title>Sample Payment</title>
</head>
<body>
    <button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->
</body>
</html>