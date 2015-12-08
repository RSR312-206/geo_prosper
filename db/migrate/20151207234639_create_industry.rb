class CreateIndustry < ActiveRecord::Migration
  def change
    create_table :industries do |t|
      t.timestamps
      t.string :type
    end
  end
end



