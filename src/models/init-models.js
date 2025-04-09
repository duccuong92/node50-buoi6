import { DataTypes } from "sequelize";
import _Permissions from "./Permissions.js";
import _Roles from "./Roles.js";
import _Users from "./Users.js";

export default function initModels(sequelize) {
  const Permissions = _Permissions(sequelize, DataTypes);
  const Roles = _Roles(sequelize, DataTypes);
  const Users = _Users(sequelize, DataTypes);

  Users.belongsTo(Roles, { as: "role", foreignKey: "roleId" });
  Roles.hasMany(Users, { as: "Users", foreignKey: "roleId" });

  return {
    Permissions,
    Roles,
    Users,
  };
}
