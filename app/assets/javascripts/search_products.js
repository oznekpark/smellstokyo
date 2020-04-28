// $(function (){
//   var lists = $('.index-contents__main__categoryList__innerList li');
//   $('.formFromIndex').on('submit', function(e){
//     e.preventDefault();
//     
//     lists.show();
//     for (var i = 0; i < $('.index-contents__selectTab__selectCategory__list__tag select').length; i++) {
//       var item = $('')
//     };
//   });
// });

$(function() {
  $(".index-contents__selectTab__selectBtn__btn").click(function(e){
    e.preventDefault();
    const str1 = $("#brand_id").val();
    $(".index-contents__main__categoryList__innerList__innerBox").text(str1)
  })
});

// $('#brand_id').on('change', function(){
//   console.log("ボタンが押されました");
//   // テキストを取得(例：北海道)
//   var area = $(this).children(':selected').text();

//   $('.index-contents__main__categoryList__innerList__innerBox').each(function(){
//     // 全て非表示にする(初期化)
//     $(this).addClass('hide');

//     // '全て'が選択されていれば
//     if(area == '全て'){
//       // 表示する
//       $(this).removeClass('hide');

//     // テキスト(例：北海道)が一致していれば
//     }else if($(this).html().match(area)){
//       // 表示する
//       $(this).removeClass('hide');
//     }
//   });
// });