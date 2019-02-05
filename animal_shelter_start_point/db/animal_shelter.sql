DROP TABLE IF EXISTS adoptions;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS animals;


CREATE TABLE owners (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE animals (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  breed VARCHAR(255),
  age VARCHAR(255),
  status VARCHAR(255),
  owner_id INT4,
  admission_date VARCHAR(255),
  description VARCHAR(255),
  url VARCHAR(255)
);

CREATE TABLE adoptions (
  id SERIAL4 PRIMARY KEY,
  animal_id INT4 REFERENCES animals(id) ON DELETE CASCADE,
  owner_id INT4 REFERENCES owners(id) ON DELETE CASCADE
);
