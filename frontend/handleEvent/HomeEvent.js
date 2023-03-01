import getElement from "../utils/queryElement.js";
import productService from "../service/productService.js";
const HomeEvent = {
  onClickProduct() {
    productService.getProductById(4);
    // console.log("VV");
  },
};

const header = getElement(".header");

header.addEventListener("click", HomeEvent.onClickProduct);
