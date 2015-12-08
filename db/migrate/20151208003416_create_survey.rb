class CreateSurvey < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.timestamps
      t.integer :student_loan_pmt
      t.references :jobs
    end
  end
end
