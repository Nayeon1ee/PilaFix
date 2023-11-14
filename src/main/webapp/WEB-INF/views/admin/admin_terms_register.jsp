<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="admin_header_common.jsp" %>

 
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>이용약관 등록</h1>
      <!--<nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">필요 시 작성</li>기존에는 현재 위치 표시였음 Depth1>Depth2>Depth3 표시
        </ol>
      </nav> -->
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <!-- <h5 class="card-title">이용약관 등록 페이지</h5>  -->
              <p>이용약관등록</p>


<!-- Multi Columns Form -->
<form class="row g-3" action="insertTerms.do" method="post">
 	<div class="col-md-12">
       <label class="form-label">약관명</label>
       <input type="text" id="tmName" name="tmName" class="form-control" placeholder="약관명을 입력하세요.">
    </div>
    <div class="col-md-12">
       <label class="form-label">약관 상세</label>
       <textarea class="form-control" id="tmDetail" name="tmDetail" placeholder="약관 상세내용을 입력하세요." style="height: 300px;"></textarea>
    </div>
    
    
	<label class="form-label">필수여부</label>    
	<fieldset class="row mb-3">
	    <div class="col-sm-10">
	        <div class="form-check form-check-inline">
	            <input class="form-check-input" type="radio" name="tmRequiredYn" id="tmRequiredYes" value="true" checked>
	            <label class="form-check-label" for="tmRequiredYes">필수</label>
	        </div>
	        <div class="form-check form-check-inline">
	            <input class="form-check-input" type="radio" name="tmRequiredYn" id="tmRequiredNo" value="false">
	            <label class="form-check-label" for="tmRequiredNo">선택</label>
	        </div>
	    </div>  
	</fieldset>
	
	<label class="form-label">공개여부</label>
	<fieldset class="row mb-3">
    <div class="col-sm-10">
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="tmOpenYn" id="tmOpenYes" value="true" checked>
            <label class="form-check-label" for="tmOpenYes">공개</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="tmOpenYn" id="tmOpenNo" value="false">
            <label class="form-check-label" for="tmOpenNo">비공개</label>
        </div>
    </div>  
	</fieldset>
	
           
    <div class="text-center" >
       <button type="submit" class="btn btn-primary">등록</button>
       <button type="button" class="btn btn-secondary" onclick="location.href='getTermsList.do'">취소</button>
    </div>

</form>
<!-- End Multi Columns Form -->


            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->

<script>
function validateAndFocus() {
  var tmName = document.getElementById('tmName');
  var tmDetail = document.getElementById('tmDetail');

  if (!tmName.value.trim()) {
    alert('약관명을 입력해주세요.');
    tmName.focus();
    return false;
  } else if (!tmDetail.value.trim()) {
    alert('약관 상세내용을 입력해주세요.');
    tmDetail.focus();
    return false;
  }
  return true; // 입력값 유효하면 폼 제출 계속
}
</script>


<%@ include file="admin_footer_common.jsp"%>