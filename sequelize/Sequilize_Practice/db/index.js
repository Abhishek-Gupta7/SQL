const {Sequelize} = require('sequelize');
// const Users = require('./users');

const sequelizeConn = new Sequelize(
    process.env.DATABASE_NAME,
    process.env.DATABASE_USERNAME,
    process.env.DATABASE_PASSWORD,{
        host :"localhost",
        dialect :"postgres",
        logging:false
    });

try {
    sequelizeConn.authenticate();
    console.log("DataBase Connection Successful!");
} catch (error) {
    console.log("Connection Fail : ",error.message);
}

module.exports = sequelizeConn;

