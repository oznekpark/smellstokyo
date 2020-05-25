$(function() {
  $(document).on("ajax:success", ".fav", function(e) {
    if ($('#' + e.detail[0]).hasClass('star')) {
      $('#' + e.detail[0]).removeClass('star').addClass('star-o');
    } else {
  $('#' + e.detail[0]).removeClass('star-o').addClass('star');
    }
  })
})