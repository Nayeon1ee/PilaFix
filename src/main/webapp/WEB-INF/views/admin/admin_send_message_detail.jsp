<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="admin_header_common.jsp" %>
 
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>문자발송이력관리</h1>
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
              <h5 class="card-title">전체 센터의 문자 발송이력 상세</h5>
              <p>전체 센터의 문자 발송이력 상세 페이지입니다.</p>

             	 
            <!-- Multi Columns Form -->
              <form class="row g-3">
              	<div class="col-md-4">
                  <label class="form-label">수신인</label>
                  <input type="text" readonly class="form-control" value="${sendSmsHistoryInfo.shRecipientName }" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">수신자 번호</label>
                  <input type="text" readonly class="form-control" value="${sendSmsHistoryInfo.shRecipientPhone }" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">발송일자</label>
                  <input type="text" readonly class="form-control" value="${sendSmsHistoryInfo.shSendDatetime }" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">발송코드</label>
                  <input type="text" readonly class="form-control" value="${sendSmsHistoryInfo.shSendCode }" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">상태</label>
                  <c:if test="${sendSmsHistoryInfo.shSuccessYn == true}">
                  	<input type="text" readonly class="form-control" value="성공" disabled>
                  </c:if>
                  <c:if test="${sendSmsHistoryInfo.shSuccessYn == false}">
					<input type="text" readonly class="form-control" value="실패" disabled>
				</c:if>
                </div>
                <div class="col-md-4">
                  <label class="form-label">비고</label>
                  <input type="text" readonly class="form-control" value="${sendSmsHistoryInfo.shFailReason }" disabled>
                </div>
                <div class="col-md-12">
                	<label class="form-label">발송 내용</label>
                	 <textarea readonly class="form-control" style="height: 300px;" disabled >${sendSmsHistoryInfo.shRecipientContent }</textarea>
                </div>
                <!-- <div class="text-center">
                  <button class="btn btn-secondary">목록</button>
                </div> -->
              </form><!-- End Multi Columns Form -->
            </div>
          </div>
        </div>
      </div>
    </section>

  </main><!-- End #main -->
 
<%@ include file="admin_footer_common.jsp" %>
