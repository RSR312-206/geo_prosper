class AddRankColumnToCity < ActiveRecord::Migration
  def change
    add_column :cities, :rank, :integer
  end
end
