<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_header_common.jsp"%>
 
  <main id="main" class="main">
    <div class="pagetitle">
      <h1>이메일발송이력관리</h1>
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
              <h5 class="card-title">이메일 발송이력 상세</h5>
              <p>웹관리자가 보내는 이메일 발송이력 상세페이지입니다.
               (대표자 계정생성, 약관 변경시, 회원가입시 이메일인증, 비밀번호찾을때)</p>
             	<!-- 
             	 이 영역에 가져온 컴포넌트 넣기 
             	 PilaAdmin의 demo 보면서 마우스 우클릭하여 소스 보기 해서 가져올 컴포넌트 위치 잘 설정하여 넣기  
             	 -->
            <!-- Multi Columns Form -->
              <form class="row g-3">
              	<div class="col-md-5">
                  <label class="form-label">수신인</label>
                  <input type="text" readonly class="form-control" value="${sendEmailHistoryInfo.mhRecipientName }" disabled>
                </div>
                <div class="col-md-5">
                  <label class="form-label">수신메일</label>
                  <input type="text" readonly class="form-control" value="${sendEmailHistoryInfo.mhRecipientEmail }" disabled>
                </div>
                <div class="col-md-5">
                  <label class="form-label">구분</label>
                  <input type="text" readonly class="form-control" value="${sendEmailHistoryInfo.mhEmailSendType }" disabled>
                </div>
                <div class="col-md-5">
                  <label class="form-label">발송일</label>
                  <input type="text" readonly class="form-control"  value="${sendEmailHistoryInfo.mhEmailSendDatetime }" disabled>
                </div>
		
                <div class="col-md-12">
                	<label class="form-label">발송 내용</label>
                	 <textarea readonly class="form-control" style="height: 300px;" disabled>${sendEmailHistoryInfo.mhRecipientContent }</textarea>
                </div>
               <!--  <div class="text-center">
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
