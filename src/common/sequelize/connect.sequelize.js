import { Sequelize } from 'sequelize';
import initModels from "../../models/init-models.js";
import "dotenv/config";
import { DATABASE } from '../../common/constant/app.constant.js';


const sequelize = new Sequelize(DATABASE, {logging: false}) // Example for postgres
export const models = initModels(sequelize);

try {
    await sequelize.authenticate();
    console.log('Connection has been established successfully.');
  } catch (error) {
    console.error('Unable to connect to the database:', error);
  }


  export default sequelize;