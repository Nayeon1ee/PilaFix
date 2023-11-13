<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="center_header_common.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>이용정책 등록</h1>
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
              <!-- <p>간략한 설명</p> -->


             	<!-- Multi Columns Form -->
              <form class="row g-3" action="insertUserguide.do" method="post">
              		<label class="form-label">유형</label>
              		<fieldset class="row mb-3">
	                  <div class="col-sm-10">
	                    <div class="form-check form-check-inline">
	                      <input class="form-check-input" type="radio" name="ugType" id="gridRadios1" value="예약" checked>
	                      <label class="form-check-label" for="gridRadios1">
	                        예약
	                      </label>
	                    </div>
	                    <div class="form-check form-check-inline">
	                      <input class="form-check-input" type="radio" name="ugType" id="gridRadios2" value="수강권">
	                      <label class="form-check-label" for="gridRadios2">
	                        수강권
	                      </label>
	                    </div>
	                  </div>
	                </fieldset>
              		
	               <div class="col-md-12">
	                  <label class="form-label">이용정책 제목</label>
	                  <input type="text" class="form-control" placeholder="이용정책 제목을 입력하세요." name="ugName">
	                </div>
	                
	                <div class="col-md-12">
	                	<label class="form-label">이용정책 내용</label>
	                	 <textarea class="form-control" placeholder="이용정책 상세내용을 입력하세요." style="height: 300px;" name="ugContent"></textarea>
	                </div>
	              
	              <label class="form-label">공개여부</label>
	               <fieldset class="row mb-3">
	                  <div class="col-sm-10">
	                    <div class="form-check form-check-inline">
	                      <input class="form-check-input" type="radio" name="ugOpenYN" id="gridRadios1" value=true checked>
	                      <label class="form-check-label" for="gridRadios1">
	                        공개
	                      </label>
	                    </div>
	                    <div class="form-check form-check-inline">
	                      <input class="form-check-input" type="radio" name="ugOpenYN" id="gridRadios2" value=false>
	                      <label class="form-check-label" for="gridRadios2">
	                        비공개
	                      </label>
	                    </div>
	                  </div>
	                </fieldset>
	                    
	             
	                <div class="text-center">
	                  <button type="submit" class="btn btn-primary">등록</button>
	                  <button type="reset" class="btn btn-secondary">취소</button>
	                </div>
              </form>
              <!-- End Multi Columns Form -->


            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->

<%@ include file="center_footer_common.jsp" %>