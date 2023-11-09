<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style_FAQ.css">
  <script src="${pageContext.request.contextPath}/resources/js/quiry_FAQ.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap_Nayeon.css">
  <script src="${pageContext.request.contextPath}/resources/bootstrap/js_bootstrap_common.js"></script>
  <meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container000">

		<section class="content000">
			<area1>
			<p>area1</p>
			</area1>

			<main> 		
<div id="myPage">
        <h3><a href="memberPage.jsp">마이페이지</a> > FAQ</h3>
        <div id="userInfo">
            <div id="myInfoLink">내 정보 관리</div>
            <div id="userInfoText">*** 회원님</div>
        </div>
        
        <nav class="navbar navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand">FAQ</a>
    <form class="d-flex">
      <input class="form-control me-2" type="search" placeholder="무엇을 도와드릴까요?" aria-label="Search" onfocus="clearText(this)" id="searchInput">
      <button class="btn btn-outline-success" type="submit" onclick="searchFAQ()">Search</button>
    </form>
  </div>
</nav>

<div id="searchResults" style="display: none;">

  <!-- 여기에 검색 결과가 표시 -->
  
</div>

<div>
<p class="total-faq-count">전체 00건</p>
<hr>
</div>



<div class="accordion" id="accordionExample">
<div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#inquiryCollapse" aria-expanded="true" aria-controls="inquiryCollapse">
        <div class="inquiry-item">
            <div class="inquiry-details">
                <div class="inquiry-title"> <strong>Q</strong> 질문입니다.</div>
        </div>
        </div>
      </button>
    </h2>
    <div id="inquiryCollapse" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>A</strong> <br> 
        답변입니다.
      </div>
    </div>
    </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#inquiryCollapse2" aria-expanded="true" aria-controls="inquiryCollapse2">
        <div class="inquiry-item">
          <div class="inquiry-details">
            <div class="inquiry-title"> <strong>Q</strong> 질문입니다.</div>
          </div>
        </div>
      </button>
    </h2>
    <div id="inquiryCollapse2" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>A</strong> <br> 
        답변입니다.
      </div>
    </div>
  </div> 
  
  
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#inquiryCollapse3" aria-expanded="true" aria-controls="inquiryCollapse3">
        <div class="inquiry-item">
          <div class="inquiry-details">
            <div class="inquiry-title"> <strong>Q</strong> 질문입니다.</div>
          </div>
        </div>
      </button>
    </h2>
    <div id="inquiryCollapse3" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>A</strong> <br> 
        답변입니다.
      </div>
    </div>
  </div>
  
  
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#inquiryCollapse4" aria-expanded="true" aria-controls="inquiryCollapse4">
        <div class="inquiry-item">
          <div class="inquiry-details">
            <div class="inquiry-title"> <strong>Q</strong> 질문입니다.</div>
          </div>
        </div>
      </button>
    </h2>
    <div id="inquiryCollapse4" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>A</strong> <br> 
        답변입니다.
      </div>
    </div>
  </div>
  
</div>
  
  
  
</div>
			
			
			</main>

			<area2>
			<p>area2</p>
			</area2>
		</section>

	</div>
			
</body>
</html>