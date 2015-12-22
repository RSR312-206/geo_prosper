class CreateColumnsforCensusData < ActiveRecord::Migration
  def change
    add_column :cities, :unemployment, :string
    add_column :cities, :commute_time, :string
    add_column :cities, :income_by_household, :string
    add_column :cities, :weekly_hours_worked, :string
  end
end
