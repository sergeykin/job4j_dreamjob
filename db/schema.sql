CREATE TABLE post (
                      id SERIAL PRIMARY KEY,
                      name TEXT
);

CREATE TABLE candidate (
                      id SERIAL PRIMARY KEY,
                      name TEXT
);

CREATE TABLE users (
                         id SERIAL PRIMARY KEY,
                         name TEXT,
                         email TEXT,
                         password TEXT

  );

CREATE TABLE city (
                       id SERIAL PRIMARY KEY,
                       name TEXT
);