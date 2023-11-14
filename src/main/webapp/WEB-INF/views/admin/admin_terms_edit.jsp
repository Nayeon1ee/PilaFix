<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="admin_header_common.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>이용약관 수정</h1>
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
              <!-- <h5 class="card-title">중제목 작성</h5>  -->
              <p>간략한 설명</p>


             	  <!-- Multi Columns Form -->
              <form class="row g-3" action="updateTerms.do" method="post">
              <div class="col-md-2">
                  <label class="form-label">약관 번호</label>

                  <input type="hidden" name="tmCode" value="${terms.tmCode}">
				  <input type="text" id="tmCode" name="tmCode" disabled class="form-control" value="${terms.tmCode}">
                </div>
                <div class="col-md-5">
                  <label class="form-label">등록일자</label>
                  <input type="text" id="tmRegdate" name="tmRegdate"  disabled class="form-control" value="${terms.tmRegdate}">
                </div>
                <div class="col-md-5">
                  <label class="form-label">최근 수정일</label>
                  <input type="text" id="tmModifiedDate" name="tmModifiedDate"  disabled class="form-control" value="${terms.tmModifiedDate}" >
                </div>
               <div class="col-md-12">
                  <label class="form-label">약관명</label>
                  <input type="text" id="tmName" name="tmName" class="form-control" value="${terms.tmName}">
                </div>
                <div class="col-md-12">
                <label class="form-label">약관 상세</label>
                 <textarea id="tmDetail" name="tmDetail"  class="form-control" style="height: 300px;">${terms.tmDetail}</textarea>
                </div>

 
<label class="form-label">필수여부</label>    
<fieldset class="row mb-3">
    <div class="col-sm-10">
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="tmRequiredYn" id="tmRequiredYes" value="true"
                ${terms.tmRequiredYn ? 'checked' : ''}>
            <label class="form-check-label" for="tmRequiredYes">필수</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="tmRequiredYn" id="tmRequiredNo" value="false"
                ${!terms.tmRequiredYn ? 'checked' : ''}>
            <label class="form-check-label" for="tmRequiredNo">선택</label>
        </div>
    </div>  
</fieldset>

<label class="form-label">공개여부</label>
<fieldset class="row mb-3">
    <div class="col-sm-10">
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="tmOpenYn" id="tmOpenYes" value="true"
                ${terms.tmOpenYn ? 'checked' : ''}>
            <label class="form-check-label" for="tmOpenYes">공개</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="tmOpenYn" id="tmOpenNo" value="false"
                ${!terms.tmOpenYn ? 'checked' : ''}>
            <label class="form-check-label" for="tmOpenNo">비공개</label>
        </div>
    </div>  
</fieldset>


                <div class="text-center ">
                  <button type="submit" class="btn btn-primary" >수정</button>
                  <button type="reset" class="btn btn-secondary" onclick="location.href='getTermsList.do'">취소</button>
                </div>
              </form><!-- End Multi Columns Form -->

            </div>
          </div>

        </div>
      </div>
    </section>
    

  </main><!-- End #main -->
 
 
<%@ include file="admin_footer_common.jsp"%>