<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style_memberpage.css">
<meta charset="UTF-8">
<title>마이페이지</title>
</head>

<body>


	<div class="container000">

		<section class="content000">
			<area1>
			<p>area1</p>
			</area1>

			<main> 
			
		<div id="myPage">
        <h3>마이페이지</h3>
        <div id="userInfo">
            <div id="myInfoLink">내 정보 관리</div>
            <div id="userInfoText">*** 회원님</div>
        </div>

<section class="my-passes container mt-5">
    <h3 class="text-center">나의 수강권 현황</h3>
    <div class="pass-box row">
        <div class="individual-pass col">
            <div class="pass-content">
                <p>[지점이름] 개인수강권</p>
                <p>기간: 2023.10.17~2023.12.08</p>
                <p>수강권내역: 사용중</p>
                <p>잔여일수: 126일 남음 / 총 150일</p>
                <p>잔여횟수: 34회 남음 / 총 60회</p>
                <p>사용가능지점: 1지점</p>
            </div>
        </div>
        <div class="group-pass col">
            <div class="pass-content">
                <p>[지점이름] 그룹수강권</p>
                <p>기간: 2023.10.17~2023.12.08</p>
                <p>수강권내역: 사용중</p>
                <p>잔여일수: 126일 남음 / 총 150일</p>
                <p>잔여횟수: 34회 남음 / 총 60회</p>
                <p>사용가능지점: 1지점</p>
            </div>
        </div>
    </div>
</section>
    

<section class="icon-list">
        <div class="icon-grid">
            <div class="icon-row">
                <div class="icon-item">
                <a href="memberNotice.jsp">
          		<!-- 아이콘 이미지나 아이콘 텍스트 넣기 -->
                  <p> 공지사항 </p>
                </a>  
                </div>
                <div class="icon-item">
                <a href="paymentHistory.jsp">
                  <!-- 아이콘 이미지나 아이콘 텍스트 넣기 -->
                  <p> 결제내역 </p>
                </a>  
                </div>
                <div class="icon-item">
                <a href="#">
                  <!-- 아이콘 이미지나 아이콘 텍스트 넣기 -->
                  <p> 연동센터관리 </p>
                </a>
                </div>
            </div>
            <div class="icon-row">
                <div class="icon-item">
                 <a href="FAQpage.jsp">
                  <!-- 아이콘 이미지나 아이콘 텍스트 넣기 -->
                  <p> FAQ </p>
                  </a>
                </div>
                <div class="icon-item">
                <a href="inquiry.jsp">
                  <!-- 아이콘 이미지나 아이콘 텍스트 넣기 -->
                  <p> 문의사항 </p>
                </a>
                </div>
                <div class="icon-item">
                <a href="#">
                  <!-- 아이콘 이미지나 아이콘 텍스트 넣기 -->
                  <p> 약관 및 정책 </p>
                </div>
            </div>
        </div>
    </section>

			</main>

			<area2>
			<p>area2</p>
			</area2>
		</section>

	</div>



</body>
</html>