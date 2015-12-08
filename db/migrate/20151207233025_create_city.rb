class CreateCity < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :cola
      t.integer :size
      t.integer :open_rentals
      t.integer :avg_rental_cost
      t.string :politics
      t.timestamps
    end
  end
end
