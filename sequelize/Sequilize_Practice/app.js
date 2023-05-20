require('custom-env').env(true);
// // require('./db/dbAccess');
const Users = require('./Model/users');
// const path = require('path')
const morgan = require('morgan');
const express = require('express');
const app = express();
app.use(express.json());

// const userRoutes = require('./Routes/userRoutes');

let Port = process.env.Server_Port || 7070;
app.listen(Port,() => console.log(`Server Listening on ${Port}..`))

// if (app.get('env') === 'development') {
//     app.use(morgan('tiny'));
//     console.log("Morgan Enabled..");
// }

// app.use('/users',userRoutes);
// // app.use('/',(req,res) => {
// //     res.send("Home Page..")
// // });

// const error1 = require('./middleware/ErrorWrap');
// app.post('/',error1.validateBody,error1.validOperation,async(err,req,res,next) =>{
//     if (err) console.log(err);
// })




