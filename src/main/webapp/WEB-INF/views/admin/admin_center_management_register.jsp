<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style_admin_info.css">
  
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

  </aside><!-- End Profile Page Nav -->

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
			<h1>센터 등록</h1>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
							<p style="magin-top: 1%;"></p>
							<form name="admin_info" action="insertCenter.do" method="post">
								
								<!-- 센터명, 센터 번호 -->
								<div class="col-30" >
									<label class="form-label">센터명</label>
									<input type="text" class="form-control" name="ctName" placeholder="센터명을 입력하세요">
								</div>
								<div class="col-30">
									<label class="form-label">센터 번호</label>
										<select class="form-select" name="ctPhoneNumber1">
											<option value="02" selected="selected" >02</option>
											<option value="070">070</option>
											<option value="031">031</option>
											<option value="032">032</option>
											<option value="033">033</option>
											<option value="041">041</option>
											<option value="042">042</option>
											<option value="043">043</option>
											<option value="044">044</option>
											<option value="051">051</option>
											<option value="052">052</option>
											<option value="053">053</option>
											<option value="054">054</option>
											<option value="055">055</option>
											<option value="061">061</option>
											<option value="062">062</option>
											<option value="063">063</option>
											<option value="064">064</option>
										</select>
										<input type="text" class="form-control" name="ctPhoneNumber2" size="4"><input type="text" class="form-control" name="ctPhoneNumber3" size="4"> </p> 
								</div>
								
								<!-- 주소  -->
								<div class="col-6">
									<label class="form-label">센터주소</label> 
								</div>
								<div class="col-120">
									<input type="text" readonly class="form-control" placeholder="우편번호" id="ctAddress1" name="ctAddress1" style="width: 42%;">
									<div class="col-sm-100">
										<button type="button" class="btn btn-outline-primary" onclick="address()" >우편번호 찾기</button>
									</div>
								</div>
								<div class="col-12">
									<label class="form-label">도로명</label> 
									<input type="text" readonly class="form-control" id="ctAddress2" placeholder="도로명주소" size="60" name="ctAddress2" >
								</div>
								<div class="col-12" >
									<label class="form-label">상세주소</label>
									<input type="text" class="form-control" placeholder="상세주소" name="ctAddress3" size="60" >
								</div>
								
								<!-- 대표자 정보 -->
								<div class="col-40">
									<label class="form-label" >대표자명</label> 
									<input type="text" class="form-control" name="ownerName" >
								</div>
								<div class="col-40" style="margin-top: 1%;">
									<label class="form-label">사업자 등록번호</label>
									<input type="text" class="form-control"  name="businessRegistrationNumber" placeholder="10자리를 입력하세요.">
								</div>
								<div class="col-40">
									<label class="form-label">대표자 이메일</label> 
									<input type="email" class="form-control" id="ownerEmail" name="ownerEmail" placeholder="이메일을 입력하세요">
									<button type="button" class="btn btn-primary" id="ctEmailCheck">중복확인</button>
									<div id="ctEmailCheckMessage"></div>
								</div>
								
								<div class="col-40">
									<label class="form-label">대표자 연락처</label>
									<div class="col-400" style="display: flex;">
										<input type="text" class="form-control" name="ownerPhoneNumber1" size="3"><input class="form-control" type="text" name="ownerPhoneNumber2" size="4"><input class="form-control" type="text" name="ownerPhoneNumber3" size="4"> 
									</div>
								</div>
								
								<div class="row mb-3" style="margin-top: 3%;">
									<label for="inputNumber" class="col-sm-2 col-form-label">사업자등록증</label>
									<div class="col-sm-10">
										<input class="form-control" type="file" id="formFile">
										<!-- 기능 구현 후 주석 해제 
										<input class="form-control" type="file" id="formFile" name="businessRegistrationFile"> -->
									</div>
								</div>
								
								<div class="row mb-3">
									<label for="inputDate" class="col-sm-2 col-form-label0" style="margin-top: 3%;">계약기간</label>
									<div class="col-sm-10" style="margin-top: 3%;">
										<input type="date" class="form-control" name="contractStartDate" style="float: left; width: 25%;">
										<p style="float: left; font-size: 30px;">~</p>
										<input type="date" class="form-control" name="contractEndDate" style="float: left; width: 25%;">
									</div>
								</div>
								
								
								<!-- 계정 발급 -->
								<div class="col-120">
									<label class="form-label" >아이디</label>
									<input type="text" id="ctId" name="ctId" placeholder="아이디를 입력하세요">
									<button type="button" class="btn btn-primary" id="ctIdCheck">중복확인</button>
									<div id="ctIdCheckMessage"></div>
								</div>
								<div class="col-120">
									<label class="form-label">비밀번호</label> 
									<input type="text" id="ctPassword" name="ctPassword" readonly>
									<button type="button" class="btn btn-primary" onclick="generatePIN()">PIN 발급</button>
								</div>
								
								<div class="row mb-6">
									<div class="col-sm-1000">
										<button type="submit" class="btn btn-primary">등록</button>
										<button type="button" class="btn btn-primary" onclick="location.href='getCenterList.do'">취소</button>
									</div>
								</div>
							</form>
							<!-- End General Form Elements -->
						</div>
					</div>
				</div>
			</div>
		</section>

  </main><!-- End #main -->
 
 
 
    

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
  <!-- jQuery  -->
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <!-- 다음 주소 api -->
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</body>

<script type="text/javascript">
<!-- 비밀번호 PIN 발급 -->
function generatePIN() {
	  var pin = Math.floor(10000 + Math.random() * 90000);
	  document.getElementById("ctPassword").value = pin;
}

<!-- 아이디 중복확인 -->
$(function(){
    $("#ctIdCheck").click(function(){
        let ctId = $("#ctId").val();  //아이디
        $.ajax({
            type: 'post', 
            url: "ctIdCheck.do", 
            data: {"ctId": ctId}, 
            success: function(data){ 
                let messageDiv = $("#ctIdCheckMessage");
                if(data < 1){ 
                    // 사용 가능한 아이디인 경우 메시지 표시
                    messageDiv.html("사용 가능한 아이디입니다.");
                    messageDiv.css("color", "green"); 
                } else { 
                    // 중복된 아이디인 경우 메시지 표시
                    messageDiv.html("중복된 아이디입니다. 다른 아이디를 입력해주세요.");
                    messageDiv.css("color", "red");
                }
            },
            error: function(error){ alert(error); }
        });
    });
});

<!-- 이메일 중복확인 -->
$(function(){
    $("#ctEmailCheck").click(function(){
        let ownerEmail = $("#ownerEmail").val();  //아이디
        $.ajax({
            type: 'post', 
            url: "ctEmailCheck.do", 
            data: {"ownerEmail": ownerEmail}, 
            success: function(data){ 
                let messageDiv = $("#ctEmailCheckMessage");
                if(data < 1){ 
                    // 사용 가능한 아이디인 경우 메시지 표시
                    messageDiv.html("사용 가능한 이메일입니다.");
                    messageDiv.css("color", "green"); 
                } else { 
                    // 중복된 아이디인 경우 메시지 표시
                    messageDiv.html("중복된 이메일입니다. 다른 이메일을 입력해주세요.");
                    messageDiv.css("color", "red");
                }
            },
            error: function(error){ alert(error); }
        });
    });
});

<!-- 주소 -->
function address() {
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('ctAddress1').value = data.zonecode;
            document.getElementById("ctAddress2").value = roadAddr;
        }
    }).open();
}

</script>
</html>