let entryCount = 0; // 출력 항목 수를 추적하는 변수

function displaySelectedDateTime() {
    entryCount++; // 출력 항목 수 증가
    const dateInputElement = document.getElementById('dateInput');
    const selectedDate = dateInputElement.value;

    const timeSelectElement = document.getElementById('timeSelect');
    const selectedTime = timeSelectElement.value;

    const outputElement = document.getElementById('outputDateTime');

    // 새로운 선택 내용을 추가 (줄 바꿈 포함)
    const entryId = entryCount;
    outputElement.innerHTML += '<p id="'  + entryId + '">선택한 날짜와 시간: ' + selectedDate + ' ' + selectedTime + ':00 시<button class="btn btn-primary" style="margin-left: 10px;" onclick="clearOutput(' + entryId + ')"> X </button></p>';
}

function clearOutput(entryId) {
    const outputElement = document.getElementById(entryId);
    if (outputElement) {
        outputElement.remove(); // 선택한 항목 제거
    }
}