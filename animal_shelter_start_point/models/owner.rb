require_relative('./animal.rb')
require_relative('../db/sql_runner.rb')

class Owner

attr_reader :id
attr_accessor :first_name, :last_name, :pet, :animal_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO owners (first_name, last_name)
    VALUES ($1, $2) RETURNING id"
    values = [@first_name, @last_name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE owners SET (first_name, last_name)
    = ($1, $2) WHERE id = $3"
    values = [@first_name, @last_name]
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

  def self.find_all()
    sql = "SELECT * FROM owners"
    result = SqlRunner.run(sql)
    owners = result.map{ |owner_data| Owner.new(owner_data)}
    return owners
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Owner.new(result) if result
  end



end
