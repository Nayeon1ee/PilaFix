<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시물 등록</title>
</head>
<script type="text/javascript">
function Activity(name, list){
    this.name = name;
    this.list = list;
}

var acts = new Array();
    acts[0] = new Activity('true', ['2', '3', '4', '5', '6']);
    acts[1] = new Activity('false', ['1']);

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

function duplicateForm() {
    // 원본 폼 요소를 선택
    const originalForm = document.querySelector('form');

    // 원본 폼을 복제
    const clonedForm = originalForm.cloneNode(true);
    
    // 새로운 폼의 이름을 고유하게 만듭니다.
    const formCount = document.querySelectorAll('form').length;
    clonedForm.name = 'myForm' + formCount;

    // 복제된 폼의 내용 초기화 (예: 선택한 날짜와 시간 초기화)
    const dateInput = clonedForm.querySelector('#lsDate');
    dateInput.value = '';

    const timeSelect = clonedForm.querySelector('#lsTime');
    timeSelect.selectedIndex = 0;
    
    // 삭제 버튼 추가
    const removeButton = document.createElement('button');
    removeButton.type = 'button';
    removeButton.textContent = '삭제';
    removeButton.onclick = function() {
        removeForm(clonedForm);
    };
    clonedForm.appendChild(removeButton);

    // 복제된 폼을 문서에 추가
    originalForm.parentNode.appendChild(clonedForm);
}

function submitAllForms() {
	const numberOfFormsToSubmit = document.querySelectorAll('form').length;
	
	for (let i = 0; i < numberOfFormsToSubmit; i++) {
        const forms = document.querySelectorAll('form');
        forms.forEach(form => form.submit());
        console.log("왜 그럴까????????????????");
    }
}
</script>
<body>
<!-- 아직 한 번에 여러개의 수업을 입력하는 것은 미완 상태 -->
<form action="insertCenterLesson.do" method="post" name="myForm">
	수업 유형
	<input type="radio" name="rad" value="true" onclick="updateList(this.value)" checked>그룹
  	<input type="radio" name="rad" value="false" onclick="updateList(this.value)">개인
	수업명 <input type="text" name="lsName">
	강사명
	<select id="trainerMemberCode" name="trainerMemberCode">
		<option value="123456">하민</option>
		<option value="123457">민승</option>
		<option value="123458">은주</option>
		<option value="123459">수미</option>
	</select>
	정원
	<select id="lsCapacity" name="lsCapacity">
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
	</select>
	수업 내용 <input type="text" name="lsContent">
	
	
	
	수업 일자
	<input type="date" name="lsDate" id="lsDate"/>
	<label for="timeInput">시간을 입력하세요:</label>
	<select id="lsTime" name="lsTime" class="lsTime">
		<option selected>시간</option>
		<option value="06:00">6시</option>
		<option value="07:00">7시</option>
		<option value="08:00">8시</option>
		<option value="09:00">9시</option>
		<option value="10:00">10시</option>
		<option value="11:00">11시</option>
		<option value="12:00">12시</option>
		<option value="13:00">13시</option>
		<option value="14:00">14시</option>
		<option value="15:00">15시</option>
		<option value="16:00">16시</option>
		<option value="17:00">17시</option>
		<option value="18:00">18시</option>
		<option value="19:00">19시</option>
		<option value="20:00">20시</option>
		<option value="21:00">21시</option>
		<option value="22:00">22시</option>
	</select>
	<button type="button" onclick="duplicateForm()">추가</button>
</form>
	<button id="submitAllForms" onclick="submitAllForms()">모두 등록</button>
<a href="getCenterLessonList.do">글 목록</a>

</body>
</html>