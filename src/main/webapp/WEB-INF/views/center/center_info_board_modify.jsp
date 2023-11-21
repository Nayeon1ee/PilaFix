<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="center_header_common.jsp" %>
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
								<div class="col-md-12">
									<label class="form-label">제목</label>
									<input type="text" class="form-control" id="titleInput000" name="title" value="${centerInfo.title }" />
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
					                      <input class="form-check-input" type="radio" name="openYN" id="gridRadios1" value=true checked>
					                      <label class="form-check-label" for="gridRadios1">
					                        공개
					                      </label>
					                    </div>
					                    <div class="form-check form-check-inline">
					                      <input class="form-check-input" type="radio" name="openYN" id="gridRadios2" value=false>
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
					                      <input class="form-check-input" type="radio" name="openYN" id="gridRadios2" value=false checked>
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
								<button type="submit" class="btn btn-secondary btn_registration_000" id="registrationButton000">완료</button>
						        <button type="button" class="btn btn-primary" onclick="location.href='getCenterInfoList.do'">취소</button>
						    </div>
						</form><!-- End Multi Columns Form -->
					</div>
				</div>
			</div>
		</div>
	</section>
</main><!-- End #main -->

<%@ include file="center_footer_common.jsp" %>