require('dotenv').config();

const express = require('express');
const port = process.env.PORT;
const app = express();

require('./routes').route(app)

app.listen(port, () => {
    console.log(`[server]: Truckrs Back Server is running at https://localhost:${port}`);
});

require('./sequelize').initDb()
