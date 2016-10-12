require_relative('./models/pet')
require_relative('./models/pet_store')

require('pry-byebug')

pet_store = PetStore.new( 'name' => "Pet World", 'stock_type' => "house pets", 'address' => "CodeClan HQ, Edinburgh")
pet_store.save()

pet = Pet.new( 'name' => 'Bugs Bunny', 'type' => 'rabbit', 'pet_store_id' => pet_store.id)
pet.save()

binding.pry
nil
