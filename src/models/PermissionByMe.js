


// SEQUELIZE (ORM) Tương tác với database - Làm sẵn các hàm

import { DataTypes } from "sequelize";
import sequelize from "../common/sequelize/connect.sequelize.js";


const Permissions = sequelize.define(
    "Permissions",
    {
      // Model attributes are defined here
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      name: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      endpoint: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      method: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      module: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      deleteBy: {
        type: DataTypes.INTEGER,
        allowNull: false,
        defaultValue: 0,
      },
      isDeleted: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
        defaultValue: false,
      },
      deletedAt: {
        type: "TIMESTAMP",
        allowNull: true,
        defaultValue: null,
      },
      createdAt: {
        type: "TIMESTAMP",
        allowNull: false,
        defaultValue: sequelize.literal("CURRENT_TIMESTAMP"),
      },
      updatedAt: {
        type: "TIMESTAMP",
        allowNull: false,
        defaultValue: sequelize.literal(
          "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"
        ),
      },
    },
    {
      tableName: "Permissions",
      timestamp: false,
    }
  );
  
  // CODE FIRST - TẠO BẢNG TRONG DATABASE // NẾU CÓ RỒI KHÔNG CÓ GÌ XẢY RA
  Permissions.sync({ alter: true });

export default Permissions;