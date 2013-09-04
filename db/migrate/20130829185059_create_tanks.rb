class CreateTanks < ActiveRecord::Migration
  def change
    create_table :tanks do |t|
      t.string 			:amount
      t.string 			:price
      t.string 			:current_miles
      t.references	:car

      t.timestamps
    end
  end
end
