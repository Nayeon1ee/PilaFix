<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>센터 연동요청</title>
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
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common_0.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/css/style.css"
	rel="stylesheet">

<!-- 내가 넣은 js -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- =======================================================
  * Template Name: PILAFIX
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/PILAFIX-free-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<!--  내 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_centeraddress.css" />

<body>


	<!-- ======= Header ======= -->
	<%@ include file="member_header_common.jsp"%>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">

				<ol>
					<li><a href="index.html">Home</a></li>
					<li>Contact</li>
				</ol>
				<h2>연동 센터 찾기</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Contact Section ======= -->
		<section id="contact" class="contact">
			<div class="container" style="max-width: 1000px">

				<div class="row">


					<div class="col-lg-12">
						<form action="forms/contact.php" method="post" role="form"
							class="php-email-form mb-3">


							<div class="container" style="max-width: 600px;">
								<div class="row">
									<div class="col-md-6 form-group">
										<label for="staticEmail" class="col-sm-6 col-form-label">연동
											센터 찾기</label>
									</div>
									<div class="col-md-9 form-group mt-3 mt-md-0">
										<label for="basic-url" class="form-label">원하는 센터를
											검색하세요!</label>
									</div>
								</div>
								<div class="form-group mt-3 text-center">
									<div class="input-group">
										<input type="text" class="form-control" id=searchKeyword
											name="searchKeyword"
											aria-describedby="basic-addon3 basic-addon4"
											placeholder="센터명, 주소를 입력"> <input
											class="btn btn-primary" type="button" id="searchCt"
											value="검색" />
									</div>
								</div>


							</div>

							<!--  검색 누르기 전까지는 이 화면이었다가 검색 누르면 바껴야함 -->
							<div class="row" id="insertCenterList"
								style="text-align: center; padding: 20px;">
								<p style="font-size: 1.5em; font-weight: bold; color: #343a40;">이렇게
									검색해 보세요!</p>
								<div class="col-md-6 offset-md-3">
									<p style="font-size: 1.2em; font-weight: bold; color: #865adf;">센터명</p>
									<p style="font-size: 1.1em; color: #6c757d;">바디코디 필라테스</p>
									<br>
									<p style="font-size: 1.2em; font-weight: bold; color: #865adf;">센터
										주소</p>
									<p style="font-size: 1.1em; color: #6c757d;">부산 부산진구 중앙대로
										650</p>
								</div>
							</div>




						</form>
					</div>

				</div>


				<!-- 요청 모달-->
				
				<div class="modal fade" id="requestModal" tabindex="-1">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">센터 연동 요청</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body"><b><span id="ctName"></span></b> 센터로 고객님의 <b>성함과 연락처</b>가 전송됩니다.<br>연동 신청 하시겠습니까?</div>
							<span hidden id="ctCode"></span> 
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary" onclick="connectRequest()">확인</button>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 기 요청건 존재로 인한 요청 불가 모달  -->
				<div class="modal fade" id="alreadyRequestModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="highlight-section">
									<p class="hightlight-text" style="font-size: 18px;">
										<b>이미 요청한 센터입니다!</b><br>
										센터에서 회원님의 요청을 수락할 때까지 다소 시간이 소요될 수 있습니다.<br>
									</p>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>

							</div>
						</div>
					</div>
				</div>
				<!-- 연동된 센터 한도 초과 시 예약 불가 모달  -->
				<div class="modal fade" id="limitedConnectionModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div
						class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="highlight-section">
									<p class="hightlight-text" style="font-size: 18px;">
										<b>센터 연동은 최대 3개까지 가능합니다.</b><br><br>
										해당 센터과 연동을 원하신다면 <a href="myConnectedCenter.do">마이페이지-연동이력관리</a>에서 해제 후 
										연동 요청하여 주시기 바랍니다.<br>
										
									</p>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>

							</div>
						</div>
					</div>
				</div>
				
				<!-- 모달 끝 -->


			</div>
		</section>

		<!-- End Contact Section -->
	</main>

	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="member_footer_common.jsp"%>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

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


<!-- 센터연동 검색 -->
<script type="text/javascript">

    $("#searchCt").click(function(){
    
    	var searchKeyword = $('#searchKeyword').val();
        console.log(searchKeyword);
    	
        $.ajax({
            type:'get', //post 형식으로 controller 에 보내기위함!!
            url:"searchCt.do?searchKeyword="+searchKeyword, // 컨트롤러로 가는 mapping 입력
            //contentType: "application/x-www-form-urlencoded; charset=UTF-8",
           // data: {"searchKeyword":searchKeyword}, // 원하는 값을 중복확인하기위해서  JSON 형태로 DATA 전송
            success: function(data){ 
                console.log(data);
                var str = "";
                //  insertCenterList라는 아이디 가진 영역의 기존 내용을 지움
                $('#insertCenterList').html('');
                if (data.length < 1){
                	str = '<p>검색된 결과가 없습니다</p>'
                		$('#insertCenterList').append(str);
                }else{
                data.forEach(function(item){
    					str+='<div class="col-lg-6">'
    					str+='<div class="info-box mb-4">'
    					str+='<i class="bx bx-map"></i>'
    					str += "<h3>"+item.ctName+"</h3>";
    					str+="<p>("+item.ctAddress+")</p><br>";
    					str+='<input type="button" class="btn btn-primary" value="연동 신청" onclick="checkRequest(\'' + item.ctName + '\', \'' + item.ctCode + '\')">';
    					str+="</div>"
    					str+="</div>"
    					// insertCenterList라는 아이디를 가진 영역에 위의 내용 삽입해줌
    					;
			
        		})
        		$('#insertCenterList').append(str)
                }
         },
            error : function(error){alert(error);}
        });
        
    });

// 요청 가능 여부 체크 
function checkRequest(ctName, ctCode){
	console.log("요청가능여부 체크");
	console.log(ctCode);
	
	$.ajax({
        url: 'checkRequest.do',
        method: 'POST',
        data: {ctCode: ctCode}, 
        success: function(response) {
        	
        	console.log("예약 가능 여부 체크 ");
        	if(response.checkMyCenter !== 0){ // 연동센터 한도 초과 
        		$('#limitedConnectionModal').modal('show');
        	}else if(response.checkRequest !== 0){ // 기 요청건 존재
        		$('#alreadyRequestModal').modal('show');
        	}else{
        		$('#ctName').text(ctName);
        		$('#ctCode').text(ctCode);
        		$('#requestModal').modal('show');
        	}
        	
        },
        error: function(error) {
            console.error('AJAX 요청 시 에러', error);
            return false;
        }
    });
	
}

    
// 연동 요청 누르면 연동요청 테이블에 고객정보 입력
function connectRequest(ctCode) {
	 var ctCode = $('#ctCode').text();
	 
	 console.log("연동요청센터");
	 console.log(ctCode);
	 
	 
      $.ajax({
          type: 'post',
          url: 'connectRequest.do',
          data: {
              ctCode: ctCode
          },
          success: function(data) {
        	  
          	console.log(data);
          	var resultAsString = data.toString(); // int를 문자열로 변환
              if (resultAsString === '1') {
            	  window.location.href='mainPage.do';
              } else {
              	console.error(error); // 오류를 콘솔에 출력
              		window.location.href='mainPage.do';
              }
          	
          },
          error: function(error) {
              alert('오류가 발생했습니다.');
          }
      });
}
</script>

	<script src="${pageContext.request.contextPath }/resources/js/notice.js"></script>
</body>

</html>