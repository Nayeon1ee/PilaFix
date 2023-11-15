<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="admin_header_common.jsp"%>
<html class="yourHtmlString">
  <main id="main" class="main">
    <div class="pagetitle">
      <h1>이메일발송이력관리</h1>
      <nav>
        <ol class="breadcrumb">
          <!-- <li class="breadcrumb-item">필요 시 작성</li>기존에는 현재 위치 표시였음 Depth1>Depth2>Depth3 표시 -->
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section" >
      <div class="row">
        <div class="col-lg-12">
          <div class="card" >
            <div class="card-body" >
              <h5 class="card-title">이메일 발송이력 리스트</h5>
              <p>웹관리자가 보내는 이메일 발송이력 리스트입니다.(대표자 계정생성, 약관 변경시, 회원가입시 이메일인증, 비밀번호찾을때)</p>
             	 
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

              <!-- Table with stripped rows -->
              <table class="table datatable" >
                <thead>
                  <tr>
                    <th scope="col">이메일발송코드</th>
                    <th scope="col">이메일발송유형</th>
                    <th scope="col">이메일발송일시</th>
                    <th scope="col">수신자명</th>
                    <th scope="col">수신제목</th>
                    <th scope="col">수신내용</th>
                    <th scope="col">수신자이메일</th>
                    <th scope="col">발송성공여부</th>
                    <th scope="col">발송성공시간</th>
                    <th scope="col">발송실패사유</th>
                  </tr>
                </thead>
                <tbody>
                <c:if test="${sendEmailHistoryInfoList == null }">
					<tr>
						<td colspan="10">등록된 글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="sendEmailHistoryInfo" items="${sendEmailHistoryInfoList }">
                  <tr>
                    <td>${sendEmailHistoryInfo.mhEmailSendCode }</td>
					<td>${sendEmailHistoryInfo.mhEmailSendType }</td>
					<td>${sendEmailHistoryInfo.mhEmailSendDatetime }</td>
					<td>${sendEmailHistoryInfo.mhRecipientName}</td>
					<td><a href="getSendEmailHistoryInfo.do?mhEmailSendCode=${sendEmailHistoryInfo.mhEmailSendCode }">${sendEmailHistoryInfo.mhRecipientTitle }</a></td>
					<td>${sendEmailHistoryInfo.mhRecipientContent }</td>
					<td>${sendEmailHistoryInfo.mhRecipientEmail }</td>
					<td>${sendEmailHistoryInfo.mhSuccessyn }</td>
					<td>${sendEmailHistoryInfo.mhSuccessDatetime }</td>
					<td>${sendEmailHistoryInfo.mhFailReason }</td>
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
  </main><!-- End #main -->
  	<script type="text/javascript">
  	
  	var $html = $('<div>').html(yourHtmlString);
  	console.log(yourHtmlString);

  	// card-title 속성을 가진 요소 찾아서 제거
  	$html.find('[card]').removeAttr('card');

  	var modifiedHtml = $html.html();
	</script>
  	<script src="${pageContext.request.contextPath }/resources/js/admin_common_1.js"></script>
  	<script src="${pageContext.request.contextPath}/resources/js/admin_common_2.js"></script>
	<%@ include file="admin_footer_common.jsp"%>
