class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.integer :year
      t.integer :seats
      t.float :price
      t.string :location

      t.timestamps
    end
  end
end
