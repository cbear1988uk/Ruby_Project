require_relative('./owner.rb')
require_relative('./animal.rb')
require_relative('../db/sql_runner.rb')

class Adoption

  attr_reader :id
  attr_accessor :owner_id, :animal_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @owner_id = options['owner_id']
    @animal_id = options['animal_id']
  end

  def save()
    sql = "INSERT INTO adoptions (owner_id, animal_id) VALUES ($1, $2)
    RETURNING id"
    values = [@owner_id, @animal_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"]
  end

  def update()
    sql = "UPDATE adoptions SET (owner_id, animal_id) = ($1, $2) WHERE id = $3"
    values = [@owner_id, @animal_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM adoptions"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM adoptions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find_all()
    sql = "SELECT * FROM adoptions"
    results = SqlRunner.run(sql)
    adoptions = results.map{|row| Adoption.new(row)} if results
    return adoptions
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM adoptions WHERE id = $1"
    values = [id]
    adoption_data = SqlRunner.run(sql, values).first
    return Adoption.new(adoption_data)
  end

  def get_owner_name()
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [@owner_id]
    results = SqlRunner.run(sql, values)
    owner_data = results.first
    owner = Owner.new(owner_data)
    return owner.first_name + " " + owner.last_name
  end

  def get_pet_name()
    sql = "SELECT * FROM animals WHERE id = $1"
    values = [@animal_id]
    results = SqlRunner.run(sql, values)
    animal_data = results.first
    animal = Animal.new(animal_data)
    return animal.name
  end

end
