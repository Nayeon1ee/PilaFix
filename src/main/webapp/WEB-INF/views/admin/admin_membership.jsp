<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="admin_header_common.jsp" %>
<main id="main" class="main">
	<div class="pagetitle">
		<h1>고객관리</h1>
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
              <h5 class="card-title">회원관리</h5>
              <p>웹관리자가 등록된 회원리스트를 볼 수 있는 페이지입니다.</p>
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
								<div class="col-md-3">
									<label for="inputState" class="form-label">처리상태</label>
									<select id="inputState2" class="form-select" >
										<option selected disabled>전체</option>
										<option>처리완료</option>
										<option>처리대기</option>
									</select>
								</div>
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
			              	<!-- 엑셀다운 -->
							<div class="table-summary">
								<button onclick="window.open('<c:url value='/memberExcelDown.do' />')" type="button" class="btn btn-success btn-sm btn-default" id="excelDown">엑셀다운</button>
							</div>
				            <table class="table datatable">
								<thead>
								  <tr>
								    <th scope="col">회원번호</th>
								    <th scope="col">가입유형</th>
								    <th scope="col">이메일 아이디</th>
								    <th scope="col">회원명</th>
								    <th scope="col">생년월일</th>
								    <th scope="col">가입일자</th>
								    <th scope="col">회원상태</th>
									<th scope="col">상세보기</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${memberList == null }">
									<tr>
										<td colspan="5">등록된 회원이 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="member" items="${memberList }">
					    			<tr>
										<td>${member.csMemberCode }</td>
									    <td>${member.csRegistrationType }</td>
									    <td>${member.csEmailId }</td>
									    <td>${member.csName }</td>
									    <td>${member.csBirth }</td>
									    <td>${member.csRegistrationDate }</td>
									    <!-- 탈퇴 상태에 대한 처리 -->
										<!-- 탈퇴여부 Y이면 탈퇴회원 N이면 일반회원-->
										<c:choose>
											<c:when test="${member.csDeleteYn}">
												<td>탈퇴회원</td>
											</c:when>
											<c:otherwise>
												<td>일반회원</td>
											</c:otherwise>
										</c:choose>
										<td><a href="getMember.do?csMemberCode=${member.csMemberCode }">상세보기</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
<script>
	//excelDown click
	$("#excelDown").click( function(e){
		var $form=$("form[name='search']");
		$(this).attr("href","<c:url value='/memberExcelDown.do' />"+"?"+$form.serialize() );
	});
</script>
</main><!-- End #main -->
 
    
<%@ include file="admin_footer_common.jsp" %>
