
USE freeart;
WITH keyword AS (
	SELECT awk.artwork_id, COUNT(kw.keyword) as kw_count
	FROM artwork_keyword awk
	JOIN keyword kw ON kw.keyword_id = awk.keyword_id
GROUP BY awk.artwork_id
ORDER BY awk.artwork_id
)
SELECT AVG(kw_count) as avg_keywords
FROM artwork as aw
JOIN artist as a ON a.artist_id = aw.artist_id
JOIN keyword as k ON k.artwork_id = aw.artwork_id
WHERE a.nationality = 'Dutch';