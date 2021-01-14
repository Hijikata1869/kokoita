document.addEventListener("turbolinks:load", function() {

  function fadeIn(obj) {
    obj.animate({
      opacity: [0, 1]
    }, 1500);
  }

  const title = document.getElementById("title");
  const topDesc = document.getElementById("top-desc");

  fadeIn(title);
  fadeIn(topDesc);

});