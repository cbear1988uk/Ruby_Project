require_relative('./owner.rb')
require_relative('../db/sql_runner')

class Animal

  attr_reader :id
  attr_accessor :name, :type, :breed, :age,
  :status, :owner, :admission_date, :owner_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @breed = options['breed']
    @age = options['age']
    @status = options['status']
    @owner = options['owner']
    @admission_date = options['admission_date']
    @owner_id = options['owner_id'].to_i
  end

  def save()
    sql = "INSERT INTO animals (name, type, breed, age, status, owner,
    admission_date, owner_id) VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
    RETURNING id"
    values = [@name, @type, @breed, @age, @status, @owner,
      @admission_date, @owner_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id']
  end

  def update()
    sql = "UPDATE animals SET (name, type, breed, age, status, owner,
    admission_date, owner_id) = WHERE id = $9"
    values = [@name, @type, @breed, @age, @status, @owner, @admission_date,
      @owner_id]
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

  def self.find_by_id(id)
    sql = "SELECT * FROM animals WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Animal.new(result) if result
  end


end
