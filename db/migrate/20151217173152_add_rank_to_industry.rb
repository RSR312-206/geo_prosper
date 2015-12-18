class AddRankToIndustry < ActiveRecord::Migration
  def change
    add_column :cities_industries, :rank, :integer
  end
end
