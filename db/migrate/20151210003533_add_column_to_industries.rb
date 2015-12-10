class AddColumnToIndustries < ActiveRecord::Migration
  def change
    add_column :industries, :type_id, :integer
  end
end
