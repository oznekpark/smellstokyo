$(document).on('turbolinks:load', function() {
  $(function(){
    $("#selectBtn").on("click", function(e){
      if(document.getElementById('brand_id').value === "" 
      && document.getElementById('sex_id').value === "" 
      && document.getElementById('smell_type_id').value === "" 
      && document.getElementById('main_spice_id').value === "" 
      && document.getElementById('smell_impression_id').value === "" 
      && document.getElementById('use_scene_id').value === ""){
        alert("項目を選択してください。");
        return false;
      }else{
        return true;
      }
    })
  });
});