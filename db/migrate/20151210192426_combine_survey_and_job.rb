class CombineSurveyAndJob < ActiveRecord::Migration
  def change
    add_column :jobs, :student_loan_pmt, :integer
    add_column :jobs, :college, :string
    drop_table :surveys
  end
end
