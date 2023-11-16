<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_header_common.jsp" %>
  <main id="main" class="main">
    <div class="pagetitle">
      <h1>FAQ 등록</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">FAQ 등록</li><!-- 기존에는 현재 위치 표시였음 Depth1>Depth2>Depth3 표시 -->
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">FAQ 등록</h5>
              <!-- <p>간략한 설명</p> -->
             	 <!-- Multi Columns Form -->
              <form class="row g-3" action="insertFaqInfo.do" method="post">
                <div class="col-md-12">
                  <label for="inputState" class="form-label">구분</label>
                  <select id="selectbox" class="form-select" name="fqType">
                    <option value="COMMON">공통</option>
                    <option value="TR">강사</option>
                    <option value="ME">회원</option>
                  </select>
                </div>
               <div class="col-md-12">
                  <label class="form-label">글 제목</label>
                  <input type="text" class="form-control" placeholder="제목을 입력하세요." name="fqTitle">
                </div>
                <div class="col-md-12">
                	<label class="form-label">글 내용</label>
                	 <textarea class="form-control" placeholder="내용을 입력하세요." style="height: 300px;" name="fqContent"></textarea>
                </div>
                <div class="text-center">
                  <button type="submit" class="btn btn-primary">등록</button>
                  <button type="reset" class="btn btn-secondary" onclick="location.href='getFaqInfoList.do'">취소</button>
                </div>
              </form>
              <!-- End Multi Columns Form -->


            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <%@ include file="admin_footer_common.jsp" %>

</body>

</html>