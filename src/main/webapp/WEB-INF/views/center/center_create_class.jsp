<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%@ include file="center_header_common.jsp"%>
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
					<div class="card-body p-3">
						<!-- Multi Columns Form -->
						<form class="row g-3" action="insertCenterLesson.do" method="post"
							name="myForm">
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
								<label class="form-label">수업명</label> <input type="text" class="form-control" id="lsName" placeholder="수업명을 입력하세요">
							</div>
							<div class="col-md-12">
								<label class="form-label">강사명</label> 
									<select class="form-select" name="trainerMemberCode" aria-label="Default select example" id="trainerMemberCode">
									<option selected>강사</option>
									<c:forEach var="trainerList" items="${trainerList }">
										<option value="${trainerList.csMemberCode }">${trainerList.csName }</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-12">
								<label class="form-label">수업 정원</label> 
								<select class="form-select" name="lsCapacity" id="lsCapacity" aria-label="Default select example">
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
								<textarea class="form-control" id="lsContent" style="height: 300px;" placeholder="내용을 입력하세요"></textarea>
							</div>
							<div class="row">
								<div class="col-md-3 mt-2">
									<label class="form-label">수업 일자</label> 
									<input type="date" id="lsDate" class="form-control">
								</div>
								<div class="col-md-3 mt-2">
									<label class="form-label">수업 시간</label> 
									<select id="lsTime" class="form-select" name="lsTime">
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


								</div>
								<div class="col-md-3 mt-2 d-flex align-items-end">
									<button type="button" class="btn btn-primary btn-sm" id="addButton"> + </button>
								</div>
							</div>

							<div class="text d-flex justify-content-end">
								<button type="button" class="btn btn-primary me-2" onclick="insertLessons()">등록</button>
								<button type="reset" class="btn btn-secondary me-3"
									onclick="location.href='getCenterLessonList.do'">취소</button>
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
// 개인 / 그룹 선택
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


// 데이터를 전달하기 위해 name추가
function addNameProperty(dateTime) {
    dateTime.lsDate = { value: dateTime.lsDate, name: "lsDate" };
    dateTime.lsTime = { value: dateTime.lsTime, name: "lsTime" };
}

var lessonsArray = []; // 수업 객체 담을 배열 

// '날짜 및 시간 등록' 버튼 클릭 시 실행되는 함수
document.getElementById('addButton').addEventListener('click', function() {
	
	var lsType = document.getElementById('flexRadioDefault1').value;
	var lsName = document.getElementById('lsName').value;
	var trainerMemberCode = document.getElementById('trainerMemberCode').value;
	var lsCapacity = document.getElementById('lsCapacity').value;
	var lsContent = document.getElementById('lsContent').value;
	var lsDate = document.getElementById('lsDate').value;
	var lsTime = document.getElementById('lsTime').value;

	if (lsDate && lsTime) {
    	
    	// 클릭 시 수업 vo 생성 
    	var lessons = {
    		lsType : lsType,
    		lsName : lsName,
    		trainerMemberCode : trainerMemberCode,
    		lsCapacity : lsCapacity,
    		lsContent : lsContent,
    		lsDate : lsDate,
    		lsTime : lsTime
    	};
    	lessonsArray.push(lessons);
    	console.log("레슨 리스트 ");
    	console.log(lessonsArray);
        
        // 표에 추가된 정보를 보여줄 컨테이너
        var dateTimeContainer = document.getElementById('dateTimeContainer');

        // 추가된 정보를 표에 추가
        var newRow = document.createElement('div');
        newRow.classList.add('mt-2'); 
        newRow.innerHTML = lsDate + ' ' + lsTime + '시' + ' <button class="btn btn-secondary btn-sm ms-2 py-auto align-self-center" onclick="removeRow(this)"> - </button><br/>';
        dateTimeContainer.appendChild(newRow);
        
    } else {
        alert('날짜와 시간을 선택해주세요.');
    }
});

// 수업 등록 
function insertLessons(){
	console.log("수업 등록 메서드 호출");
	console.log(lessonsArray);
	
	$.ajax({
        type : "POST",
        url : "insertCenterLesson.do", 
        contentType: 'application/json',
        data : JSON.stringify(lessonsArray),
        success : function() {
        	window.location.href = 'getCenterLessonList.do';
			console.log("성공적으로 처리되었습니다.");
            
        },
        error : function (xhr, status, error) {
            console.error("Ajax 요청 실패");
            console.error("상태 코드: ", xhr.status);
            console.error("에러 메시지: ", error);
        }
    }); 
}


// 배열 행 제거 함수
function removeRow(button) {
    var row = button.parentNode;
    var index = Array.from(row.parentNode.children).indexOf(row);
    row.remove();
    dateTimeArray.splice(index, 1);
}

</script>

<%@ include file="center_footer_common.jsp"%>