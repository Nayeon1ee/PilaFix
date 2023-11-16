<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="admin_header_common.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>FAQ 관리</h1>
      <nav>
        <ol class="breadcrumb">
          <!-- <li class="breadcrumb-item">FAQ 목록관리</li>기존에는 현재 위치 표시였음 Depth1>Depth2>Depth3 표시 -->
        </ol>
      </nav>
    </div><!-- End Page Title -->
    <section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">FAQ 목록</h5>
							<p>FAQ 목록입니다.</p>
							<!-- 검색필터 시작 -->
							<div class="search-filter">
								<div class="search-filter-inner">
									<div class="serch-filter-content">
										<div class="search-top">
											<div class="col-md-3">
												<label for="inputState" class="form-label">검색</label> 
												<select id="inputState" class="form-select">
												<option selected disabled>전체</option>
												<option value="1">공통</option>
												<option value="2">회원</option>
												<option value="3">강사</option>
											</select>
											</div>
											<div class="serch-input">
												<div class="col-md-6">
													<input type="text" class="form-control" id="inputCity"
														placeholder="검색어를 입력해주세요">
												</div>
												<div class="search-btn">
													<button type="submit" class="btn btn-primary search">검색</button>
													<button type="reset" class="btn btn-primary search"
														id="resetButton">초기화</button>
												</div>
											</div>
										</div>

										<div class="search-date">
											<div class="date-filter">
												<label for="inputState" class="form-label">기간검색</label>
												<div class="col-sm-12">
													<input type="date" class="form-control-date" id="startDate">
													<span>~</span> <input type="date" class="form-control-date"
														id="endDate">
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
							</div>
							<!-- <div class="search-date">
								<div class="col-md-3">
									<label for="inputState" class="form-label">처리상태</label> 
									<select id="inputState2" class="form-select">
										<option selected disabled>회원상태</option>
										<option>계약회원</option>
										<option>해지회원</option>
										<option>만료회원</option>
									</select>
								</div>
								<div class="date-filter">
									<label for="inputState" class="form-label">기간검색</label>
									<div class="col-sm-12">
										<input type="date" class="form-control-date" id="startDate">
										<span>~</span> <input type="date" class="form-control-date" id="endDate">
									</div>
								</div>
							</div> -->
						</div>
					</div>
				</div>
				</div>
				
				<div class="terms-btn">
				<span class="terms-reg-btn">
					<button type="button" onclick="location.href='insertFaqInfo.do'" class="btn btn-primary">FAQ등록</button>
				</span>
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
                    <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${faqInfo.fqRegDate}"/></td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>   
				<!-- 페이징 처리 시작 -->
             <!--  <div class="admin-screen-paging">
                <ul class="pagination">
                  <li class="page-item"><a class="page-link" href="#">이전</a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">4</a></li>
                  <li class="page-item"><a class="page-link" href="#">5</a></li>
                  <li class="page-item"><a class="page-link" href="#">다음</a></li>
                </ul>
             </div> -->
      <!-- 페이징 처리 끝 -->
            </div>
          </div>
        </div>
      </div>
    </section>
  </main><!-- End #main -->
	<script src="${pageContext.request.contextPath }/resources/js/admin_common_1.js"></script>
	<%@ include file="admin_footer_common.jsp" %>