class ChangeSurveyTable < ActiveRecord::Migration
  def change
    rename_column :surveys, :jobs_id, :job_id
  end
end
