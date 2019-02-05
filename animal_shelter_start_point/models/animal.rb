require_relative('./owner.rb')
require_relative('./adoptions.rb')
require_relative('../db/sql_runner')

class Animal

  attr_reader :id
  attr_accessor :name, :type, :breed, :age,
  :status, :owner, :admission_date, :owner_id, :description, :url

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @breed = options['breed']
    @age = options['age']
    @status = options['status']
    @admission_date = options['admission_date']
    @owner_id = options['owner_id'].to_i
    @description = options['description']
    @url = options['url']
  end

  def save()
    sql = "INSERT INTO animals (name, type, breed, age, status,
    admission_date, owner_id, description, url) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
    RETURNING id"
    values = [@name, @type, @breed, @age, @status, @admission_date, @owner_id, @description, @url]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id']
  end

  def update()
    sql = "UPDATE animals SET (name, type, breed, age, status,
    admission_date, owner_id, description, url) = ($1, $2, $3, $4, $5, $6, $7, $8, $9) WHERE id = $10"
    values = [@name, @type, @breed, @age, @status, @admission_date, @owner_id, @description, @url, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM animals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find_all()
    sql = "SELECT * FROM animals"
    result = SqlRunner.run(sql)
    animals = result.map{ |animal_data| Animal.new(animal_data)}
    return animals
  end

  def self.find_available_animals()
    sql = "SELECT * FROM animals WHERE status = $1"
    values = ['Available']
    result = SqlRunner.run(sql, values)
    animals = result.map{ |available_animals| Animal.new(available_animals)}
    return animals
  end

  def self.find_unavailable_animals()
    sql = "SELECT * FROM animals WHERE status = $1"
    values = ['Unavailable']
    result = SqlRunner.run(sql, values)
    animals = result.map{ |unavailable_animals| Animal.new(unavailable_animals)}
    return animals
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM animals WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Animal.new(result) if result
  end

end
