CREATE DATABASE catalog;

CREATE TABLE Authors (
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR (50),
    last_name VARCHAR (50),
    PRIMARY KEY (id)
);

CREATE TABLE Games (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR (50),
    publish_date DATE,
    multiplayer BOOLEAN,
    last_played_at DATE,
    archived BOOLEAN,
    author_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES Authors(id)
);
