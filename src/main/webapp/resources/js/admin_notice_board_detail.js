/**
 * 수정 페이지로 이동
 */
function updateAdminInfo() {
	window.location.href="updateAdminInfo.do?seq=" + adminInfoSeq;
}

/**
 * 목록 페이지로 이동
 */
 function getAdminInfoList() {
	window.location.href = "getAdminInfoList.do";
}
/**
 * 삭제 버튼
 */
function deleteAdminInfo() {
	window.location.href="deleteAdminInfo.do?seq=" + adminInfoSeq;
}