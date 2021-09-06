window.onscroll = function () {
  var logoBlock = document.getElementById('logo-block');
  if (logoBlock) {
    if (window.pageYOffset > 400) {
      logoBlock.classList.add("home-banner-fixed");
      logoBlock.classList.remove("home-banner");
    } else {
      logoBlock.classList.add("home-banner");
      logoBlock.classList.remove("home-banner-fixed");
    }
  }
  var scrollButton = document.getElementById('button-scroll');
  if (scrollButton) {
    if (window.pageYOffset > 400) {
      scrollButton.classList.add("button-up");
      scrollButton.classList.remove("button-down");
    } else {
      scrollButton.classList.add("button-down");
      scrollButton.classList.remove("button-up");
    }
  }
}
