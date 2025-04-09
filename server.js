import express from "express";
import sequelize, { models } from "./src/common/sequelize/connect.sequelize.js";
import { DataTypes } from "sequelize";

import rootRouter from "./src/routers/root.routers.js";
import demoRouter from "./src/routers/demo.routers.js";

const app = express();

// Áp dụng middleware
app.use(express.json());

app.use(rootRouter);

app.use(demoRouter);



// DATABASE FIRST - ĐỒNG BỘ TỪ DB VÀO CODE
// sequelize-auto -h <host> -d <database> -u <user> -x [password] -p [port]  --dialect [dialect] -c [/path/to/config] -o [/path/to/models] -t [tableName]
// sequelize-auto -h localhost -d db_cyber_community -u root -x 1234 -p 3307 --dialect mysql -c ./src/config/config.json -o ./src/models -t Permissions
// vào terminal //npx sequelize-auto -h localhost -d db_cyber_community -u root -x 1234 -p 3307 --dialect mysql -o ./src/models
// Để chạy esmodule //npx sequelize-auto -h localhost -d db_cyber_community -u root -x 1234 -p 3307 --dialect mysql -o ./src/models -a ./src/models/additional.json -l esm



app.listen(3069, () => {
  console.log("Server is running on port http://localhost:3069");
});
