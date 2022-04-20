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

CREATE TABLE genres (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE music_albums (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    publish_date DATE NOT NULL,
    archived BOOLEAN,
    on_spotify BOOLEAN NOT NULL,
    genre_id INT,
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);
