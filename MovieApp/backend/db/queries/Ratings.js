const { db } = require("./connections");

const createRating = (req, res, next) => {
  let movieId = req.params.id
  db.none('INSERT INTO ratings (stars, movie_id) VALUES (${stars}, ${movie_id})',
{stars: req.body.stars, movie_id: movieId})
.then(data => {
  res.status(200).json({
    message: "Thanks for your rating"
  })
})
.catch(err => {
  return next(err);
});
}


module.exports = {
  createRating
}
