var express = require('express');
var router = express.Router();
const {createRating} = require('../db/queries/Ratings.js')

router.post('/new/:id', createRating)



module.exports = router;
