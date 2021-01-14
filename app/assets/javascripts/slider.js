document.addEventListener("turbolinks:load", function(){

  const slider = function(){
    const prevBtn = document.getElementById('prev-btn');
    const nextBtn = document.getElementById('next-btn');
    prevBtn.style.display = "none";

    const sliderWidth = document.querySelector('.slider-list');
    let width = sliderWidth.clientWidth;

    const sliderList = document.querySelector('.slider-list');
    const sliderItem = document.querySelectorAll('.slider-item');

    const indicator = document.querySelector('.indicator').children;

    let counter = 0;

    const firstIndex = 0;
    const secondIndex = 1;
    const thirdIndex = 2;

    nextBtn.addEventListener('click', function() {
      if(counter == sliderItem.length - 1) return;
      prevBtn.style.display = "block";
      sliderList.style.transition = ".5s";
      counter ++;
      sliderList.style.transform = "translateX("+ (- width * counter) + "px)";
      if(counter == sliderItem.length - 2){
        indicator.item(firstIndex).removeAttribute('id');
        indicator.item(secondIndex).setAttribute('id', 'active');
      } else if (counter == sliderItem.length -1){
        indicator.item(secondIndex).removeAttribute('id');
        indicator.item(thirdIndex).setAttribute('id', 'active');
      }

      sliderList.addEventListener("transitionend", function(){
        if(counter == sliderItem.length - 1){
          sliderList.style.transition = "none";
          nextBtn.style.display = "none";
        }
      })
    });

    prevBtn.addEventListener('click', function() {
      if(counter == sliderItem.length - sliderItem.length) return;
      nextBtn.style.display = "block";
      sliderList.style.transition = ".5s";
      counter --;
      sliderList.style.transform = "translateX("+ (- width * counter) + "px)";
      if(counter == sliderItem.length - 2){
        indicator.item(thirdIndex).removeAttribute('id');
        indicator.item(secondIndex).setAttribute('id', 'active');
      } else if (counter == sliderItem.length - sliderItem.length){
        indicator.item(secondIndex).removeAttribute('id');
        indicator.item(firstIndex).setAttribute('id','active');
      }

      sliderList.addEventListener("transitionend", function(){
        if(counter == sliderItem.length - sliderItem.length){
          sliderList.style.transition = "none";
          prevBtn.style.display = "none";
        }
      })
    });
  };

  slider();

});