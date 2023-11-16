<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="admin_header_common.jsp" %>

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
				<div class="area1">
					<p>센터 프로필</p>
				</div>
				<div class="col-4000">
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
							<c:when	test="${center.contractExpiryYn eq false and center.contractRevokeYn eq false}">
								<input type="text" readonly disabled class="form-control" value="계약">
							</c:when>
							<c:when test="${center.contractExpiryYn eq true and center.contractRevokeYn eq false}">
								<input type="text" readonly disabled class="form-control" value="만료">
							</c:when>
							<c:when	test="${center.contractExpiryYn eq false and center.contractRevokeYn eq true}">
								<input type="text" readonly disabled class="form-control" value="해지">
							</c:when>
						</c:choose>
					</div>
					<div class="col-40000" style="margin-top: 1%;">
						<label class="form-label">만료여부</label>
						<!-- 만료여부 처리 -->
							<c:choose>
								<c:when test="${center.contractExpiryYn }">
									<input type="text" readonly disabled class="form-control" value="Y">					
								</c:when>
								<c:otherwise>
									<input type="text" readonly disabled class="form-control" value="N">
								</c:otherwise>
							</c:choose>
					</div>
					<div class="area2">
						<p>대표자 정보</p>
					</div>
					<div class="col-4000">
						<label class="form-label">대표자 이름</label> 
						<input type="text" readonly disabled class="form-control" value=${center.ownerName }>
					</div>
					<div class="col-4000" style="margin-top: 1%;">
						<label class="form-label">대표자 이메일</label>
						<input type="text" readonly disabled class="form-control" value=${center.ownerEmail }>
					</div>
					<div class="col-4000">
						<label class="form-label">대표자 번호</label> 
						<input type="text" readonly disabled class="form-control" value="${center.ownerPhoneNumber1 }${center.ownerPhoneNumber2 }${center.ownerPhoneNumber3 }">
					</div>
					<div class="col-4000" style="margin-top: 1%;">
						<label class="form-label">사업자 등록번호</label>
						<input type="text" readonly disabled class="form-control" value=${center.businessRegistrationNumber}>
					</div>
               </div>
               <div class="selectson">
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#basicModal2" >계약해지</button>
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#basicModal3" >비밀번호 초기화</button>
			   </div>
               <div class="text-center">
					<div class="col-sm-1000">
						<button type="submit" class="btn btn-primary" onclick="location.href='getCenterList.do'">목록</button>
						<button type="submit" class="btn btn-primary" onclick="location.href='updateCenter.do?ctCode=${center.ctCode}'">수정</button>
						<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#basicModal">삭제</button>
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

<%@ include file="admin_footer_common.jsp"%>