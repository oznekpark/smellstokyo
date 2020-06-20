$(function(){
  function buildHTML(comment){
    let html = `<div class="comments__each">
                  <div class="comments__each__postTime">
                  ${comment.created_at}
                  </div>
                  <div class="comments__each__content">
                    <div class="comments__each__content__nickName">
                    投稿者 : ${comment.user_name}
                    </div>
                    <div id="star-rate-${comment.id}">
                      <script>
                        $('#star-rate-${comment.id}').raty({
                          size: 36,
                          starOff: "/assets/star-off-6aaeebdaab93d594c005d366ce0d94fba02e7a07fd03557dbee8482f04a91c22.png",
                          starOn: "/assets/star-on-fd26bf0ea0990cfd808f7540f958eed324b86fc609bf56ec2b3a5612cdfde5f5.png",
                          starHalf: "/assets/star-half-db15fb9b3561d5c741d8aea9ef4f0957bd9bc51aa1caa6d7a5c316e083c1abd5.png",
                          half: true,
                          readOnly: true,
                          score: "${comment.rate}"
                        });
                      </script>
                    </div>
                  </div>
                  <div class="comments__each__text">
                    <p>${comment.text}</p>
                  </div>
                </div>`
    return html;
  }
  $("#new_comment").on("submit", function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      type: "POST",
      url: url,
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false
    })
    .done(function(comment){
      let html = buildHTML(comment);
      $(".comments").append(html);
      $("#new_comment")[0].reset();
    })
    .fail(function(){
      alert("メッセージの送信に失敗しました");
    })
    .always(function(){
      $(".commentForm__submit__btn").prop("disabled", false);
    })
  });
});