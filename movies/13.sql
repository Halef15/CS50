SELECT DISTINCT p.name
FROM people p
JOIN stars s1 ON p.id = s1.person_id
JOIN movies m ON s1.movie_id = m.id
JOIN stars s2 ON m.id = s2.movie_id
JOIN people kevin ON s2.person_id = kevin.id
WHERE kevin.name = 'Kevin Bacon' AND kevin.birth = 1958 AND p.name != 'Kevin Bacon';
