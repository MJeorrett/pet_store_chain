require_relative('../db/sql_runner')

class Pet

  attr_reader :id, :name, :type, :pet_store_id

  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
    @type = options['type']
    @pet_store_id = options['pet_store_id']
  end

  def save()
    sql =
    "INSERT INTO pets(name, type, pet_store_id)
      VALUES (
        '#{@name}',
        '#{@type}',
        #{pet_store_id}
      ) RETURNING id"
    result = SqlRunner.run( sql ).first
    @id = result['id']
  end

  def pet_store()
    sql = "SELECT * FROM pet_stores WHERE id = #{@pet_store_id}"
    pet_store_data = SqlRunner.run(sql).first
    return PetStore.new(pet_store_data)
  end

end
