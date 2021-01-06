document.addEventListener("turbolinks:load", function() {
  const title = document.getElementById("title");
  title.addEventListener("click", () => {
    alert("このアプリのタイトルです");
  });
});