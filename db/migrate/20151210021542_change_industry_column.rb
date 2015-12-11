class ChangeIndustryColumn < ActiveRecord::Migration
  def change
    rename_column :industries, :type, :classification
  end
end
