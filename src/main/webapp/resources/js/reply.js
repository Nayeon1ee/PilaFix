
  document.addEventListener('DOMContentLoaded', function() {
        var commentForm = document.getElementById('comment-form');
        var commentList = document.getElementById('comment-list');

        commentForm.addEventListener('submit', function(event) {
            event.preventDefault();

            var commentContent = commentForm.querySelector('#comment').value;

            // Get the current date
            var currentDate = new Date();
            var formattedDate = currentDate.toLocaleDateString(); // Adjust the format as needed

            var newComment = createCommentElement('사용자', commentContent, formattedDate);
            commentList.appendChild(newComment);

            commentForm.querySelector('#comment').value = '';
        });

        function createCommentElement(username, content, date) {
            var commentContainer = document.createElement('li');
            commentContainer.className = 'comment mb-3';

            var commentHeader = document.createElement('div');
            commentHeader.innerHTML = '<strong>' + username + ':</strong> ' + content + '<br><small>등록일자: ' + date + '</small>';
            commentContainer.appendChild(commentHeader);

            // 대댓글 폼
            var replyForm = document.createElement('form');
            replyForm.className = 'd-flex flex-column ml-4 reply-form';
            commentContainer.appendChild(replyForm);

            var replyTextarea = document.createElement('textarea');
            replyTextarea.className = 'form-control flex-grow-1';
            replyTextarea.rows = '2';
            replyForm.appendChild(replyTextarea);

            var replyButtonSubmit = document.createElement('button');
            replyButtonSubmit.type = 'submit';
            replyButtonSubmit.className = 'btn btn-primary btn-sm align-self-end mt-3 me-2';
            replyButtonSubmit.textContent = '대댓글 등록';
            replyForm.appendChild(replyButtonSubmit);

            replyForm.addEventListener('submit', function(event) {
                event.preventDefault();

                var replyContent = replyTextarea.value;
                var newReply = createReplyElement('사용자', replyContent, date);
                commentContainer.appendChild(newReply);

                replyTextarea.value = '';
                replyForm.style.display = 'none';
            });

            return commentContainer;
        }

        function createReplyElement(username, content, date) {
            var replyContainer = document.createElement('li');
            replyContainer.className = 'ml-4 reply-comment';
            replyContainer.innerHTML = '<strong>' + username + ':</strong> ' + content + '<br><small>등록일자: ' + date + '</small>';
            return replyContainer;
        }
    });