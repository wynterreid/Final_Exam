var express = require('express');
var router = express.Router();
const {getMoviesWithRatings, getAllMoviesByGenre, getAllInfoOnMovies, getAllInfoForSingleMovie} = require('../db/queries/Movies.js')

router.get('/', getAllInfoOnMovies)
router.get ('/genre/:id', getAllMoviesByGenre)
router.get('/ratings/:id', getMoviesWithRatings)
router.get('/allInfo/:id', getAllInfoForSingleMovie)


module.exports = router;
