<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="admin_header_common.jsp"%>

   <main id="main" class="main">

    <div class="pagetitle">
      <h1>센터 관리</h1>
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
              
			  <!-- 검색 -->
				<div class="search-filter">
					<div class="search-filter-inner">
						<div class="serch-filter-content">
							<div class="search-top">
								<div class="col-md-3">
									<label for="inputState" class="form-label">검색</label> 
									<select id="inputState" class="form-select">
										<option selected disabled>전체</option>
										<option>번호</option>
										<option>센터명</option>
										<option>아이디</option>
										<option>대표자명</option>
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
							</div>
						</div>
					</div>
				</div>
			<!-- 검색끝 -->
			
			<div class="terms-btn d-flex jutify-content-between my-3">
				
					<button type="button" class="btn btn-primary ms-3" onclick="location.href='insertCenter.do'">센터 등록</button>
					<button onclick="window.open('<c:url value='/excelDown.do' />')" type="button" class="btn btn-success btn-sm btn-default me-3" id="excelDown">엑셀다운</button>
				
			</div>

			<!-- 게시판 시작 -->
   			 
		    <!-- Table with stripped rows -->
				<table class="table datatable">
					<thead>
						<tr>
							<th scope="col">센터코드</th>
							<th scope="col">센터이름</th>
							<th scope="col">아이디</th> 
							<th scope="col">대표자명</th>
							<th scope="col">센터번호</th>
							<th scope="col">계약일자</th>
							<th scope="col">계약상태</th> 
							<th scope="col">만료여부</th> 
						</tr>
					</thead>
					<tbody>
					<c:if test="${centerList == null }">
						<tr>
							<td colspan="5">등록된 센터가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="center" items="${centerList }">
						<tr>
							<th scope="row">${center.ctCode }</th>
							<td><a href="getCenter.do?ctCode=${center.ctCode }">${center.ctName }</a></td>
							<td>${center.ctId }</td>
							<td>${center.ownerName }</td>
							<td>${center.ctPhoneNumber1 }${center.ctPhoneNumber2 }${center.ctPhoneNumber3 }</td>
							<td>${center.contractStartDate }</td>
							<!-- 계약 상태에 대한 처리 -->
							<!-- 만료여부 Y이면 만료/해지여부 Y이면 해지/둘 다 N값이면 계약  -->
							<c:choose>
								<c:when test="${center.contractExpiryYn eq false and center.contractRevokeYn eq false}">
									<td>계약</td>
								</c:when>
								<c:when test="${center.contractExpiryYn eq true and center.contractRevokeYn eq false}">
									<td>만료</td>
								</c:when>
								<c:when test="${center.contractExpiryYn eq false and center.contractRevokeYn eq true}">
									<td>해지</td>
								</c:when>
							</c:choose>
							<!-- 만료여부 처리 -->
							<c:choose>
								<c:when test="${center.contractExpiryYn}">
									<td>Y</td>						
								</c:when>
								<c:otherwise>
									<td>N</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<!-- End Table with stripped rows -->
				
            </div>
          </div>
        </div>
      </div>
    </section>
<script>
	//excelDown click
	$("#excelDown").click( function(e){
		var $form=$("form[name='search']");
		$(this).attr("href","<c:url value='/excelDown.do' />"+"?"+$form.serialize() );
	}); 
</script>
  </main><!-- End #main -->
<script src="${pageContext.request.contextPath }/resources/js/admin_common_1.js"></script>

<%@ include file="admin_footer_common.jsp"%>