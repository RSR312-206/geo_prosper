Class JobWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(job_id)
    #find record by ID
    new_job = Job.find(job_id)
    #make the api call
    state_code = '0600348'
    job_code = "151021"
    api_call = "http://api.bls.gov/publicAPI/v1/timeseries/data/NWU#{state_code}1020000#{job_code}2505000"
    response = Excon.get(api_call)
    puts response
    #save the response to the database and save the record.
    new_job.create(avg_salary: response.body)
    new_job.save
    puts "salary: #{job.avg_salary}"
  end
end

