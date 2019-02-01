require_relative('./animal.rb')
require_relative('../db/sql_runner.rb')

class Owner

attr_reader :id
attr_accessor :first_name, :last_name, :pet, :animal_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @pet = options['pet']
    @animal_id = options['animal_id'].to_i
  end

  def save()
    sql = "INSERT INTO owners (first_name, last_name, pet, animal_id)
    VALUES ($1, $2, $3, $4) RETURN id"
    values = [@first_name, @last_name, @pet, @animal_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id']
  end

  def update()
    sql = "UPDATE owners SET (first_name, last_name, pet, animal_id)
    = ($1, $2, $3, $4) WHERE id = $5"
    values = [@first_name, @last_name, @pet, @animal_id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM owners WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
