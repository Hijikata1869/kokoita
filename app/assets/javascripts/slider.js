document.addEventListener("turbolinks:load", function(){

  const prevBtn = document.getElementById('prev-btn');
  const nextBtn = document.getElementById('next-btn');

  prevBtn.addEventListener('click', function() {
    alert('前の投稿を表示するボタンです');
  });
  nextBtn.addEventListener('click', function() {
    alrert('次の投稿を表示するボタンです')
  });

});