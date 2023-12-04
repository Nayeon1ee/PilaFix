<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="center_header_common.jsp" %>
 
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>이용정책 관리</h1>
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
              <h5 class="card-title">중제목 작성</h5>
              <p>간략한 설명</p>

				<div class="terms-btn my-3 me-2">
				<span class="terms-reg-btn">
					<button type="button" class="btn btn-primary" onclick="location.href='insertUserguide.do'">이용정책 등록</button>
				</span>
				<span class="excel-down-btn">
				</span>
				</div>
<!-- 게시판 시작 -->
              <!-- Table with stripped rows -->
              <table class="table datatable">
                <thead>
                  <tr>
                    <th scope="col">정책 번호</th>
                    <th scope="col">구분</th>
                    <th scope="col">이용정책명</th>
                    <th scope="col">작성일자</th>
                    <%--<th scope="col">공개여부</th> --%>
                  </tr>
                </thead>
                <tbody>
               	 <c:if test="${empty userguideList}">
					<tr>
						<td colspan="5">등록된 글이 없습니다.</td>
					</tr>
				 </c:if>
				 <c:forEach var="list" items="${userguideList }">
					<tr>
						<td>${list.ugCode }</td>
						<td>${list.ugType }</td>
						<td><a href="getUserguide.do?ugCode=${list.ugCode }">${list.ugName }</a></td>
						<td>${list.ugRegistrationDate }</td>
						<%--
						<c:choose>
							<c:when test="${list.ugOpenYN }">
								<td>공개</td>
							</c:when>
							<c:otherwise>
								<td>비공개</td>
							</c:otherwise>
						</c:choose>
						 --%>
					</tr>
				 </c:forEach> 
                </tbody>
              </table>         
	
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
                    <div class="modal-body">
                      확인 버튼을 누르시면 다시 복구시킬 수 없습니다.
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                      <button type="button" class="btn btn-primary" onclick="deleteUserguide(${list.ugCode })">확인</button>
                    </div>
                  </div>
                </div>
              </div>
 <!-- 모달의 확인 누르면 삭제 진행-->
 
 <script>
function deleteUserguide(ugCode){
		fetch('/pilafix/deleteUserguide.do?ugCode=' + ugCode, {
			method: 'GET'
		})
			.then(response => {
				if (!response.ok) {
					throw new Error('error');
				}
				window.location.href = 'getUserguideList.do'; // 에러나면 목록 페이지로 리다이렉트
			})
			.catch(error => {
				console.error(error);
			});
	
};
</script>

<%@ include file="center_footer_common.jsp" %>