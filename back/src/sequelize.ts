import * as process from "process";

const {Sequelize} = require('sequelize');

const sequelizeInit = () => {

    return new Sequelize(process.env.DB_NAME, process.env.DB_USERNAME, process.env.DB_PASSWORD, {
        logging: console.log,
        host: process.env.DB_HOST,
        port: process.env.DB_PORT,
        dialect: process.env.DB_DIALECT
    })
}

const sequelizeInstance = sequelizeInit()

exports.sequelize = sequelizeInstance

exports.initDb = async () => {
    try {
        await sequelizeInstance.authenticate();
        console.log('Connection has been established successfully.');

    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }
}