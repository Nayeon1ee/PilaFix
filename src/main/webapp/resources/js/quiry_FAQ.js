function clearText(input) {
  if (input.value === "무엇을 도와드릴까요?") {
    input.value = "";
  }
}

function searchFAQ() {
  var searchInput = document.getElementById("searchInput");
  var searchResults = document.getElementById("searchResults");

  // 입력된 검색어를 가져오기
  var query = searchInput.value;

  // 이 부분에서 검색 결과를 가져와서 searchResults 요소에 표시하는 로직을 구현

  // 검색 결과를 표시
  searchResults.style.display = "block";
}

    document.addEventListener("DOMContentLoaded", function () {
        var toggleButtons = document.querySelectorAll(".status-button");

        toggleButtons.forEach(function (toggleButton) {
            toggleButton.addEventListener("click", function () {
                var inquiryItem = toggleButton.closest(".inquiry-item");
                var replyContainer = inquiryItem.querySelector(".inquiry-reply-container");

                if (replyContainer.style.display === "none" || replyContainer.style.display === "") {
                    replyContainer.style.display = "block";
                } else {
                    replyContainer.style.display = "none";
                }
            });
        });
    });