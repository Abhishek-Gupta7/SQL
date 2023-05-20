const { Sequelize, DataTypes, Model } = require('sequelize');
const  sequelize = require('../db/index');
const Profile = require('./profile');
const transaction = sequelize.transaction();

class Users extends Model {

    static associations(){
        this.hasOne(Model,{
            foreignKey:'userId',
            sourceKey: 'user_id',
        })
    }
}

    Users.init({
      // Model attributes are defined here
        user_id:{
            type:DataTypes.INTEGER,
            primaryKey:true,
            autoIncrement:true,
        },
        firstName: {
        type: DataTypes.STRING,
        allowNull: false,
        validate:{
            len : {
                args:[2,20],
                msg:"Name Must contain two letters and max 20 letters."
            }
        }
        },
        lastName: {
        type: DataTypes.STRING,
        allowNull:false
        // allowNull defaults to true
        },
        email: {
            type:DataTypes.STRING,
            unique:true,
            allowNull:false,
            validate:{
                isEmail:{
                    msg:"E-Mail is not valid..."
                }
            }
        },
        age:{
            type:DataTypes.INTEGER,
            allowNull:false,
            validate:{
                isNumeric:{
                    msg:"Age must be Integer Number..."
                },
                isOldEnough(value){
                    if (value < 16) {
                        throw new Error("Too young to vote...")
                    }
                }
            }
        }
    }, 
    {
    // Other model options go here
    sequelize, // We need to pass the connection instance
    modelName: 'users', // We need to choose the model name
    validate :{
        nameMatch (){
            if (this.firstName === this.lastName) {
                throw new Error("First and last Name can not be same..")
            }
        }
    },
    paranoid:true
    });

module.exports = Users;
Users.hasOne(Profile,{
    foreignKey:'userid',
    sourceKey: 'user_id',
});

Users.sync({alter:true})
    .then(async() =>{
        // return await sequelize.query("select * from users where email = 'krisna12@gmail.com'")
        // return await sequelize.query("select * from users where email Like :email",
        // {replacements :{email:'kri%'}})
        //  return await Users.create({
        //     firstName:'John',
        //     lastName:'jonny',
        //     email:'john@gmail.com',
        //     age:45
        //  })
        // return Users.destroy({where:{user_id:10}});
        // return Users.findAll({
        //     attributes:{exclude:['createdAt','updatedAt']},
        //     paranoid:false,
        //     include:[{
        //         model:Profile,
        //         attributes:{exclude:['createdAt','userid','updatedAt']}
        //     }],
        //     where:{user_id:6}
        // });
        // return await sequelize.query("select * from users where user_id = :userid",{
        //     replacements:{userid:10}
        // });
        return await Users.findOne({where:{user_id:6}});
    })
    .then((data) => {
        let user = data
        user.getProfile()
        .then((result) => {console.log("Profile : ",result);})
        .catch((err) => {console.log(err);})
    })
    .catch((error) => {
        console.log(`\n\nUser Error : ${error.message}\n\n`);
})





// registerUser => {user_id,username,age,dob,phone}

// bookedtickets => {user_id,book_id,dateOftravel,dateOfReturn,flight_id,classtype};

// flihtInfo => {flight_id,flightname,number}

// distance => {flight_id,flight_id,distance }