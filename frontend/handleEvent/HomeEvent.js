const HomeEvent = {
  onClickProduct() {
    console.log("HOME EVENT");
  },
};

const header = document.querySelector(".header");

header.addEventListener("click", HomeEvent.onClickProduct);
