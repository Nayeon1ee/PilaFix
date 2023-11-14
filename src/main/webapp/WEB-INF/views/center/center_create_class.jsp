<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="center_header_common.jsp" %>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>수업 생성</h1>
			<nav>
				<ol class="breadcrumb">
					<!-- 소제목 필요 시 작성 -->
					<li class="breadcrumb-item"></li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<!-- Multi Columns Form -->
							<form class="row g-3" action="insertCenterLesson.do" method="post" name="myForm"> 
								<input type="hidden" class="form-control" name="lsCode" value="${centerLesson.lsCode }">
								<div class="col-md-12 col-top">
									<label class="form-label">수업 유형</label>
									<div class="radio-box">
										<div class="form-check">
											<input class="form-check-input" type="radio" name="lsType" value="그룹" onclick="updateList(this.value)" id="flexRadioDefault1">
											<label class="form-check-label" for="flexRadioDefault1">그룹</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio" name="lsType" value="개인" onclick="updateList(this.value)" id="flexRadioDefault1">
											<label class="form-check-label" for="flexRadioDefault1">개인</label>
										</div>
									</div>
								</div>
								<div class="col-md-12">
									<label class="form-label">수업명</label>
									<input type="text" class="form-control" name="lsName" placeholder="수업명을 입력하세요">
								</div>
								<div class="col-md-12">
									<label class="form-label">강사명</label>
									<select class="form-select" name="trainerMemberCode" aria-label="Default select example">
										<option selected>강사</option>
										<option value="123456">송하민</option>
										<c:forEach var="trainer" items="${centerLesson }">
											<option value="${trainer.trainerMemberCode}">${trainer.csName}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-12">
									<label class="form-label">수업 정원</label>
									<select class="form-select" name="lsCapacity" id="lsCapacity"  aria-label="Default select example">
										<option selected>수업 정원</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
									</select>
								</div>
								<div class="col-md-12">
									<label class="form-label">수업 내용</label>
									<textarea class="form-control" name="lsContent" style="height: 300px;" placeholder="내용을 입력하세요"></textarea>
								</div>
								<div class="col-md-12">
									<label class="form-label">수업 일자</label>
									<input type="date" id="dateInput" name="lsDate">
								</div>
								<div class="col-md-12">
									<label class="form-label" >수업 시간</label>
									<select id="timeSelect" class="time-select" name="lsTime">
										<option selected>시간</option>
										<option value="6">6시</option>
										<option value="7">7시</option>
										<option value="8">8시</option>
										<option value="9">9시</option>
										<option value="10">10시</option>
										<option value="11">11시</option>
										<option value="12">12시</option>
										<option value="13">13시</option>
										<option value="14">14시</option>
										<option value="15">15시</option>
										<option value="16">16시</option>
										<option value="17">17시</option>
										<option value="18">18시</option>
										<option value="19">19시</option>
										<option value="20">20시</option>
										<option value="21">21시</option>
										<option value="22">22시</option>
									</select>
									<button type="button" class="btn btn-primary" onclick="displaySelectedDateTime()">선택</button>
									<div id="outputDateTime"></div>
								</div>
								<div class="col-md-12">
									<label class="form-label">예약 가능 여부</label>
									<div class="radio-box">
										<div class="form-check">
											<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value=true>
											<label class="form-check-label" for="flexRadioDefault1">Y</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value=false>
											<label class="form-check-label" for="flexRadioDefault1">N</label>
										</div>
										<div class="p-check" style="display: inline-block;">
											<p>(Y를 선택하면 회원이 바로 구매가 가능합니다.)</p>
											<p>(N을 선택하면 수강권을 생성만 합니다.)</p>
										</div>
									</div>
								</div>
								<div class="text-center"></div>
								<div class="text-center">
									<button type="submit" class="btn btn-primary">등록</button>
									<button type="reset" class="btn btn-secondary" onclick="location.href='getCenterLessonList.do'">취소</button>
								</div>
							</form>
							<!-- End Multi Columns Form -->
						</div>
					</div>
				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->
<script type="text/javascript">
// 개인일 경우 1명만 선택 가능
function Activity(name, list){
    this.name = name;
    this.list = list;
}

var acts = new Array();
    acts[0] = new Activity('그룹', ['2', '3', '4', '5', '6']);
    acts[1] = new Activity('개인', ['1']);

function updateList(str){
    var frm = document.myForm;
    var oriLen = frm.lsCapacity.length;
    var numActs;

    for (var i = 0; i < acts.length; i++){
        if (str == acts[i].name) {
            numActs = acts[i].list.length;
            for (var j = 0; j < numActs; j++)
                frm.lsCapacity.options[j] = new Option(acts[i].list[j], acts[i].list[j]);
            for (var j = numActs; j < oriLen; j++)
                frm.lsCapacity.options[numActs] = null;
        }
    }
}

function removeForm(formElement) {
    formElement.parentNode.removeChild(formElement);
}


</script>

<%@ include file="center_footer_common.jsp" %>