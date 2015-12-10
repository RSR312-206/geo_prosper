class AddColumnToCities < ActiveRecord::Migration
  def change
    add_column :cities, :name_id, :integer
  end
end
