<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Charts / ApexCharts - PilaAdmin Bootstrap Template</title>
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
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style_admin_info_getboard.css">

  <!-- 내가 만든 css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style_admin_common.css">
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
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">PilaFix</span>
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
              <a href="#">Show all notifications</a>
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
              You have 3 new messages
              <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="assets/img/messages-1.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>Maria Hudson</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>4 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="assets/img/messages-2.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>Anna Nelson</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>6 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="assets/img/messages-3.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>David Muldon</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>8 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="dropdown-footer">
              <a href="#">Show all messages</a>
            </li>

          </ul><!-- End Messages Dropdown Items -->

        </li><!-- End Messages Nav -->

        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">K. Anderson</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>Kevin Anderson</h6>
              <span>Web Designer</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
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
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="#">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
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
        <a class="nav-link " href="index.html">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-person"></i><span>고객관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="#">
              <i class="bi bi-circle"></i><span>회원관리</span>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="bi bi-circle"></i><span>강사관리</span>
            </a>
          </li>
          <li>
            <a href="admin_info_boardlist">
              <i class="bi bi-circle"></i><span>센터관리</span>
            </a>
          </li>
        </ul>
      </li><!-- End 고객관리 Nav -->
      
     <li class="nav-item">
        <a class="nav-link collapsed" href="#">
          <i class="bi bi-layout-text-window-reverse"></i>
          <span>커뮤니티 관리</span>
        </a>
      </li><!-- End 커뮤니티 관리 Nav -->
      
     <li class="nav-item">
        <a class="nav-link collapsed" href="#">
          <i class="bi bi-dash-circle"></i>
          <span>신고글 관리</span>
        </a>
      </li><!-- End 신고글 관리 Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-question-circle"></i><span>FAQ관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="#">
              <i class="bi bi-circle"></i><span>전체 FAQ 목록 조회</span>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="bi bi-circle"></i><span>FAQ 등록</span>
            </a>
          </li>
        </ul>
      </li><!-- End FAQ관리 Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-shield-check"></i><span>이용약관및정책관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="#">
              <i class="bi bi-circle"></i><span>전체 약관 목록 조회</span>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="bi bi-circle"></i><span>약관 등록</span>
            </a>
          </li>
        </ul>
      </li><!-- End Tables Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-exclamation-circle"></i><span>공지사항관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="#">
              <i class="bi bi-circle"></i><span>전체 공지사항 목록</span>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="bi bi-circle"></i><span>공지사항 등록</span>
            </a>
          </li>
        </ul>
      </li><!-- End Icons Nav -->
      

     <li class="nav-item">
        <a class="nav-link collapsed" href="#">
          <i class="bi bi-bell-fill"></i>
          <span>알림 발송이력 관리</span>
        </a>
      </li><!-- End 알림 발송이력 관리 Nav -->
      
     <li class="nav-item">
        <a class="nav-link collapsed" href="#">
          <i class="bi bi-envelope"></i>
          <span>문자 발송이력 관리</span>
        </a>
      </li><!-- End 문자 발송이력 관리 Nav -->

      <li class="nav-heading">Pages</li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="users-profile.html">
          <i class="bi bi-person"></i>
          <span>Profile</span>
        </a>
      </li><!-- End Profile Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-login.html">
          <i class="bi bi-box-arrow-in-right"></i>
          <span>Login</span>
        </a>
      </li><!-- End Login Page Nav -->
      
    </ul>

  </aside><!-- End Sidebar-->
      <!-- ============================================================================================ -->
 
 
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>센터 상세화면</h1>
      <!-- <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">필요 시 작성</li>기존에는 현재 위치 표시였음 Depth1>Depth2>Depth3 표시
        </ol>
      </nav> -->
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
             <p style="magin-top: 1%;"></p>
				<div class="row mb-300" style="width: 122%; margin-top: 1%;">
					<div class="col-sm-10">
						<input type="text" class="form-control" value="센터 프로필" disabled>
					</div>
				</div>
				<div class="col-400">
						<label class="form-label">센터명</label>
                 		<input type="text" readonly disabled class="form-control" value=${center.ctName }>
                </div>
					<div class="col-4000" style="margin-top: 1%;">
						<label class="form-label">주소</label>
                 		<input type="text" readonly disabled class="form-control" value='${center.ctAddress1} ${center.ctAddress2} ${center.ctAddress3}'>
				</div>
					<div class="col-40000">
						<label class="form-label">센터번호</label> 
						<input type="text" readonly disabled class="form-control" value=${center.ctPhoneNumber1 }${center.ctPhoneNumber2 }${center.ctPhoneNumber3 }>
					</div>
					<div class="col-40000" style="margin-top: 1%;">
						<label class="form-label">계약일</label>
						<input type="text" readonly disabled class="form-control" value=${center.contractStartDate }>
					
					</div>
					<div class="col-40000" style="margin-top: 1%;">
						<label class="form-label">계약만료일</label>
						<input type="text" readonly disabled class="form-control" value=${center.contractEndDate }>
					
					</div>
					<div class="col-40000">
						<label class="form-label">아이디</label> 
						<input type="text" readonly disabled class="form-control" value=${center.ctId }>
					</div>
					<div class="col-40000" style="margin-top: 1%;">
						<label class="form-label">계약 상태</label>
						<!-- 만료여부 Y이면 만료/해지여부 Y이면 해지/둘 다 N값이면 계약  -->
						<c:choose>
							<c:when	test="${center.contractExpiryYN eq false and center.contractRevokeYN eq false}">
								<input type="text" readonly disabled class="form-control" value="계약">
							</c:when>
							<c:when test="${center.contractExpiryYN eq true and center.contractRevokeYN eq false}">
								<input type="text" readonly disabled class="form-control" value="만료">
							</c:when>
							<c:when	test="${center.contractExpiryYN eq false and center.contractRevokeYN eq true}">
								<input type="text" readonly disabled class="form-control" value="해지">
							</c:when>
						</c:choose>
					</div>
					<div class="col-40000" style="margin-top: 1%;">
						<label class="form-label">만료여부</label>
						<!-- 만료여부 처리 -->
							<c:choose>
								<c:when test="${center.contractExpiryYN }">
									<input type="text" readonly disabled class="form-control" value="Y">					
								</c:when>
								<c:otherwise>
									<input type="text" readonly disabled class="form-control" value="N">
								</c:otherwise>
							</c:choose>
					</div>
					<div class="row mb-300" style="width: 122%; margin-top: 1%;">
					<div class="col-sm-10">
						<input type="text" class="form-control" value="대표자 정보" disabled>
					</div>
					</div>
					<div class="col-400">
						<label class="form-label">대표자 이름</label> 
						<input type="text" readonly disabled class="form-control" value=${center.ownerName }>
					</div>
					<div class="col-4000" style="margin-top: 1%;">
						<label class="form-label">대표자 이메일</label>
						<input type="text" readonly disabled class="form-control" value=${center.ownerEmail }>
					</div>
					<div class="col-400">
						<label class="form-label">대표자 번호</label> 
						<input type="text" readonly disabled class="form-control" value="${center.ownerPhoneNumber1 }${center.ownerPhoneNumber2 }${center.ownerPhoneNumber3 }">
					</div>
					<div class="col-4000" style="margin-top: 1%;">
						<label class="form-label">사업자 등록번호</label>
						<input type="text" readonly disabled class="form-control" value=${center.businessRegistrationNumber}>
					</div>
               </div>
               <div class="selectson">
					<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#basicModal2" >계약해지</button>
					<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#basicModal3" >비밀번호 초기화</button>
			   </div>
               <div class="row mb-6">
					<div class="col-sm-1000">
						<button type="submit" class="btn btn-primary" style="margin-left:2%;" onclick="location.href='getCenterList.do'">목록</button>
						<button type="submit" class="btn btn-primary" style="margin-left:78%;" onclick="location.href='updateCenter.do?ctCode=${center.ctCode}'">수정</button>
						<button type="button" class="btn btn-danger" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#basicModal">삭제</button>
						<button type="submit" class="btn btn-primary" onclick="history.go(-1)">취소</button>
					</div>
			   </div>
			   <div class="row mb-300" style="width: 122%; margin-top: 1%;">
					<div class="col-sm-10">
						<input type="text" class="form-control0" value="문자발송이력" disabled>
					</div>
				</div>
				<!-- 문자발송이력 테이블 추가 해야 함  -->
			   <table class="table datatable">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col" class="contentcol">내용</th>
							<th scope="col">수신인</th>
							<th scope="col">발송일</th>
						</tr>
					</thead>
					<tbody>
					
					<c:if test="">
						<tr>
							<td colspan="5">등록된 센터가 없습니다.</td>
						</tr>
					</c:if>
					<%--
					<c:forEach var="emailHistory" items="${emailHistory }">
						<tr>
							<th scope="row">1</th>
							<td>그룹 수업 6:1 [체어&바렐]수업이 2023.10.20(수요일) 오전 10:00에 예약되었습니다</td>
							<td>Designer</td>
							<td>2023-05-25</td>
						</tr>
						<tr>
							<td>${emailHistory.mhEmailSendCode }</td>
							<td>${emailHistory.mhRecipientTitle }</td>
							<td>${emailHistory.mhRecipientName }</td>
							<td>${emailHistory.mhEmailSendDate }</td>
						</tr>
					</c:forEach>
					 --%>
					</tbody>
				</table>
						
						
				<!-- End Table with stripped rows -->
				<div class="admin-screen-paging">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#">이전</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">다음</a></li>
					</ul>
				</div>
	          </div>
	        </div>
	      </div>
	    </section>

  </main><!-- End #main -->
  
<!-- 삭제 버튼 모달 -->
<div class="modal fade" id="basicModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">정말 삭제하시겠습니까?</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">삭제 버튼을 누르시면 다시 복구시킬 수 없습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" onclick="deleteCenter(${center.ctCode })">삭제</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달의 확인 누르면 삭제 진행-->

<!-- 계약 해지 버튼 모달 -->
<div class="modal fade" id="basicModal2" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">정말로 해지하시겠습니까?</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">해지하면 계약상태를 되돌릴 수 없습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" onclick="revokeCenter(${center.ctCode })">해지</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달의 확인 누르면 해지 진행-->

<!-- 비밀번호 초기화 버튼 모달 -->
<div class="modal fade" id="basicModal3" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">비밀번호를 초기화하시겠습니까?</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">초기 비밀번호 : 1111</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" onclick="resetPassword(${center.ctCode })">확인</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달의 확인 누르면 비밀번호 초기화 진행-->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>PilaAdmin</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://PilaFixmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://PilaFixmade.com/nice-admin-bootstrap-admin-html-template/ -->
       <a href="https://PilaFixmade.com/">PilaFixmade</a>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath }/resources/admin/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/admin/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="${pageContext.request.contextPath }/resources/admin/assets/vendor/echarts/echarts.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/admin/assets/vendor/quill/quill.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="${pageContext.request.contextPath }/resources/admin/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/admin/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath }/resources/admin/assets/js/main.js"></script>
</body>
<script type="text/javascript">

// 삭제 클릭 시 모달 작동 
function deleteCenter(ctCode){
	fetch('/pilafix/deleteCenter.do?ctCode=' + ctCode, {
		method: 'GET'
	})
		.then(response => {
			if (!response.ok) {
				throw new Error('error');
			}
			window.location.href = 'getCenterList.do'; // 에러나면 목록 페이지로 리다이렉트
		})
		.catch(error => {
			console.error(error);
		});
};


// 계약 해지 클릭 시 모달 작동 
function revokeCenter(ctCode){
	fetch('/pilafix/revokeCenter.do?ctCode=' + ctCode, {
		method: 'GET'
	})
		.then(response => {
			if (!response.ok) {
				throw new Error('error');
			}
			window.location.href = 'getCenterList.do'; // 에러나면 목록 페이지로 리다이렉트
		})
		.catch(error => {
			console.error(error);
		});
};

// 비밀번호 초기화 클릭 시 모달 작동 
function resetPassword(ctCode){
	fetch('/pilafix/resetPassword.do?ctCode=' + ctCode, {
		method: 'GET'
	})
		.then(response => {
			if (!response.ok) {
				throw new Error('error');
			}
			window.location.href = 'getCenterList.do'; // 에러나면 목록 페이지로 리다이렉트
		})
		.catch(error => {
			console.error(error);
		});
};


</script>
</html>