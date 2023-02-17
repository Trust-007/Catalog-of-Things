CREATE TABLE items(
  id SERIAL PRIMARY KEY,
  genre JSONB,
  author JSONB,
  source JSONB,
  label JSONB,
  publish_date DATE,
  archived BOOLEAN DEFAULT FALSE
);

CREATE TABLE books(
  publisher VARCHAR(250),
  cover_state VARCHAR(250),
  item_id INTEGER REFERENCES items(id)
);


CREATE TABLE label(
  id SERIAL PRIMARY KEY,
  title VARCHAR(250),
  color VARCHAR(250),
  items jsonb[],
  item_id INTEGER REFERENCES items(id)
);



