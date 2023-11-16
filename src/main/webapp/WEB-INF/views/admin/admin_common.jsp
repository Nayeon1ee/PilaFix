<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- 게시판 시작 -->
    <h5 class="card-title"></h5>
              <!-- Table with stripped rows -->
              <table class="table datatable">
                <thead>
                  <tr>
                    <th scope="col">NO.</th>
                    <th scope="col">글제목</th>
                    <th scope="col">글내용</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성일</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">6</th>
                    <td><a href="${pageContext.request.contextPath }/community_detail.jsp" class="admin-alink-color">xx점 후기</a></td>
                    <td>토미강사 추천 어쩌구 저쩌구 어쩌구 저쩌구</td>
                    <td>김xx</td>
                    <td>2016-05-25</td>
                  </tr>
                  <tr>
                    <th scope="row">5</th>
                    <td><a href="#" class="admin-alink-color">ss점 후기</a></td>
                    <td>ss강사 비추 가지마셈</td>
                    <td>이ss</td>
                    <td>2014-12-05</td>
                  </tr>
                  <tr>
                    <th scope="row">4</th>
                    <td><a href="#" class="admin-alink-color">한달만에 10kg뺀 썰 푼다</a></td>
                    <td> 어쩌구 저쩌구 효소가 어쩌구</td>
                    <td>신00</td>
                    <td>2011-08-12</td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td><a href="#" class="admin-alink-color">넘 힘들다</a></td>
                    <td>집가고 싶다아아아아아아아아</td>
                    <td>구99</td>
                    <td>2012-06-11</td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td><a href="#" class="admin-alink-color">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</a></td>
                    <td>ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</td>
                    <td>강22</td>
                    <td>2011-04-19</td>
                  </tr>
                  <tr>
                    <th scope="row">1</th>
                    <td><a href="#" class="admin-alink-color">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</a></td>
                    <td>ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</td>
                    <td>강33</td>
                    <td>2011-04-19</td>
                  </tr>
                </tbody>
              </table>          	
	
            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->
<%@ include file="admin_footer_common.jsp" %>