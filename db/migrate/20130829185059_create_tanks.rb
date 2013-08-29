class CreateTanks < ActiveRecord::Migration
  def change
    create_table :tanks do |t|
      t.string :amount
      t.string :price
      t.string :current_miles

      t.timestamps
    end
  end
end
