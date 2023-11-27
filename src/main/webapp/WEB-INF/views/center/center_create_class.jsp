<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
							        <select class="form-select" name="trainerMemberCode" aria-label="Default select example" id="centerCode">
						        	<option selected>강사</option>
							        <c:forEach	var="trainerList" items="${trainerList }">
							        	<option value="${trainerList.csMemberCode }">${trainerList.csName }</option>
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
									<div id="dateTimeContainer"></div>
									<button type="button" class="btn btn-primary" id="addButton" onclick="addDateTimeInput()">날짜 및 시간 추가</button>
								</div>
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

function addDateTimeInput() {
    // 기존의 폼 요소를 가져옵니다.
    var originalForm = document.querySelector('form[name="myForm"]');
    
    // 기존 폼을 복제합니다.
    var clonedForm = originalForm.cloneNode(true);
    
    // 복제된 폼 내의 버튼 요소를 제거합니다.
    var buttons = clonedForm.querySelectorAll('button');
    buttons.forEach(function(button) {
        button.remove();
    });

    // 특정 input 요소의 type을 hidden으로 변경합니다.
    var dateInput = clonedForm.querySelector('input[name="lsDate"]');
    dateInput.type = 'hidden';

    var timeSelect = clonedForm.querySelector('select[name="lsTime"]');
    timeSelect.type = 'hidden';
    
    // 특정 부분을 제외하고 숨깁니다.
    var elementsToHide = clonedForm.querySelectorAll('.col-md-12:not(:nth-child(7)):not(:nth-child(8))');
    elementsToHide.forEach(function(element) {
        element.style.display = 'none';
    });
    
    // 새로운 폼을 추가합니다.
    document.querySelector('main').appendChild(clonedForm);
}
</script>

<%@ include file="center_footer_common.jsp" %>