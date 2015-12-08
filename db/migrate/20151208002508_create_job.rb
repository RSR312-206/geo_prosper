class CreateJob < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.timestamps
      t.string :job_title
      t.integer :avg_salary
      t.references :industry
    end
  end
end
