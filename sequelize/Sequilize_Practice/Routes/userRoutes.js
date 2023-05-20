const express = require('express');
const router = express.Router();
const controller = require('../Controller/usersController');
const validate = require('../middleware/ErrorWrap.js');
router.post('/insertUser',validate.validateBody,controller.insertUser);

router.get('/getAllUser',controller.getAllUser);

router.get('/getUserById',controller.getUserById);

router.delete('/deleteUser',controller.deleteUser);

module.exports = router;

