const { db } = require("./connections");


const getAllMoviesByGenre = (req, res, next) => {
  let genreId = req.params.id
  db.any ('SELECT * FROM Movies JOIN Genres ON Genres.id = Movies.genre_id WHERE Genres.id=$1', [genreId])
    .then(data => {
      res.status(200).json({
        data: data
      })
    })
    .catch(err => {
      return next(err);
    });
}

const getMoviesWithRatings = (req, res, next) => {
  let movieId = req.params.id
  db.any ('SELECT * FROM Movies JOIN Ratings ON Ratings.movie_id = Movies.id WHERE Movies.id=$1', [movieId])
  .then(data => {
    res.status(200).json({
      data:data
    })
  })
  .catch(err => {
    return next(err);
  });
}

const getAllInfoForSingleMovie = (req, res,next) => {
  let movieId = req.params.id
  let infoForMovie = {}
  db.one('SELECT * FROM Movies WHERE movies.id=$1', [movieId])
   .then((movie) => {
     infoForMovie = {...movie}
      db.any('SELECT comments.body FROM Comments WHERE comments.movie_id=$1', [movieId])
        .then((comments) => {
          infoForMovie = {...infoForMovie, comments: comments}
           db.one('SELECT ROUND(AVG(ratings.stars),2) FROM Ratings WHERE ratings.movie_id=$1', [movieId])
            .then((rating) => {
              infoForMovie = {...infoForMovie, rating:rating.round}
                db.one('SELECT genre.name FROM Genres JOIN Movies ON Movies.genre_id = Genres.id WHERE movies.id=$1', [movieId])
                  .then((genre) => {
                    infoForMovie = {...infoForMovie, genre: genre}
                      res.status(200).json({
                        data:infoForMovie
                      })
                  })
              })
          })
          .catch(err => {
            return next(err);
        });
      })
  }

  const getAllInfoOnMovies = (req, res,next) => {
      db.any('SELECT movies.id, movies.title, movies.img_url, genres.name, ROUND(AVG(ratings.stars),2) FROM Movies JOIN Genres ON Genres.id = Movies.genre_id JOIN Ratings ON Ratings.movie_id = Movies.id JOIN Comments ON Comments.movie_id = Movies.id')
      .then(data => {
        res.status(200).json({
          data:data
        })
      })
      .catch(err => {
        return next(err);
      });
    }



module.exports = {
  getMoviesWithRatings,
  getAllMoviesByGenre,
  getAllInfoOnMovies,
  getAllInfoForSingleMovie
}
