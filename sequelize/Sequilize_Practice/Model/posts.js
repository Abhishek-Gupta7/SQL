const { Model, DataTypes } = require("sequelize");
const sequelize  = require("../db/index");


class Posts extends Model{
    static associations(){

    }
}

Posts.init({
    post_id :{
        type:DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true
    },
    message:{
        type:DataTypes.STRING
    },
    user_id:{
        type:DataTypes.INTEGER,
    }
},{
    sequelize,
    module:'posts',
    timestamps:false
});

module.exports = Posts;

Posts.sync({alter:true})
    .then(async() => {
        // let result = await Posts.create({
        //     message : "My fourth Posts...."
        // });

        // console.log(result);
    })
    .catch((error) => {
        console.log(error);
    })