require_relative('../db/sql_runner')

class PetStore

  attr_reader :id, :name, :address, :stock_type

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @address = options['address']
    @stock_type = options['stock_type']
  end

  def save()
    sql =
    "INSERT INTO pet_stores (name, address, stock_type) VALUES ('#{@name}', '#{@address}', '#{@stock_type}') RETURNING id"
    pet_store_data = SqlRunner.run(sql).first
    @id = pet_store_data['id']
  end

  def get_pets()
    sql = "SELECT * FROM pets WHERE pet_store_id = #{@id}"
    pets_data = SqlRunner.run( sql )
    return pets_data.map { |pet_data| Pet.new( pet_data )}
  end

end
