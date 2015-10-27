-- DROP TABLE IF EXISTS users CASCADE;
-- DROP TABLE IF EXISTS posts CASCADE;
-- DROP TABLE IF EXISTS comments CASCADE;

CREATE TABLE users (
id serial PRIMARY KEY,
username CHARACTER varying(90),
first_name CHARACTER varying(90) DEFAULT NULL,
last_name CHARACTER varying(90) DEFAULT NULL,
created_at timestamp with time zone,
updated_at timestamp with time zone
);

CREATE TABLE posts (
id serial PRIMARY KEY,
title CHARACTER varying(180) DEFAULT NULL,
url CHARACTER varying(510) DEFAULT NULL,
content TEXT DEFAULT NULL,
created_at timestamp with time zone,
updated_at timestamp with time zone,

users_id INTEGER REFERENCES users(id) NOT NULL
);

CREATE TABLE comments (
id serial PRIMARY KEY,
body CHARACTER varying(510) DEFAULT NULL,
created_at timestamp with time zone,
updated_at timestamp with time zone,

users_id INTEGER REFERENCES users(id) NOT NULL,
posts_id INTEGER REFERENCES posts(id) NOT NULL
);

--\i scripts/blog_data.sql

-- Create a query to get all fields from the users table
--SELECT * FROM users;

-- Create a query to get all fields from the posts table where the user_id is 100
-- SELECT *
-- FROM posts
-- WHERE users_id = 100;

-- Create a query to get all posts fields, the user's first name, and the user's last name, from the posts table where the user's id is 200
-- SELECT first_name, last_name, posts.*
-- FROM posts
-- INNER JOIN users
-- ON users_id = users.id
-- WHERE users_id = 200;

-- Create a query to get all posts fields, and the user's username, from the posts table where the user's first name is 'Norene' and the user's last_name is 'Schmitt'
-- SELECT posts.*, username
-- FROM posts
-- INNER JOIN users
-- ON users_id = users.id
-- WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';

-- Create a query to get usernames from the users table where the user has created a post after January 1, 2015
-- SELECT username
-- FROM users
-- INNER JOIN posts
-- ON posts.users_id = users.id
-- WHERE posts.created_at > '2015-01-01';

-- Create a query to get the post title, post content, and user's username where the user who created the post joined before January 1, 2015
-- SELECT title, content, users.username
-- FROM posts
-- INNER JOIN users
-- ON users_id = users.id
-- WHERE posts.created_at < '2015-01-01';

-- Create a query to get the all rows in the comments table, showing post title (aliased as 'Post Title'), and the all the comment's fields
-- SELECT comments.*, title AS "Post Title"
-- FROM comments
-- INNER JOIN posts
-- ON posts_id = posts.id;

-- Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created before January 1, 2015
-- SELECT title AS "post_title", url AS "post_url", body AS "comment_body"
-- FROM comments
-- INNER JOIN posts
-- ON posts_id = posts.id
-- WHERE posts.created_at < '2015-01-01';

-- Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created after January 1, 2015
-- SELECT body AS "comment_body", title AS "post_title", url AS "post_url"
-- FROM comments
-- INNER JOIN posts
-- ON posts_id = posts.id
-- WHERE posts.created_at > '2015-01-01';

-- Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the comment body contains the word 'USB'
-- SELECT title AS "post_title", url AS "post_url", body AS "comment_body"
-- FROM comments
-- INNER JOIN posts
-- ON posts.id = posts_id
-- WHERE body LIKE '%USB%';

-- Create a query to get the post title (aliased as post_title), first name of the author of the post, last name of the author of the post, and comment body (aliased to comment_body), where the comment body contains the word 'matrix' ( should have 855 results )
-- SELECT title AS "post_title", first_name, last_name, body
-- FROM posts
-- INNER JOIN comments
-- ON posts.id = posts_id
-- INNER JOIN users
-- ON users.id = posts.users_id
-- WHERE body LIKE '%matrix%';

-- Create a query to get the first name of the author of the comment, last name of the author of the comment, and comment body (aliased to comment_body), where the comment body contains the word 'SSL' and the post content contains the word 'dolorum' ( should have 102 results )


-- Create a query to get the first name of the author of the post (aliased to post_author_first_name), last name of the author of the post (aliased to post_author_last_name), the post title (aliased to post_title), username of the author of the comment (aliased to comment_author_username), and comment body (aliased to comment_body), where the comment body contains the word 'SSL' or 'firewall' and the post content contains the word 'nemo' ( should have 197 results )