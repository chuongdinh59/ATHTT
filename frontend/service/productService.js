import fetchApi from "../utils/callAPI.js";
const productService = {
  getProduct() {
    fetchApi("../JSON/Product.json")
      .then((response) => {
        // Xử lý dữ liệu trả về

        console.log(response);
      })
      .catch((error) => {
        // Xử lý lỗi
      });
  },
  getProductById(id) {
    fetchApi(`http://localhost:8081/api/product/${id}`)
      .then((response) => {
        // Xử lý dữ liệu trả về

        console.log(response);
      })
      .catch((error) => {
        // Xử lý lỗi
      });
  },
};

export default productService;
