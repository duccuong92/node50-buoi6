import demoService from "../services/demo.service.js";

const demoController = {
  query: (request, response, next) => {
    console.log(request.query);
    // Đưa qua demo.service.js
    // const { page, pageSize, timKiem } = request.query;
    // console.log({ page, pageSize, timKiem });

    const result = demoService.query();

    response.json(result);
  },
  helloWorld: (request, response, next) => {
    const result = demoService.helloWorld();
    response.json(result);
  },
  checkServer: (request, response, next) => {
    const result = demoService.checkServer();
    response.json(result);
  },
  param: (req, res, next) => {
    const result = demoService.param(req);

    res.json(result);
  },
  headers: (req, res, next) => {
    const result = demoService.headers(req);
    res.json(result);
  },
  body: (req, res, next) => {
    const result = demoService.body(req);
    res.json(result);
  },
  mysql2: async (req, res, next) => {
    const result = await demoService.mysql2(req, res, next);

    res.json(result);
  },
  sequelize: async (req, res, next) => {
    
    const result = await demoService.sequelize(req, res, next);
  
    res.json(result);
  }
};

export default demoController;
