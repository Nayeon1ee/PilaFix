<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>센터 관리자 페이지</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath }/resources/admin/assets/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath }/resources/admin/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath }/resources/admin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/admin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/admin/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/admin/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/admin/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/admin/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/admin/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/assets/css/style.css">

<!-- 내가 만든 css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style_admin_common.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style_admin_terms.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style_admin_common_2.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style_admin_centerReg.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style_admin_info_getboard.css">
  
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <!-- =======================================================
  * Template Name: PilaAdmin
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://PilaFixmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: PilaFixmade.com
  * License: https://PilaFixmade.com/license/
  ======================================================== -->
</head>

<body>
  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="centerMain.do" class="logo d-flex align-items-center">
        <img src="assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">PILAFIX</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="POST" action="#">
        <input type="text" name="query" placeholder="Search" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-bell"></i>
            <span class="badge bg-primary badge-number">4</span>
          </a><!-- End Notification Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
            <li class="dropdown-header">
              You have 4 new notifications
              <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-exclamation-circle text-warning"></i>
              <div>
                <h4>Lorem Ipsum</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>30 min. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-x-circle text-danger"></i>
              <div>
                <h4>Atque rerum nesciunt</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>1 hr. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-check-circle text-success"></i>
              <div>
                <h4>Sit rerum fuga</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>2 hrs. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-info-circle text-primary"></i>
              <div>
                <h4>Dicta reprehenderit</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>4 hrs. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>
            <li class="dropdown-footer">
              <a href="#">전체 연동요청 보러가기</a>
            </li>

          </ul><!-- End Notification Dropdown Items -->

        </li><!-- End Notification Nav -->

        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-chat-left-text"></i>
            <span class="badge bg-success badge-number">3</span>
          </a><!-- End Messages Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
            <li class="dropdown-header">
              새로운 문의사항 확인
              <a href="getCTQuestionList.do"><span class="badge rounded-pill bg-primary p-2 ms-2">전체보기</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

    <!-- 문의사항 목록을 forEach로 출력 -->
    <c:forEach var="question" items="${questionList}">
        <li class="message-item">
            <a href="#">
                <img src="assets/img/messages-1.jpg" alt="" class="rounded-circle">
                <div>
                    <h4>${question.qsTitle}</h4>
                    <p>${question.qsContent}</p>
                    <p>${question.qsRegdate}</p>
                </div>
            </a>
        </li>
        <li>
            <hr class="dropdown-divider">
        </li>
    </c:forEach>

            <li class="dropdown-footer">
              <a href="getCTQuestionList.do">전체 문의사항 보러가기</a>
            </li>

          </ul><!-- End Messages Dropdown Items -->

        </li><!-- End Messages Nav -->

        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
<!--             <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle"> -->
            <span class="d-none d-md-block dropdown-toggle ps-2">${sessionScope.loginCenter.ctName}</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>${sessionScope.loginCenter.ctName}</h6>
              <span>필라테스센터</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="centerMypage.do">
                <i class="bi bi-person"></i>
                <span>센터정보관리</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

<!--             <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-gear"></i>
                <span>Account Settings</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
                <i class="bi bi-question-circle"></i>
                <span>Need Help?</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li> -->

            <li>
              <a class="dropdown-item d-flex align-items-center" href="centerLogout.do">
                <i class="bi bi-box-arrow-right"></i>
                <span>로그아웃</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-item">
				<a class="nav-link " href="#"> 
					<i class="bi bi-grid"></i> <span> 정보</span>
				</a>
			</li>
			<!-- End Dashboard Nav -->
			<!-- 통계 예정  -->

			<li class="nav-item">
				<a class="nav-link collapsed" href="getMemberManageList.do"> 
					<i class="bi bi-person"></i>
						<span>회원 관리</span>
						<span class="badge bg-primary" id="memberCount">
							<!-- 여기에 ajax로 가져온 연동요청한 회원수 호출 -->
						</span> 
				</a>
			</li>
			<!-- End 회원관리 Nav -->

			<li class="nav-item">
				<a class="nav-link collapsed" href="getTrainerManageList.do"> 
					<i class="bi bi-journal-text"></i>
						<span>강사 관리</span>
						<span class="badge bg-primary" id="trainerCount">
							<!-- 여기에 ajax로 가져온 연동요청한 강사수 호출 -->
						</span>
				</a>
			</li>
			<!-- End 강사관리 Nav -->

			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" >
					<i class="bi bi-person"></i>
					<span>수업 관리</span>
					<i class="bi bi-chevron-down ms-auto"></i>
				</a>
				<ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
					<li>
						<a href="getCenterLessonList.do"><i class="bi bi-circle"></i>
							<span>수업 목록 조회</span>
						</a>
					</li>
					<li>
						<a href="insertCenterLesson.do"><i class="bi bi-circle"></i>
							<span>수업 개설</span>
						</a>
					</li>
				</ul>
			</li>
			<!-- End 수업관리 Nav -->
			
			
			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse">
					<i class="bi bi-question-circle"></i><span>수강권 관리</span>
					<i class="bi bi-chevron-down ms-auto"></i>
				</a>
				<ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
					<li>
						<a href="getCenterTicketList.do"> 
							<i class="bi bi-circle"></i><span>수강권 목록 조회</span>
						</a>
					</li>
					<li>
						<a href="insertCenterTicket.do"> 
							<i class="bi bi-circle"></i><span>수강권 등록</span>
						</a>
					</li>
				</ul>
			</li>
			<!-- End 수강권관리 Nav -->
			
			<li class="nav-item">
				<a class="nav-link collapsed" href="getCTQuestionList.do"> 
					<i class="bi bi-envelope"></i><span>문의사항 관리</span>
					<span class="badge bg-primary" id="questionCount">
						<!-- 여기에 ajax로 가져온 답변 안달린 문의사항 갯수 호출 -->
					</span>
				</a>
			</li>
			<!-- End [센터]문의사항 Nav -->
			
			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" >
					<i class="bi bi-shield-check"></i>
						<span>공지사항 관리</span>
					<i class="bi bi-chevron-down ms-auto"></i>
				</a>
				<ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
					<li>
						<a href="getCenterInfoList.do"> 
							<i class="bi bi-circle"></i><span>전체 공지사항 목록 조회</span>
						</a>
					</li>
					<li>
						<a href="insertCenterInfo.do"> 
							<i class="bi bi-circle"></i><span>공지사항 등록</span>
						</a>
					</li>
				</ul>
			</li>
			<!-- End 공지사항관리 Nav -->
			
			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#userguide-nav" data-bs-toggle="collapse" >
					<i class="bi bi-shield-check"></i>
						<span>이용정책 관리</span>
					<i class="bi bi-chevron-down ms-auto"></i>
				</a>
				<ul id="userguide-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
					<li>
						<a href="getUserguideList.do"> 
							<i class="bi bi-circle"></i><span>이용정책 목록 조회</span>
						</a>
					</li>
					<li>
						<a href="insertUserguide.do"> 
							<i class="bi bi-circle"></i><span>이용정책 등록</span>
						</a>
					</li>
				</ul>
			</li>
			<!-- End 이용정책관리 Nav -->

			<li class="nav-item">
				<a class="nav-link collapsed" href="getNoticeHistoryList.do"> 
					<i class="bi bi-card-list"></i>
					<span>알림 발송 이력 관리</span>
				</a>
			</li>
			<!-- End [센터]알림 발송 이력 관리 Nav -->

			<li class="nav-item">
				<a class="nav-link collapsed" href="getSendSmsHistoryListForCe.do"> 
					<i class="bi bi-envelope"></i> 
					<span>문자 발송 이력 관리</span>
			</a></li>
			<!-- End [센터]문자 발송 이력 관리 Nav -->


			
			
			<li class="nav-heading">Pages</li>

			<li class="nav-item">
				<a class="nav-link collapsed" href="centerMypage.do"> 
					<i class="bi bi-person"></i> <span>Profile</span>
				</a>
			</li>
			<!-- End Profile Page Nav -->

			<li class="nav-item">
				<a class="nav-link collapsed" href="centerLogin.do"> 
					<i class="bi bi-box-arrow-in-right"></i><span>Login</span>
				</a>
			</li>
			<!-- End Login Page Nav -->

		</ul>

	</aside>
	<!-- End Sidebar-->
	
	<script>
    $(document).ready(function() {
        $.ajax({
            url: "getCount.do",
            type: "POST",
            success: function(response) {
                $('#memberCount').html('');
                if (response.memberCount>0){
					$('#memberCount').append(response.memberCount);
                }
                $('#trainerCount').html('');
                if (response.trainerCount>0){
					$('#trainerCount').append(response.trainerCount);
                }
                $('#questionCount').html('');
                if (response.questionCount>0){
					$('#questionCount').append(response.questionCount);
                }
                
            },
            error: function(error) {
                console.error("Error:", error);
            }
        });
    });
</script>
      <!-- ============================================================================================ -->
 