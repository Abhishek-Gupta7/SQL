const { sequelize } = require("../Model/users.js");
const db = require("../db/dbAccess.js");
const user = db.users;
const Profile = require("../Model/profile.js");

 
exports.insertUser = async (req,res) => {
try {
    console.log("Body",req.body);
    let {firstName , lastName , age , bio} = req.body;
    let userResult = await user.create({
        firstName,
        lastName,
        age
    });
    let profile = await Profile.create({user_id:userResult.user_id,bio});
    console.log(profile);
    res.status(200).send(profile);
} catch (error) {
    console.log(error);
    res.status(500).send(error.message);
}
};

exports.getAllUser = async (req,res) => {
try {
    const [result,metaData] = await sequelize.query("Select * from users;");
    console.log(result);
    res.status(200).send(result);
} catch (error) {
    console.log(error);
    res.status(500).send(error.message);                
}
}

exports.getUserById = async (req,res) => {
try {
    let {user_id} = req.body;
    let userResult = await user.findOne({
        where:{user_id},
        attributes:{exclude:['createdAt','updatedAt']}
    });
    console.log("User: ",userResult);
    let profileResult = await userResult.get();
    res.status(200).send(profileResult);
} catch (error) {
    console.log(error);
    res.status(500).send(error.message);
}
}
exports.deleteUser = async (req,res) => {
try {
    let {user_id} = req.body;
    let userResult = await user.destroy({where:{user_id}});
    console.log("delete : ",userResult);
    res.sendStatus(200).send(userResult);
} catch (error) {
    console.log(error);
    res.status(500).send(error.message);
}
}
