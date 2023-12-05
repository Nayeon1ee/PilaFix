<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="center_header_common.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style_center_bt_common.css">
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>공지사항관리</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">필요 시 작성</li><!-- 기존에는 현재 위치 표시였음 Depth1>Depth2>Depth3 표시 -->
				</ol>
			</nav>
		</div><!-- End Page Title -->
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">공지사항 수정 페이지</h5>
							<p>센터가 공지사항을 수정할 수 있는 페이지입니다.</p>

							<!-- Multi Columns Form -->
							<form class="row g-3" id="registrationForm000" action="updateCenterInfo.do" method="post">
							<input type="hidden" name="icNumber" value="${centerInfo.icNumber}">
							<input type="hidden" name="writerMemberCode" value="${centerInfo.writerMemberCode}">
							<input type="hidden" name="originalOpenYn" id="originalRadioState" value="${originalRadioState}">
								<div class="col-md-12">
									<label class="form-label">제목</label>
									<input type="text" class="form-control" id="titleInput000" name="title" value="${centerInfo.title }"/>
								</div>
								<div class="col-md-12">
									<label class="form-label">내용</label>
									<textarea class="form-control" id="contentInput000" name="content" style="height: 300px">${centerInfo.content }</textarea>
								</div>
								<div class="col-md-5">
									<label class="form-label">작성일자</label>
									<input type="text" class="form-control" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${centerInfo.regDate }"/>' disabled>
								</div>
								<div class="col-sm-10">
                                <label class="form-label">공개 여부</label>
                                <c:choose>
                                    <c:when test="${centerInfo.openYN}">
                                        <fieldset class="row mb-3">
                                            <div class="col-sm-10">
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="openYN" id="gridRadios1" value=true checked onclick="saveRadioState(true)">
                                                    <label class="form-check-label" for="gridRadios1">
                                                        공개
                                                    </label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="openYN" id="gridRadios2" value=false >
                                                    <label class="form-check-label" for="gridRadios2">
                                                        비공개
                                                    </label>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </c:when>
                                    <c:otherwise>
                                        <fieldset class="row mb-3">
                                            <div class="col-sm-10">
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="openYN" id="gridRadios1" value=true>
                                                    <label class="form-check-label" for="gridRadios1">
                                                        공개
                                                    </label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="openYN" id="gridRadios2" value=false checked onclick="saveRadioState(false)">
                                                    <label class="form-check-label" for="gridRadios2">
                                                        비공개
                                                    </label>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </c:otherwise>
                                </c:choose>
                            </div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary btn_registration_000" >수정</button>
						        <button type="button" class="btn btn-secondary" onclick="location.href='getCenterInfoList.do'">취소</button>
						    </div>
						    

							<div class="modal fade" id="editOpenYn" tabindex="-1">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">공개여부 수정</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="restoreRadioState()"></button>
                                        </div>
                                        <div class="modal-body">
                                            공개글로 수정 시, <b>센터에 연동된 모든 회원</b>에게 알림이 전송됩니다. <br><br>
                                            수정하시겠습니까?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
                                            <!-- 취소 버튼 누르면 라디오버튼을 다시 비공개로 돌려놔야 함 -->
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="restoreRadioState()">취소</button>
                                        </div>
                                    </div>
                                </div>
                            </div>



						</form><!-- End Multi Columns Form -->
					</div>
				</div>
			</div>
		</div>
	</section>
</main><!-- End #main -->

 <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script> 
<script type="text/javascript">
	// 원래 비공개 상태에서 공개로 바꾸면 조회성 알림 띄워주기 알림 가도록
	var originalRadioState; // 초기 라디오 버튼 상태를 저장하는 변수
	
 	// 라디오 버튼 상태 저장 함수
	$(document).ready(function() {
	    originalRadioState = $('input[name="openYN"]:checked').val();
	    console.log(originalRadioState);
	    $('#originalRadioState').val(originalRadioState); // hidden 필드에 값을 설정
	});
	
	// 페이지 로드 시 초기 라디오 상태 저장
	$(document).ready(function() {
	    originalRadioState = $('input[name="openYN"]:checked').val();
	    console.log(originalRadioState)
	});
 	
	// 라디오 버튼 변경 시 확인 모달 띄우기
	$('input[name="openYN"]').on('change', function() {
	    console.log("라디오 버튼 상태 변경됨");
	    var currentRadioState = $(this).val();
	    
	    console.log("모달 함수에서 작동"+originalRadioState);
	    console.log("모달 함수에서 작동"+currentRadioState);

	    // 비공개에서 공개로 변경된 경우에만 모달
	    if (originalRadioState === 'false' && currentRadioState === 'true') {
	                $('#editOpenYn').modal('show');
	    }
	});


    // 모달 닫기 시 라디오 버튼 상태 원래대로 되돌리는 함수
    function restoreRadioState() {
        var radioElement = $("input[name='openYN'][value='" + originalRadioState + "']");
        radioElement.prop('checked', true);
        $('#editOpenYn').modal('hide');
    }

</script>

<%@ include file="center_footer_common.jsp" %>