DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS animals;

CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  pet VARCHAR(255),
  animal_id INT REFERENCES animals(id) ON DELETE CASCADE
);

CREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  breed VARCHAR(255),
  age VARCHAR(255),
  status VARCHAR(255),
  owner VARCHAR(255),
  admission_date VARCHAR(255),
  owner_id INT REFERENCES owners(id) ON DELETE CASCADE
);
