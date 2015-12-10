class AddColumnToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :college, :string
  end
end
