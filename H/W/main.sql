CREATE TABLE Posts (
    post_id INT PRIMARY KEY,
    title VARCHAR(255),
    created_at TIMESTAMP
);
CREATE TABLE Votes (
    vote_id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    vote INT,  -- 1 for upvote, 0 for no vote
    FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);
-- Insert posts
INSERT INTO Posts (post_id, title, created_at)
VALUES
    (1, 'Innovations in AI', '2025-04-28 10:00:00'),
    (2, 'Quantum Computing Breakthrough', '2025-04-28 12:00:00'),
    (3, 'New JavaScript Framework Released', '2025-04-29 09:00:00');

-- Insert votes
INSERT INTO Votes (vote_id, post_id, user_id, vote)
VALUES
    (1, 1, 101, 1),
    (2, 1, 102, 1),
    (3, 2, 103, 1),
    (4, 2, 104, 1),
    (5, 3, 105, 1);
SELECT
    p.post_id,
    p.title,
    ((COUNT(v.vote) - 1) / POW((TIMESTAMPDIFF(HOUR, p.created_at, NOW()) + 2), 1.5)) AS score
FROM
    Posts p
JOIN
    Votes v ON p.post_id = v.post_id
WHERE
    v.vote = 1
GROUP BY
    p.post_id
ORDER BY
    score DESC
LIMIT 5;
