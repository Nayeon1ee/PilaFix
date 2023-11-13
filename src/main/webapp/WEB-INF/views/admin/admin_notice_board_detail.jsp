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
              <h5 class="card-title">공지사항 상세페이지</h5>
              <p>웹관리자가 공지사항의 상세내용을 볼 수 있습니다. 수정/취소/삭제</p>


             	<!-- 
             	 
             	 이 영역에 가져온 컴포넌트 넣기 
             	 PilaAdmin의 demo 보면서 마우스 우클릭하여 소스 보기 해서 가져올 컴포넌트 위치 잘 설정하여 넣기  
             	 
             	 -->

				<!-- Multi Columns Form -->
				<form class="row g-3" id="registrationForm000">
					 <input type="hidden" class="form-control" value="${adminInfo.seq }" disabled>
				    <div class="col-md-5">
				        <label class="form-label">작성자</label>
				        <input type="text" class="form-control" value="${adminInfo.writerMemberName }" disabled>
				    </div>
				    <div class="col-md-5">
				        <label class="form-label">작성일자</label>
				        <input type="text" class="form-control" value="${adminInfo.regDate }" disabled >
				    </div>
				    <div class="col-md-12">
				        <label class="form-label">제목</label>
				        <input type="text" class="form-control" id="titleInput000" value="${adminInfo.title }" disabled>
				    </div>
				    <div class="col-md-12">
				        <label class="form-label">내용</label>
				        <textarea class="form-control" id="contentInput000" style="height: 300px" disabled>${adminInfo.content }</textarea>
				    </div>
				    
				<div class="col-sm-10">
				  <div class="form-check form-check-inline radiobtn000">
				    <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
				    <label class="form-check-label" for="gridRadios1">
				      공개
				    </label>
				  </div>
				  <div class="form-check form-check-inline radiobtn001">
				    <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
				    <label class="form-check-label" for="gridRadios2">
				      비공개
				    </label>
				  </div>
				</div>
				    
				    
				    
				    <div class="text-center">
				        <button class="btn btn-secondary btn_registration_000" id="registrationButton000" onclick="updateAdminInfo()">수정</button>
				       <button class="btn btn-secondary" onclick="getAdminInfoList()">목록</button>
				        <button class="btn btn-secondary" onclick="deleteAdminInfo()">삭제</button>
				    </div>
				</form><!-- End Multi Columns Form -->

            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->


<%@ include file="admin_footer_common.jsp" %>