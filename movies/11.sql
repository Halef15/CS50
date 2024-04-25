WITH RankedMovies AS (
  SELECT
    m.title,
    RANK() OVER (ORDER BY r.rating DESC) AS MovieRank
  FROM
    movies m
    JOIN stars s ON m.id = s.movie_id
    JOIN people p ON s.person_id = p.id
    JOIN ratings r ON m.id = r.movie_id
  WHERE
    p.name = 'Chadwick Boseman'
)
SELECT
  title
FROM
  RankedMovies
WHERE
  MovieRank <= 5
ORDER BY
  MovieRank
LIMIT 5;