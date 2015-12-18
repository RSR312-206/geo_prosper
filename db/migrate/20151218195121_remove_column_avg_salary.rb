class RemoveColumnAvgSalary < ActiveRecord::Migration
  def change
    remove_column :jobs, :avg_salary, :integer
    remove_column :bls_components, :location, :string
    remove_column :bls_components, :location_id, :integer
  end
end
