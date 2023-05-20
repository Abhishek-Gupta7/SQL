const { Model, DataTypes, where } = require('sequelize');
const zlib =  require('zlib');
const sequelize = require('../db/index');
const Users = require('./users');
const { type } = require('os');
const { Sequelize } = require('../db/dbAccess');


class Profile extends Model{

    static associations(){

    }
}

Profile.init({
    profile_id:{
        type:DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true
    },
    full_name:{
        type:DataTypes.VIRTUAL,
        get(){
            return `${this.bio} ${this.discription}`
        }
    },
    bio:{
        type:DataTypes.STRING,
        allowNull:false
    },
    discription : {
        type:DataTypes.STRING,
        set(value) {
            let compressedValue = zlib.deflateSync(value).toString('base64');
            this.setDataValue('discription',compressedValue)
        },
        get() {
            let value = this.getDataValue('discription');
            let unCompressed = zlib.inflateSync(Buffer.from(value,'base64'));
            return unCompressed.toString();
        }
    },
    userid:{
        type:DataTypes.INTEGER
    }
},{
    sequelize,
    modelName:'profiles'
});

module.exports = Profile;

Profile.sync({alter:true})
    .then(async() =>{
         //let result  = await sequelize.query("select * from profiles;",{type:sequelize.QueryTypes.SELECT});
        // console.log(result);
        // let result = await Profile.create({
        //     bio:'I am dancer',
        //     discription :'I love to dance',
        //     userid:6
        // });
        // // let profile = await Profile.findOne();
        // return result.full_name;
    }) 
    .then((data) => { 
        // console.log(data);
    })
    .catch((error) => {
        console.log("\n\nProfile Error : ",error.message);
})
