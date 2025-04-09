import pool from "../common/mysql2/pool.mysql2.js";
import { models } from "../common/sequelize/connect.sequelize.js";
import Permissions from "../models/PermissionByMe.js";

const demoService = {
  query: () => {
    const { page, pageSize, timKiem } = request.query;
    console.log({ page, pageSize, timKiem });
    return `đây là api demo nhận dữ liệu từ query`;
  },
  helloWorld: () => {
    return `hello world`;
  },
  checkServer: () => {
    return `check-server`;
  },
  param: (req, res, next) => {
    console.log({ params: req.param });
    const { id } = req.params;
    return `đây là api demo nhận dữ liệu từ param`;
  },
  headers: (req, res, next) => {
    console.log({ headers: req.headers });
    return `đây là api demo nhận dữ liệu từ headers`;
  },
  body: (req, res, next) => {
    console.log({ body: req.body });
    return `đây là api demo nhận dữ liệu từ body`;
  },
  mysql2: async (req, res, next) => {
    const [rows, fields] = await pool.query("SELECT * FROM `Users`");
    console.log({rows, fields});

    return rows;
  },
  sequelize: async (req, res, next) => {
    const permissions = await Permissions.findAll({ raw: true });
    console.log({ permissions });
  
    // Sử dụng model do sequelize tạo ra (DATABASE FIRST)
    const users = await models.Users.findAll({ raw: true });

    return { users, permissions };
  }

};

export default demoService;
