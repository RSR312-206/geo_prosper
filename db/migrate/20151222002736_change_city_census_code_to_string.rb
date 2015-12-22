class ChangeCityCensusCodeToString < ActiveRecord::Migration
  def change
    change_column :cities, :census_city_code, :string
  end
end
