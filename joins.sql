-- all fields from users
SELECT
  *
FROM
  users;

-- all fields from posts (user_id=100)

SELECT
  *
FROM
  posts
WHERE
  user_id = 100;

-- posts + name (user_id=200)

SELECT
  posts.*,
  users.first_name,
  users.last_name
FROM
  posts
  INNER JOIN users ON users.id = posts.user_id
WHERE
  posts.user_id = 200;

-- posts + username (w name filter)

SELECT
  posts.*,
  users.username
FROM
  posts
  INNER JOIN users ON users.id = posts.user_id
WHERE
  users.first_name = 'Norene'
  AND users.last_name = 'Schmitt';

-- users (post creation filter)

SELECT DISTINCT
  users.username
FROM
  users
  INNER JOIN posts ON posts.user_id = users.id
WHERE
  posts.created_at > '01/01/2015';

-- posts + username (user joined filter)

SELECT
  posts.title,
  posts.content,
  users.username
FROM
  posts
  INNER JOIN users ON users.id = posts.user_id
WHERE
  users.created_at < '01/01/2015';

--# 7

SELECT
  comments.*,
  posts.title "Post Title"
FROM
  comments
  INNER JOIN posts ON posts.id = comments.post_id;

--# 8

SELECT
  posts.title post_title,
  posts.url post_url,
  comments.body comment_body
FROM
  comments
  INNER JOIN posts ON posts.id = comments.post_id
WHERE
  posts.created_at < '01/01/2015';

--# 9

SELECT
  posts.title post_title,
  posts.url post_url,
  comments.body comment_body
FROM
  comments
  INNER JOIN posts ON posts.id = comments.post_id
WHERE
  posts.created_at > '01/01/2015';

--# 10

SELECT
  posts.title post_title,
  posts.url post_url,
  comments.body comment_body
FROM
  comments
  INNER JOIN posts ON posts.id = comments.post_id
WHERE
  comments.body LIKE '%USB%';

--# 11

SELECT
  posts.title post_title,
  users.first_name,
  users.last_name,
  comments.body comment_body
FROM
  posts
  INNER JOIN comments ON comments.post_id = posts.id
  INNER JOIN users ON users.id = posts.user_id
WHERE
  comments.body LIKE '%matrix%';

-- #12

SELECT
  users.first_name,
  users.last_name,
  comments.body comment_body
FROM
  comments
  INNER JOIN posts ON posts.id = comments.post_id
  INNER JOIN users ON users.id = comments.user_id
WHERE
  comments.body LIKE '%SSL%'
  AND posts.content LIKE '%dolorum%';

-- #13

SELECT
  posts.user_id post_userId,
  comments.user_id comment_userId,
  up.first_name post_author_first_name,
  up.last_name post_author_last_name,
  posts.title post_title,
  uc.username comment_author_username,
  comments.body comment_body
FROM
  posts
  INNER JOIN users up ON up.id = posts.user_id
  INNER JOIN comments ON comments.post_id = posts.id
  INNER JOIN users uc ON uc.id = comments.user_id
WHERE (comments.body LIKE '%SSL%'
  OR comments.body LIKE '%firewall%')
AND posts.content LIKE '%nemo%';

-- bonus #1

SELECT
  COUNT(comments.id) comment_count
FROM
  comments
  INNER JOIN posts ON posts.id = comments.post_id
WHERE
  posts.created_at > '07/14/2015';

-- bonus #2

SELECT DISTINCT
  users.username
FROM
  users
  INNER JOIN comments ON comments.user_id = users.id
WHERE
  comments.body LIKE '%programming%';

