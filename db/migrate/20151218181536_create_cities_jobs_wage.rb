class CreateCitiesJobsWage < ActiveRecord::Migration
  def change
    create_table :cities_jobs_wages do |t|
      t.timestamps
      t.integer :wage
      t.references :city
      t.references :job
    end
  end
end
