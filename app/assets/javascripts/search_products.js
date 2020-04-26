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
  var lists = $('.index-contents__main__categoryList__innerList li');
  $(".formFromIndex").on('submit', function(e) {
    e.preventDefault();
    console.log("ボタンが押されました");
    lists.show();
    for (var i = 0; i < $('.index-contents__selectTab__selectCategory__list__tag select').length; i++) {
        // 絞り込みの項目を取得
        var item = $('.index-contents__selectTab__selectCategory__list__tag select').eq(i).attr('name');
        // 絞り込みの対象を取得
        var target = $('.index-contents__selectTab__selectCategory__list__tag select').eq(i).val();

        if(target != '') {
            for (var j = 0; j < lists.length; j++) {
              // 絞り込み対象でない場合は非表示
              if(!lists.eq(j).find('.' + item).find('span').hasClass(target)) {
                  lists.eq(j).hide();
              }
            };
          }
      };
  });
});