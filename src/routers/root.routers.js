import express from "express";
import demoRouter from "./demo.routers.js";


const rootRouter = express.Router();


rootRouter.use(`/demo`, demoRouter );


export default rootRouter;