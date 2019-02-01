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

end
