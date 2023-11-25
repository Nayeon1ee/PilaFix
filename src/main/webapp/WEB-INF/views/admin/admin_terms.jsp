<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="admin_header_common.jsp" %>


  <main id="main" class="main">

    <div class="pagetitle">
      <h1>이용약관 관리</h1>
    <!--    <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">필요 시 작성</li>
          기존에는 현재 위치 표시였음 Depth1>Depth2>Depth3 표시
        </ol>
      </nav> -->
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">중제목 작성</h5>
              <p>간략한 설명</p>
<!-- 검색필터 시작 -->
          
<!-- 검색필터 끝 -->
<div class="terms-btn">
<span class="terms-reg-btn">
<button type="button" class="btn btn-primary" onclick="location.href='insertTerms.do'">약관등록</button>
</span>
<span class="excel-down-btn">
<button onclick="window.open('<c:url value='/termsExcelDown.do' />')" type="button" class="btn btn-success btn-sm btn-default" id="excelDown">엑셀다운</button>
</span>
</div>
<!-- 게시판 시작 -->
              <!-- Table with stripped rows -->
              <table class="table datatable">
                <thead>
                  <tr>
                    <th scope="col">약관번호</th>
                    <th scope="col">약관명</th>
                    <th scope="col">약관등록일자</th>
                    <th scope="col">최근수정일자</th>
                    <th scope="col">필수여부</th>
                    <th scope="col">공개여부</th>
                  </tr>
                </thead>
                <tbody>
				<c:if test="${termsList == null }">
					<tr>
						<td colspan="5">등록된 글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="list" items="${termsList }">
				    <tr>
					    <td><a href="getTerms.do?tmCode=${list.tmCode}">${list.tmCode}</a></td>
					    <td>${list.tmName}</td>
					    <td>${list.tmRegdate}</td>
					    <td>${list.tmModifiedDate}</td>
						<td>${list.tmRequiredYn ? '필수' : '선택'}</td>
						<td>${list.tmOpenYn ? '공개' : '비공개'}</td>
				   	</tr>
				</c:forEach>
                </tbody>
              </table>
              <!-- End Table with stripped rows -->          	

	 <!-- 페이징 처리 시작 
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
    페이징 처리 끝 -->
	
            </div>
          </div>

        </div>
      </div>
    </section>
<script>
	//excelDown click
	$("#excelDown").click( function(e){
		var $form=$("form[name='search']");
		$(this).attr("href","<c:url value='//termsExcelDown.do' />"+"?"+$form.serialize() );
	});
</script>
  </main><!-- End #main -->
 
 
 <%@ include file="admin_footer_common.jsp"%>