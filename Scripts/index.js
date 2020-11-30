console.log("js loaded");
var projects = document.getElementsByClassName("project-image-holder");
var scrollLine = document.getElementById("scrollLine");
var hero = document.getElementById("hero");

function setProjectUI(width) {
  if (width <= 1200) {
    for (var i = 0; i < projects.length; i++) {
      if (projects[i].classList.contains("odd")) {
        let project = projects[i];
        project.classList.remove("odd");
      }
    }
  } else {
    for (var i = 0; i < projects.length; i++) {
      if (i % 2 != 0) {
        projects[i].classList.add("odd");
      }
    }
  }
}

function setUI() {
  var w = document.documentElement.clientWidth;
  setProjectUI(w);
}

function updateScrollLine() {
  var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
  var height =
    document.documentElement.scrollHeight -
    document.documentElement.clientHeight;
  var scrolled = (winScroll / height) * 100;

  console.log(scrolled);
  if (scrolled > ((hero.clientHeight - 8) / height) * 100) {
    scrollLine.classList.remove("solid");
    scrollLine.classList.add("gradient");
  } else {
    scrollLine.classList.add("solid");
    scrollLine.classList.remove("gradient");
  }
  scrollLine.style.width = scrolled + "%";
}

window.addEventListener("resize", setUI);
window.onscroll = function() {
  updateScrollLine();
};

setUI();
