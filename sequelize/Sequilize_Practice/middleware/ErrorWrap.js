const { validationResult, body } = require("express-validator");



exports.validateBody = 
[
    body('firstName').notEmpty().isAlpha().isLength({min:2,max:10}).escape().withMessage('first name is required'),
    body('lastName').notEmpty().isAlpha().isLength({min:3,max:10}).escape().withMessage('last name is required'),
    body('email').isEmail().escape().withMessage('E-mail  is required'),
    body('age').isNumeric().escape().withMessage('only number is allowed'),
];

exports.validOperation = async (req,res,next) =>{
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        next(errors);
        return res.status(400).json({ errors: errors.array() });
    } else {
        console.log("Valid");
        return res.status(200).json({ status:"pass",errors: errors.array() });
    }
}