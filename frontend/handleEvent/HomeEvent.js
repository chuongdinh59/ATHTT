import getElement from "../utils/queryElement";

const HomeEvent = {
  onClickProduct() {
    console.log("HOME EVENT");
  },
};

const header = getElement(".header");

header.addEventListener("click", HomeEvent.onClickProduct);
