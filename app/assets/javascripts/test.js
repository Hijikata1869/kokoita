document.addEventListener('DOMContentLoaded',
function(){
  
  const title = document.getElementById("title");
  title.addEventListener("click", () => {
    alert("このアプリのタイトルです");
  });

}, false);