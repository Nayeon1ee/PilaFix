<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="center_header_common.jsp" %>
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>공지사항관리</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">필요 시 작성</li>
					<!-- 기존에는 현재 위치 표시였음 Depth1>Depth2>Depth3 표시 -->
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">공지사항 작성 페이지</h5>
							<p>센터가 공지사항을 작성할 수 있는 페이지입니다.</p>

							<!-- Multi Columns Form -->
							<form class="row g-3" id="registrationForm000" action="insertCenterInfo.do" method="post">
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
									<textarea class="form-control" name="content" id="contentInput000"  style="height: 300px"></textarea>
								</div>

								<label class="form-label">공개여부</label>
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

								<div class="text d-flex justify-content-end">
							        <button type="submit" class="btn btn-primary me-2">등록</button>
							        <button type="reset" class="btn btn-secondary me-3" onclick="location.href='getCenterInfoList.do'">취소</button>
							    </div>
							</form>
							<!-- End Multi Columns Form -->
						</div>
					</div>
				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->
<%@ include file="center_footer_common.jsp" %>