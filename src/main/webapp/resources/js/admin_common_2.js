/**
 * 날짜 선택시 시작일보다 빠른 종료일 막는 js (셀렉트박스 1개있는 것)
 */
//입력 필드 가져오기
 const startDateInput = document.getElementById('startDate');
 const endDateInput = document.getElementById('endDate');

 // 이벤트 리스너 추가
 startDateInput.addEventListener('input', () => {
     restrictEndDate();
 });

 endDateInput.addEventListener('input', () => {
     restrictEndDate();
 });

 function restrictEndDate() {
     const startDate = new Date(startDateInput.value);
     const endDate = new Date(endDateInput.value);

     if (startDate > endDate) {
    	 alert('시작 날짜는 종료 날짜보다 빨라야 합니다.');
         // 현재 입력을 지우거나 기존 유효한 날짜를 복원할 수 있도록 처리
         startDateInput.value = '';
         endDateInput.value = '';
     }
 }
 
 /* 검색 필터 초기화*/
 document.addEventListener('DOMContentLoaded', function() {
  const searchType = document.getElementById('searchType');
  const searchKeyword = document.getElementById('searchKeyword');
  const startDate = document.getElementById('startDate');
  const endDate = document.getElementById('endDate');

  const resetButton = document.getElementById('resetButton');
  resetButton.addEventListener('click', function() {
    searchType.selectedIndex = 0;  // 선택 박스 초기화
    searchKeyword.value = '';          // 검색어 입력 필드 초기화
    startDate.value = '';          // 시작일 초기화
    endDate.value = '';            // 종료일 초기화
  });
});


