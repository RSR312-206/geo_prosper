class ChangeBlsCityCodeToString < ActiveRecord::Migration
  def change
    change_column :cities, :bls_city_code, :string
  end
end
