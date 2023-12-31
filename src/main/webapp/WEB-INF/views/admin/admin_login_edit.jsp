<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="admin_header_common.jsp" %>
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>관리자 수정화면</h1>
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
							<h5 class="card-title">관리자의 수정 페이지</h5>
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
							<form name="admin_info" action="insertAdminLoginInfo.do" method="POST">
								<div class="col-120">
									<label for="inputAddress5" class="form-label">아이디</label>
								</div>
								<div class="col-120">
									<input type="text" class="form-control" id="inputAddres5s" value="${admin.adId }" 
										 style="width: 93%;" >
									<div class="row mb-3"></div>
								</div>
								<div class="col-40">
									<label for="inputAddress5" class="form-label">관리자명</label> <input
										type="text" class="form-control" id="inputAddres5s" value="${admin.adName }" 
										placeholder="관리자명" >
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
									<label for="inputAddress5" class="form-label">관리자 번호</label>
									<div class="col-400" style="display: flex;" >
										<select class="project_title" name="type" id="project_title" >
											<option selected >${admin.adContact1 }</option>
											<option value="010">010</option>
											<option value="011">011</option>
										</select> <input type="text" class="form-control" id="inputAddres5s" value="${admin.adContact2 }"> <input type="text" class="form-control" value="${admin.adContact3 }"
											id="inputAddres5s">
										<!-- <div class="col-sm-10">
										<button type="submit" class="btn btn-primary">중복확인</button>
									</div> -->
									</div>
								</div>
								<%-- <div class="col-30" style="margin-top: 1%;">
									<label for="inputAddress2" class="form-label">센터명</label> <input
										type="text" class="form-control" id="inputAddress2" value="${centerInfo.ctName }"
										placeholder="센터명" disabled>
								</div> --%>
								<%-- <div class="col-40" >
									<label for="inputAddress5" class="form-label">센터 번호</label>
									<div class="col-400" style="display: flex;" >
										<select disabled >
											<option selected >${centerInfo.ctPhoneNumber1 }</option>
											<option>010</option>
											<option>011</option>
										</select> <input type="text" class="form-control" id="inputAddres5s" value="${centerInfo.ctPhoneNumber2 }"
											disabled> <input type="text" class="form-control" value="${centerInfo.ctPhoneNumber3 }"
											id="inputAddres5s" disabled>
										<!-- <div class="col-sm-10">
										<button type="submit" class="btn btn-primary">중복확인</button>
									</div> -->
									</div>
								</div>

								<div class="col-6">
									<label for="inputAddress5" class="form-label">센터주소</label>
								</div>
								<div class="col-120">
									<input type="text" class="form-control" id="inputAddres5s"
										placeholder="우편번호" style="width: 42%;" disabled value="${centerInfo.ctAddress1 }">

									<div class="row mb-3"></div>
								</div>
								<div class="col-12">
									<label for="inputAddress5" class="form-label">상세주소 1</label> <input
										type="text" class="form-control" id="inputAddres5s" value="${centerInfo.ctAddress2 }"
										placeholder="1234 Main St" disabled>
								</div>
								<div class="col-12" style="margin-top: 1%;">
									<label for="inputAddress2" class="form-label">상세주소 2</label> <input
										type="text" class="form-control" id="inputAddress2" value="${centerInfo.ctAddress3 }"
										placeholder="Apartment, studio, or floor" disabled>
								</div> --%>
								<div class="text-center">
				                  <button type="submit" class="btn btn-primary">등록</button>
				                  <button type="reset" class="btn btn-secondary" onclick="goBack()">취소</button>
				                </div>
							</form>
							<!-- End General Form Elements -->

							<!-- <h5 class="card-title">비밀번호 변경</h5>
							<p>비밀번호 변경을 원하면 아래 버튼을 클릭하세요.</p>
							Basic Modal
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#basicModal">
								비밀번호 변경</button> -->
							<div class="modal fade" id="basicModal" tabindex="-1">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">비밀번호변경</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<div class="tab-content pt-2">
												<div class="tab-pane fade pt-3 active show"
													id="profile-change-password" role="tabpanel">
													<!-- Change Password Form -->
													<form>
														<div class="row mb-3">
															<label for="currentPassword"
																class="col-md-4 col-lg-3 col-form-label">현재 비밀번호</label>
															<div class="col-md-8 col-lg-9">
																<input name="password" type="password"
																	class="form-control" id="currentPassword">
															</div>
														</div>

														<div class="row mb-3">
															<label for="newPassword"
																class="col-md-4 col-lg-3 col-form-label">새 비밀번호</label>
															<div class="col-md-8 col-lg-9">
																<input name="newpassword" type="password"
																	class="form-control" id="newPassword">
															</div>
														</div>

														<div class="row mb-3">
															<label for="renewPassword"
																class="col-md-4 col-lg-3 col-form-label">새 비밀번호
																확인</label>
															<div class="col-md-8 col-lg-9">
																<input name="renewpassword" type="password"
																	class="form-control" id="renewPassword">
															</div>
														</div>

														<div class="text-center">
															<button type="submit" class="btn btn-primary">비밀번호변경</button>
														</div>
													</form>
													<!-- End Change Password Form -->
												</div>
											</div>
											<!-- End Bordered Tabs -->
										</div>
										<!--  <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-primary">Save changes</button>
                    </div> -->
									</div>
								</div>
							</div>
							<!-- End Basic Modal-->
						</div>
					</div>
				</div>
		</section>

	</main>
	<script type="text/javascript">
	var select_project_title=project_title.options[project_title.selectedIndex].value;
	</script>
	<script>
	    function goBack() {
	        window.history.back();
	    }
	</script>
	<!-- End #main -->
<%@ include file="admin_footer_common.jsp" %>
	