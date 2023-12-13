<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="admin_header_common.jsp" %>


 
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>커뮤니티 관리</h1>
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
<!-- 검색필터 시작 -->
 <form id="searchForm" action="serchFilter.do" method="post">
             <div class="search-filter">
      <div class="search-filter-inner" >
    
     <div class="serch-filter-content">
      <div class="search-top">
              <div class="col-md-3">
                  <label for="inputState" class="form-label">검색</label>
                  <select id="searchType" class="form-select" name="searchType">
                    <option selected disabled>전체</option>
                    <option value="CM_TITLE">글 제목</option>
                    <option value="CS_NAME">글 작성자</option>
                  </select>
                </div>
           <div class="serch-input">
             <div class="col-md-6">
                  <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력해주세요">
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
                    <input type="date" class="form-control-date" id="startDate" name="startDate">
                  <span>~</span>
                    <input type="date" class="form-control-date" id="endDate" name="endDate">
                  </div>
                  </div>
                  </div>
                  
                </div>
             </div>
             </div>
        </form>
<!-- 검색필터 끝 -->
<!-- 게시판 시작 -->
    <h5 class="card-title"></h5>
              <!-- Table with stripped rows -->
              <div id="communityList">
              <table class="table datatable">
                <thead>
                  <tr>
                    <th scope="col">글 번호</th>
                    <th scope="col">글 제목</th>
                    <th scope="col">글 내용</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성일</th>
                    <th scope="col">공개 여부</th>
                  </tr>
                </thead>
               
                <tbody >
                <!-- 커뮤니티 리스트 -->
                <c:forEach var="list" items="${communityList}">
				<tr>
					<th scope="row">${list.cmNumber}</th>
                    <td ><a href="getCommunity.do?cmNumber=${list.cmNumber}&csName=${list.csName}" class="admin-alink-color">${list.cmTitle}</a></td>
					<td>${list.cmContent}</td>
					<td>${list.csName}</td>
					<td>${list.cmRegdate}</td>
					<td>${list.cmOpenYn}</td>
				</tr>
			</c:forEach>
                </tbody>
               
              </table>          	
		</div>
            </div>
          </div>

        </div>
      </div>
    </section>
 <!-- 내가만든 js -->
 <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/admin_common_2.js"></script> 
 
 <!-- 검색필터 
 <script type="text/javascript">
 
     $("#searchForm").submit(function (event) {
         event.preventDefault(); //  HTML 폼이 제출되면 페이지가 다시 로드되거나 새로 고침되는데 그걸 방지해줌

         // 폼 데이터 가져오기
         var searchType = $("#searchType").val()
         var searchKeyword = $("#searchKeyword").val()
         var startDate = $("#startDate").val()
         var endDate = $("#endDate").val()
        console.log("폼에 입력한 데이터"+searchType,searchKeyword,startDate,endDate) ;
         // AJAX를 사용하여 서버에 데이터 전송
         $.ajax({
             type: "POST",
             url: "serchFilter.do",
             data: {
            	 searchType :searchType,
            	 searchKeyword :searchKeyword,
            	 startDate :startDate,
            	 endDate :endDate 
             },
             success: function (data) {
                 console.log(data);
                /*var str = "";
                 $('#communityList').html('');
                 str = '<table class="table datatable">';
					str = ' <thead>';
					str = '<tr>';
					str = '<th scope="col">글 번호</th>';
					str = '<th scope="col">글 제목</th>';
					str = '<th scope="col">글 내용</th>';
					str = '<th scope="col">작성자</th>';
					str = '<th scope="col">작성일</th>';
					str = '<tr>';
					str = '</thead>';
					str = '<tbody>';
                 if (data.length < 1) {
						$('#communityList').append('<tr><td colspan="5">검색결과가 없습니다.</td></tr>');
					} else {
						
						data.forEach(function(item) {
							
							str = '<tr>';
							str += '<th scope="row">'+item.cmNumber+'</th>';
							str += '<td ><a href="getCommunity.do?cmNumber='+item.cmNumber+'"&csName=+"'+item.csName+'" class="admin-alink-color">'+item.cmTitle+'</a></td>'
							str += '<td>'+item.cmContent+'</td>'
							str += '<td>'+item.csName+'</td>'
							str += '<td>'+item.cmRegdate+'</td>'
							str += '</tr>'
							str += '</tbody></table>'
						
							$('#communityList').append(str);
						});
					
					}*/
             },
             error: function (error) {
                 console.log("에러 발생: " + JSON.stringify(error));
             }
         });
     });


 
 
 
 
 </script> -->
  </main><!-- End #main -->
<%@ include file="admin_footer_common.jsp"%>