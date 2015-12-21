class CreateCensusCodeColumn < ActiveRecord::Migration
  def change
    create_table :census_code_columns do |t|
      add_column :cities, :census_city_code, :integer
    end
  end
end
