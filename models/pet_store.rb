require_relative('../db/sql_runner')

class PetStore

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
  
end
