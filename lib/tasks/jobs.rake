namespace :create_salary do
  desc "salary creator"
  task :salary => :environment do
  JobWorker.perform_async(job_id)
  end
end