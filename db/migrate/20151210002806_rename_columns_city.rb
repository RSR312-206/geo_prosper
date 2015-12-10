class RenameColumnsCity < ActiveRecord::Migration
  def change
     rename_column :cities, :open_rentals, :open_housing
     rename_column :cities, :avg_rental_cost, :housing_cost
     remove_column :cities, :cola, :integer
  end
end
