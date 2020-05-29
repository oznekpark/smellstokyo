$(function(){
  $("#addToCart").on('click', function(e){
    if(document.getElementById('quantity').value === ""){
      alert("数量を選択してください。");
      return false;
    }else{
      return true;
    }
  })
});