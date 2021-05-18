console.log("js loaded");
var projects = document.getElementsByClassName("project-image-holder");
var scrollLine = document.getElementById("scrollLine");
var hero = document.getElementById("hero");
var moreSkills = document.getElementById("moreSkills");
var showMoreBtn = document.getElementById("show-more-button");

const root = document.documentElement;
const marqueeElementsDisplayed = getComputedStyle(root).getPropertyValue(
  "--marquee-elements-displayed"
);
const marqueeContent = document.querySelector("ul.marquee-content");

root.style.setProperty("--marquee-elements", marqueeContent.children.length);

for (let i = 0; i < marqueeElementsDisplayed; i++) {
  marqueeContent.appendChild(marqueeContent.children[i].cloneNode(true));
}

function moreSkillsTapped() {
  if (moreSkills.classList.contains("hidden")) {
    moreSkills.classList.remove("hidden");
    moreSkills.classList.add("shown");
    moreSkills.classList.add("scale-up-top");
    showMoreBtn.innerHTML = "Hide";
  } else {
    moreSkills.classList.remove("shown");
    moreSkills.classList.remove("scale-up-top");
    moreSkills.classList.add("hidden");
    showMoreBtn.innerHTML = "Show more";
  }
}

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
window.onscroll = function () {
  updateScrollLine();
};

setUI();
