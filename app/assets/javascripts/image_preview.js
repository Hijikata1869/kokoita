document.addEventListener("turbolinks:load", function(){

  let file = document.getElementById('file');
  let reader = new FileReader();

  reader.addEventListener('load', function(e) {
    document.getElementById('preview-image').src = reader.result;
  }, false);

  file.addEventListener('change', function(e) {
    let input = file.files[0];
    reader.readAsDataURL(input);
    document.getElementById('preview').innerHTML = "プレビュー";
  }, false);





})