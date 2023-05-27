let slides = document.querySelectorAll(".slide");
let dots = document.querySelectorAll(".dot");
let slideIndex = -1;

document.getElementById("back").addEventListener("click", carouselDown);
document.getElementById("forth").addEventListener("click", carouselUp);
dots.forEach((dot) => {
  dot.addEventListener("click", carouselDot);
});
window.addEventListener("keydown", carouselKeydown);

function carouselDisplay() {
  // Reset: all slides hidden, all dots inactive
  slides.forEach((slide) => {
    slide.style.opacity = "0";
    slide.style.zIndex = "-1";
  });
  dots.forEach((dot) => {
    dot.classList.remove("active");
  });
  // Display current slide, toggle current dot
  slides[slideIndex].style.zIndex = "1";
  setTimeout(() => {
    slides[slideIndex].style.opacity = "1";
  }, 1);
  dots[slideIndex].classList.add("active");
}

function slideUp() {
  if (slideIndex == slides.length - 1) {
    slideIndex = 0;
  } else {
    slideIndex = slideIndex + 1;
  }
}

function slideDown() {
  if (slideIndex == 0) {
    slideIndex = slides.length - 1;
  } else {
    slideIndex = slideIndex - 1;
  }
}

function carouselUp() {
  slideUp();
  carouselDisplay();
}
setInterval(carouselUp, 7500);

function carouselDown() {
  slideDown();
  carouselDisplay();
}

function carouselDot() {
  slideIndex = Array.from(this.parentNode.children).indexOf(this) - 1;
  carouselDisplay();
}

function carouselKeydown(e) {
  if (e.key == "ArrowLeft") {
    carouselDown();
  } else if (e.key == "ArrowRight") {
    carouselUp();
  } else {
    return;
  }
}

// Setup on page load
carouselUp();
