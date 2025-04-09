import express from "express";
import demoController from "../controllers/demo.controller.js";

const demoRouter = express.Router();

// http://localhost:3069/demo/check-server
// demoRouter.get("/", demoController.helloWorld);
// Nhận dữ liệu từ Query
demoRouter.get(`/`, demoController.helloWorld);

demoRouter.get(`/check-server`, demoController.checkServer);
// demoRouter.post
// demoRouter.patch
// demoRouter.delete
// Bài tập
// Tạo một API
// Phương thức get
// endpoint: query
// trả lại chữ: "đây là api demo nhận dữ liệu từ query"
// Bài tập
// Sẽ thường sử dụng: phân trang, lọc, search
demoRouter.get(`/query`, demoController.query);
// Bài tập

// Nhận dữ liệu từ Params
// Thường dùng khi: muốn thao tác (sửa, xoá) vào một dữ liệu cụ thể (record, hàng)
demoRouter.put(`/param/:id`, demoController.param);

// Nhận dữ liệu từ headers
// Thường dùng với token, key, api-key
demoRouter.delete(`/headers`, demoController.headers);

// Nhận dữ liệu từ body
demoRouter.post(`/body`, demoController.body);

// kết nối với mysql MYSQL2
// Để tương tác với database
demoRouter.get(`/mysql2`, demoController.mysql2);

demoRouter.get(`/sequelize`, demoController.sequelize);

export default demoRouter;
