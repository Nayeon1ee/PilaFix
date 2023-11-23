<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="admin_header_common.jsp" %>
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>관리자 등록화면</h1>
			<nav>
				<ol class="breadcrumb">
					<!-- <li class="breadcrumb-item">필요 시 작성</li> -->
					<!-- 기존에는 현재 위치 표시였음 Depth1>Depth2>Depth3 표시 -->
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">관리자의 등록정보 페이지</h5>
							<!-- <p>센터의 상세정보를 조회하고 비밀번호 변경이 가능한 페이지</p> -->
							<!-- 
             	 이 영역에 가져온 컴포넌트 넣기 
             	 PilaAdmin의 demo 보면서 마우스 우클릭하여 소스 보기 해서 가져올 컴포넌트 위치 잘 설정하여 넣기  
             	 -->
							<p style="magin-top: 1%;"></p>
							<!--  
							<div class="row mb-300" style="width: 122%; margin-top: 1%;">
								<div class="col-sm-10">
									<input type="text" class="form-control" value="센터등록" disabled>
								</div>
							</div>
							-->
							<form name="admin_info" action="insertAdminRegister.do" method="post">
								<div class="col-md-12">
										<label for="inputAddress5" class="form-label">아이디</label>
										<div class="input-group">
											<input type="text" class="form-control" id="adId" name="adId" placeholder="아이디를 입력하세요">
											<button type="button" class="btn btn-primary" id="adIdCheck">중복확인</button>
										</div>
										<div id="adIdCheckMessage"></div>
									</div>
								<div class="col-md-12">
										<label for="inputAddress5" class="form-label">비밀번호</label>
										<div class="input-group">
											<input type="password" class="form-control" id="adPassword" name="adPassword" placeholder="비밀번호를 입력하세요">
											<!-- <button type="button" class="btn btn-primary" id="adPasswordCheck">중복확인</button> -->
										</div>
										<div id="adPasswordCheckMessage"></div>
									</div>
								<div class="col-40">
									<label for="inputAddress5" class="form-label">관리자명</label> <input
										type="text" class="form-control" id="inputAddres5s" 
										placeholder="관리자명" name="adName" >
								</div>
								<%-- <div class="col-40" style="margin-top: 1%;">
									<label for="inputAddress2" class="form-label">사업자 등록번호</label>
									<input type="text" class="form-control" id="inputAddress2" value="${centerInfo.businessRegistrationNumber }"
										placeholder="Apartment, studio, or floor" disabled>
								</div> --%>
								<%-- <div class="col-40">
									<label for="inputAddress5" class="form-label">대표자 이메일</label> <input
										type="text" class="form-control" id="inputAddres5s" value="${centerInfo.ownerEmail }"
										placeholder="이메일을 입력하세요" disabled>
									<div class="col-sm-10">
										<button type="submit" class="btn btn-primary">중복확인</button>
									</div>
								</div> --%>
								<div class="col-40">
									<label for="inputAddress5" class="form-label">관리자번호</label>
									
									<div class="col-400" style="display: flex;" >
										
										<select class="project_title" name="adContact1" id="project_title" >
											<option selected >전화번호</option>
											<option value="010" >010</option>
											<option value="011">011</option>
										</select> <input type="text" class="form-control" id="inputAddres5s" name="adContact2"> 
										<input type="text" class="form-control" 
											id="inputAddres5s" name="adContact3">
									</div>
								</div>
								<div class="text-center">
				                  <button type="submit" class="btn btn-primary">등록</button>
				                   <%-- <button type="submit" class="btn btn-primary" onclick="location.href='updateAdmin.do?adCode=${amdin.adCode}'">수정</button> --%>
				                  <button type="reset" class="btn btn-secondary" onclick="goBack()">취소</button>
				                </div>
							</form>
							<!-- End General Form Elements -->
									</div>
								</div>
							</div>
							<!-- End Basic Modal-->
						</div>
					</div>
				</div>
		</section>

	</main>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		var select_project_title=project_title.options[project_title.selectedIndex].value;
	    function goBack() {
	        window.history.back();
	    }
	    <!--  아이디 중복확인  -->
$(function(){
    $("#adIdCheck").click(function(){
        let adId = $("#adId").val();  //아이디
        $.ajax({
            type: 'post', 
            url: "adIdCheck.do", 
            data: {"adId": adId}, 
            success: function(data){ 
                let messageDiv = $("#adIdCheckMessage");
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
</script>
	</script>
	<!-- End #main -->
<%@ include file="admin_footer_common.jsp" %>
	