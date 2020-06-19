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
                    <div id="star-rate-${comment.id}" title="${comment.text}">
                      <img alt="1" src="/assets/star-on-fd26bf0ea0990cfd808f7540f958eed324b86fc609bf56ec2b3a5612cdfde5f5.png" title="${comment.text}">&nbsp;<img alt="2" src="/assets/star-on-fd26bf0ea0990cfd808f7540f958eed324b86fc609bf56ec2b3a5612cdfde5f5.png" title="${comment.text}">&nbsp;<img alt="3" src="/assets/star-on-fd26bf0ea0990cfd808f7540f958eed324b86fc609bf56ec2b3a5612cdfde5f5.png" title="${comment.text}">&nbsp;<img alt="4" src="/assets/star-on-fd26bf0ea0990cfd808f7540f958eed324b86fc609bf56ec2b3a5612cdfde5f5.png" title="${comment.text}">&nbsp;<img alt="5" src="/assets/star-off-6aaeebdaab93d594c005d366ce0d94fba02e7a07fd03557dbee8482f04a91c22.png" title="${comment.text}">
                      <input name="score" type="hidden" value="${comment.rate}" readonly="">
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
      $("#review_star").val("");
      $("#comment_text").val("");
      // $("#new_comment")[0].reset();
    })
  });
});