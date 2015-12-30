class RemoveCollege < ActiveRecord::Migration
  def change
    remove_column :jobs, :college, :string
    remove_column :cities, :politics, :string
  end
end
