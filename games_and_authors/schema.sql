CREATE TABLE Authors (
    id SERIAL PRIMARY KEY,
    last_name VARCHAR(255),
    first_name VARCHAR(255),
); 

CREATE TABLE Games (
    id SERIAL PRIMARY KEY,
    publish_date DATE,
    multiplayer VARCHAR(255),
    last_played_at DATE,
    archived BIT(1)
); 