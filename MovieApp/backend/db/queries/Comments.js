const { db } = require("./connections");

const createComment = (req, res, next) => {
  let movieId = req.params.id
  db.none('INSERT INTO comments (body, movie_id) VALUES (${body}, ${movie_id})',
{body: req.body.body, movie_id: movieId})
.then(data => {
  res.status(200).json({
    message: "Thanks for your comment"
  })
})
.catch(err => {
  return next(err);
});
}


module.exports = {
  createComment
}
