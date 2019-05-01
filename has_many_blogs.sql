DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS users (
    id serial PRIMARY KEY NOT NULL,
    username varchar(90) NOT NULL,
    first_name varchar(90) DEFAULT NULL,
    last_name varchar(90) DEFAULT NULL,
    created_at timestamp NOT NULL DEFAULT now(),
    updated_at timestamp NOT NULL DEFAULT now()
);

DROP TABLE IF EXISTS posts;

CREATE TABLE IF NOT EXISTS posts (
    id serial PRIMARY KEY NOT NULL,
    title varchar(180) DEFAULT NULL,
    url varchar(510) DEFAULT NULL,
    content text DEFAULT NULL,
    created_at timestamp NOT NULL DEFAULT now(),
    updated_at timestamp NOT NULL DEFAULT now(),
    user_id integer NOT NULL
);

DROP TABLE IF EXISTS comments;

CREATE TABLE IF NOT EXISTS comments (
    id serial PRIMARY KEY NOT NULL,
    body varchar(510) DEFAULT NULL,
    created_at timestamp NOT NULL DEFAULT now(),
    updated_at timestamp NOT NULL DEFAULT now(),
    user_id integer NOT NULL,
    post_id integer NOT NULL
);

