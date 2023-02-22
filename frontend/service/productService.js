import fetchApi from "../utils/callAPI";
const productService = {
  getProduct() {
    fetchApi("https://example.com/api/data")
      .then((response) => {
        // Xử lý dữ liệu trả về
      })
      .catch((error) => {
        // Xử lý lỗi
      });
  },
};

// Example

// import fetchApi from "./fetchApi";

// // Gửi yêu cầu GET đến API
// fetchApi("https://example.com/api/data")
//   .then((response) => {
//     // Xử lý dữ liệu trả về
//   })
//   .catch((error) => {
//     // Xử lý lỗi
//   });

// // Gửi yêu cầu POST đến API với dữ liệu
// fetchApi("https://example.com/api/data", "POST", {
//   name: "John Doe",
//   email: "john.doe@example.com",
// })
//   .then((response) => {
//     // Xử lý dữ liệu trả về
//   })
//   .catch((error) => {
//     // Xử lý lỗi
//   });
