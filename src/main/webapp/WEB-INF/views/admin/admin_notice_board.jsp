<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
              <h5 class="card-title">공지사항 리스트</h5>
              <p>웹관리자가 작성하는 공지사항 리스트입니다. </p>


             	<!-- 
             	 
             	 이 영역에 가져온 컴포넌트 넣기 
             	 PilaAdmin의 demo 보면서 마우스 우클릭하여 소스 보기 해서 가져올 컴포넌트 위치 잘 설정하여 넣기  
             	 
             	 -->
             	 
             	 
 <!-- 검색필터 시작 -->
             <div class="search-filter">
      <div class="search-filter-inner" >
    
     <div class="serch-filter-content">
      <div class="search-top">
              <div class="col-md-3">
                  <label for="inputState" class="form-label">검색</label>
                  <select id="inputState" class="form-select">
                    <option selected disabled>전체</option>
                    <option>글 제목</option>
                    <option>글 작성자</option>
                    <option></option>
                  </select>
                </div>
           <div class="serch-input">
             <div class="col-md-6">
                  <input type="text" class="form-control" id="inputCity" placeholder="검색어를 입력해주세요">
                </div>
                <div class="search-btn">
                <button type="submit" class="btn btn-primary search">검색</button>
                <button type="reset" class="btn btn-primary search" id="resetButton">초기화</button>
           </div>
            </div>
            </div>
             
             <div class="search-date">
                <div class="date-filter">
                 <label for="inputState" class="form-label">기간검색</label>
                <div class="col-sm-12">
                    <input type="date" class="form-control-date" id="startDate">
                  <span>~</span>
                    <input type="date" class="form-control-date" id="endDate">
                  </div>
                  </div>
                  </div>
                  
                </div>
             </div>
             </div>
<!-- 검색필터 끝 -->



              <!-- Table with stripped rows -->
              
              <div class="ad_noti_add_btn0 ad_noti_btn_000">
              <button type="button" class="btn btn-primary" onclick="insertAdminInfo()">
              <i class="bi"></i> 
              + 공지사항 등록 </button>
              </div>
              
              <table class="table datatable">
              
                <thead>
                  <tr>
                    <th scope="col">NO.</th>
                    <th scope="col">글제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성일자</th>
                    <th scope="col">공개</th>
                  </tr>
                </thead>
                
                <tbody>
                  <c:if test="${InfoList == null }">
				<tr>
					<td colspan="5">등록된 글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="adminInfo" items="${InfoList }">
				<tr>
					<td>${adminInfo.seq }</td>
					<td><a href="getAdminInfo.do?seq=${adminInfo.seq }">${adminInfo.title }</a></td>
					<td>${adminInfo.writerMemberName }</td>
					<td>${adminInfo.regDate }</td>
					<td>${adminInfo.openYN }</td>
					<td><a href="updateAdminInfo.do?seq=${adminInfo.seq }">수정</a> | <a href="deleteAdminInfo.do?seq=${adminInfo.seq }">삭제</a></td>
				</tr>
			</c:forEach>                                     
                </tbody>
              </table>
              <!-- End Table with stripped rows -->             	 
             	 
             <!-- 페이징 처리 시작 -->
              <div class="admin-screen-paging">
                <ul class="pagination">
                  <li class="page-item"><a class="page-link" href="#">이전</a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">4</a></li>
                  <li class="page-item"><a class="page-link" href="#">5</a></li>
                  <li class="page-item"><a class="page-link" href="#">다음</a></li>
                </ul>
             </div>
      <!-- 페이징 처리 끝 -->	 

            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->
  <script src="admin_notice_board.js"></script>

  <%@ include file="admin_footer_common.jsp" %>