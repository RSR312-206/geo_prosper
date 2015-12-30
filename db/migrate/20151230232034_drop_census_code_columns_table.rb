class DropCensusCodeColumnsTable < ActiveRecord::Migration
  def change
    drop_table :census_code_columns
  end
end
