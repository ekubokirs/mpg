class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :brand
      t.string :color
      t.string :current_miles
      t.string :year

      t.timestamps
    end
  end
end
