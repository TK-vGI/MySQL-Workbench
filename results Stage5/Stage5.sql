USE freeart;
SELECT
    a.artist_id, a.first_name, a.last_name,
    RANK() OVER (ORDER BY COUNT(w.artwork_id) DESC) AS artist_rank,
	COUNT(w.artwork_id) AS total_artworks
FROM artist a
LEFT JOIN artwork w
    ON a.artist_id = w.artist_id
GROUP BY a.artist_id, a.last_name
ORDER BY artist_rank, a.last_name;