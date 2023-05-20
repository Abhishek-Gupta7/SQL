const { Sequelize} = require('sequelize');
const sequelize = require('./index');
const Users = require('../Model/users');
// console.log("db A",sequelize);
const db = {};
db.Sequelize = Sequelize;
db.sequelize = sequelize;
db.users = Users;

db.sequelize.sync({alter:true})
    .then((result) => {console.log("All Table Sync..")})
    .catch((error) => {console.log("Error with Sync :",error)})


module.exports = db;


