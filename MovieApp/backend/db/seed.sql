DROP DATABASE IF EXISTS movie_list;
CREATE DATABASE movie_list;

\c movie_list;


DROP TABLE IF EXISTS Genres;
DROP TABLE IF EXISTS Movies;
DROP TABLE IF EXISTS Ratings;
DROP TABLE IF EXISTS Comments;

CREATE TABLE Genres (
 id SERIAL PRIMARY KEY,
 name VARCHAR NOT NULL
);

CREATE TABLE Movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR NOT NULL,
  genre_id INT REFERENCES Genres(id) ,
  img_url VARCHAR NOT NULL
);


CREATE TABLE Ratings (
  id SERIAL PRIMARY KEY,
  stars INT,
  movie_id INT REFERENCES Movies(id)
);

CREATE TABLE Comments (
  id SERIAL PRIMARY KEY,
  body VARCHAR,
  movie_id INT REFERENCES Movies(id)
);

INSERT INTO Genres (name) VALUES ('Comedy');
INSERT INTO Genres (name) VALUES ('Drama');
INSERT INTO Genres (name) VALUES ('Horror');
INSERT INTO Genres (name) VALUES ('Fantasy');
INSERT INTO Genres (name) VALUES ('Thiller');
INSERT INTO Genres (name) VALUES ('Adventure');

INSERT INTO Movies (title, genre_id, img_url) VALUES ('Mean Girls',2,'https://www.dvdplanetstore.pk/wp-content/uploads/2014/07/Mean-Girls-2004dvdplanetstorepk.jpg');
INSERT INTO Movies (title, genre_id, img_url) VALUES ('Jumanji',6,'https://image.tmdb.org/t/p/original/inong8C18HmwnKqhzAyPBlOYeLU.jpg');
INSERT INTO Movies (title, genre_id, img_url) VALUES ('Friday',1,'http://atlantablackstar.com/wp-content/uploads/2013/11/friday-movie-poster.jpg');
INSERT INTO Movies (title, genre_id, img_url) VALUES ('Back to the Future',6,'http://cdn.collider.com/wp-content/uploads/back_to_the_future_poster_01.jpg');
INSERT INTO Movies (title, genre_id, img_url) VALUES ('White Chicks',1,'http://resizing.flixster.com/vtt4fmSFGGp9y6um_T9IzOgvdFQ=/800x1200/dkpu1ddg7pbsk.cloudfront.net/movie/11/16/98/11169876_ori.jpg');
INSERT INTO Movies (title, genre_id, img_url) VALUES ('Diary of a Mad Black Woman',2,'https://bkblack28.files.wordpress.com/2014/03/diary-of-a-mad-black-woman.jpg');
INSERT INTO Movies (title, genre_id, img_url) VALUES ('Like Mike',4,'http://static.rogerebert.com/uploads/movie/movie_poster/like-mike-2002/large_nckBRQRbyqgNVT7aHHxZE7BJRDC.jpg');
INSERT INTO Movies (title, genre_id, img_url) VALUES ('Paranormal Activity', 3,'http://www.dvdplanetstore.pk/wp-content/uploads/2014/02/Paranormal-Activity.jpg');
INSERT INTO Movies (title, genre_id, img_url) VALUES ('Carrie',3,'https://zuts.files.wordpress.com/2013/08/carrie-1976-poster.jpg');
INSERT INTO Movies (title, genre_id, img_url) VALUES ('Taken',5,'http://static.tvgcdn.net/feed/1/801/thumbs/92392801_1200x1600.jpg');
INSERT INTO Movies (title, genre_id, img_url) VALUES ('Space Jam',4,'http://image.tmdb.org/t/p/original/9c07ypPe17c0FLTUpTusAz567eh.jpg');


INSERT INTO Ratings (stars, movie_id) VALUES (3,1),(2,2),(3,3),(1,4),(2,5),(3,6),(5,7),(4,8),(3,9),(2,10),(5,1),(3,2),(4,3),(4,4),(5,5);
INSERT INTO Ratings (stars,movie_id) VALUES (4,6),(4,7),(3,8),(4,10);

INSERT INTO Comments (body, movie_id) VALUES ('A smart little teen picture that, for a change, actually features recognizable teens.', 1);
INSERT INTO Comments (body, movie_id) VALUES ('MUST SEE WITH KIDS OR NO KIDS !!!!', 2);
INSERT INTO Comments (body, movie_id) VALUES ('Friday has energy, and sass, and the nerve to suggest that the line between tragedy and comedy may be in the bloodshot eye of the beholder.', 3);
INSERT INTO Comments (body, movie_id) VALUES ('This had a slow beginning until the actual good parts started.', 4);
INSERT INTO Comments (body, movie_id) VALUES ('I laughed and cried. Mostly laughed.', 5);
INSERT INTO Comments (body, movie_id) VALUES ('Not as funny as some previous Madea movies but was still really good.', 6);
INSERT INTO Comments (body, movie_id) VALUES ('It illustrates one of my favorite points, that silence and waiting can be more entertaining than frantic fast-cutting and berserk', 7);
INSERT INTO Comments (body, movie_id) VALUES ('Carrie, this is one of my favorite old-school horror movies, because despite the low budget and others, they managed to do a great job, without a doubt the best of Stephen King. And obviously, love the end.', 8);
INSERT INTO Comments (body, movie_id) VALUES ('What an amazing movie everybody loved it!', 9);
INSERT INTO Comments (body, movie_id) VALUES ('Space Jam is, at times, a hoot, especially when it has fun with Michaels less-than-stellar baseball career.', 10);
INSERT INTO Comments (body, movie_id) VALUES ('Like a video game, the narrative lacks any character development, relying on obstacles, chases, and the threat of elimination. ',2);
INSERT INTO Comments (body, movie_id) VALUES ('A great mix of fantasy, humor and drama, with a light tone but not in a ridiculous way and with well built characters you can identify with.',4);
INSERT INTO Comments (body, movie_id) VALUES ('Interesting plot! Madea and Bam are my favorite characters, but all of the funny character are great! Dont stop Tyler Perry!',6);
INSERT INTO Comments (body, movie_id) VALUES ('Half quirky high-school comedy, half harrowing family drama, no adaptations that succeeded it have had the power to produce the shock and horror of the final act of this, the best telling of the story',8);
INSERT INTO Comments (body, movie_id) VALUES ('Friday become a much more superior than others stoner-buddy comedys, not just because have a simple, entertaining, terrible funny screenplay and an unforgettable acting by Chris Tucker. But also for present a surprising, tense and powerful drama. Fresh.',3);
