<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="admin_header_common.jsp" %>
 
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>FAQ 관리</h1>
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
              <p>간략한 설명</p>


             	<div class="container-FAQ">
				<div class="FAQ-reg">
				<button type="button" onclick="location.href='${pageContext.request.contextPath }/FAQ_register.do'" class="btn btn-primary left-align">FAQ등록</button>
				</div>
				<div class="searchfilter-size">
				<select class="form-select right-align" aria-label="Default select example" id="filterSelect">
				  <option selected>전체</option>
				  <option value="1">강사</option>
				  <option value="2">회원</option>
				  <option value="3">공통</option>
				</select>
				<form class="d-flex right-align">
				        <input class="form-control me-2" type="search" placeholder="검색어를 입력해주세요." aria-label="Search">
				        <button class="btn btn-outline-success" type="submit">search</button>
				      </form>
				</div>
				</div>

             	<!-- 게시판 시작 -->
    		<h5 class="card-title"></h5>
              <!-- Table with stripped rows -->
              <table class="table datatable">
                <thead>
                <c:if test="${FaqInfoList == null }">
					<tr>
						<td colspan="5">등록된 글이 없습니다.</td>
					</tr>
				</c:if>
                  <tr>
                    <th scope="col">NO.</th>
                    <th scope="col">구분</th>
                    <th scope="col">제목</th>
                    <th scope="col">등록일</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="faqInfo" items="${FaqInfoList }">
                  <tr>
                    <th scope="row">5</th>
                    <td>${faqInfo.fqNumber }</td>
					<c:if test="${faqInfo.fqType == 'COMMON'}">
						<td>공통</td>
					</c:if>
					<c:if test="${faqInfo.fqType == 'ME'}">
						<td>회원</td>
					</c:if>
					<c:if test="${faqInfo.fqType == 'TR'}">
						<td>강사</td>
					</c:if>
                    <td><a href="getFaqInfo.do?fqNumber=${faqInfo.fqNumber }">${faqInfo.fqTitle }</a></td>
                    <td>${faqInfo.fqRegDate}</td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>   
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

<%@ include file="admin_footer_common.jsp" %>