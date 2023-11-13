<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="admin_header_common.jsp" %>
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
              <h5 class="card-title">공지사항 등록페이지</h5>
              <p>웹관리자가 공지사항을 등록할 수 있는 페이지입니다.</p>


             	<!-- 
             	 
             	 이 영역에 가져온 컴포넌트 넣기 
             	 PilaAdmin의 demo 보면서 마우스 우클릭하여 소스 보기 해서 가져올 컴포넌트 위치 잘 설정하여 넣기  
             	 
             	 -->

				<!-- Multi Columns Form -->
				<form class="row g-3" id="registrationForm000" action="insertAdminInfo.do" method="post">
				    <div class="col-md-5">
				        <input type="hidden" class="form-control" value="">
				    </div>
				    <div class="col-md-5">
				        <input type="hidden" class="form-control" value="${regDate}">
				    </div>
				    <div class="col-md-12">
				        <label class="form-label">제목</label>
				        <input type="text" class="form-control" name="title" id="titleInput000" value="" />
				    </div>
				    <div class="col-md-12">
				        <label class="form-label">내용</label>
				        <textarea class="form-control" name="content" id="contentInput000" style="height: 300px"></textarea>
				    </div>
				    
				<div class="col-sm-10">
				  <div class="form-check form-check-inline radiobtn000">
				    <input class="form-check-input" type="radio" name="gridRadios openYN" id="gridRadios1" value=true checked>
				    <label class="form-check-label" for="gridRadios1">
				      공개
				    </label>
				  </div>
				  <div class="form-check form-check-inline radiobtn001">
				    <input class="form-check-input" type="radio" name="gridRadios openYN" id="gridRadios2" value=false>
				    <label class="form-check-label" for="gridRadios2">
				      비공개
				    </label>
				  </div>
				</div>
				    
				    
				    
				    <div class="text-center">
				        <button type="submit" class="btn btn-primary">등록</button>
				        <button type="button" class="btn btn-primary" onclick="location.href='getAdminInfoList.do'" >취소</a></button>
				    </div>
				</form><!-- End Multi Columns Form -->
				             	

            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->
  <script src="admin_notice_board_register.js"></script>
 <%@ include file="admin_footer_common.jsp" %>