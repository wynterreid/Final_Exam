var express = require('express');
var router = express.Router();
const {createComment} = require('../db/queries/Comments.js')

router.post('/new/:id', createComment)



module.exports = router;
