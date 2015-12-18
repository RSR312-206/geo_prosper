class AddBlsCodeColumnToCities < ActiveRecord::Migration
  def change
    add_column :cities, :bls_city_code, :integer
  end
end
