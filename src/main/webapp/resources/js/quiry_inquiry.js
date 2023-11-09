
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
