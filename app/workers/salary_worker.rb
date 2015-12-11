Class SalaryWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(job_id)
    #find record by ID
    salary = Job.find(job_id)
    #make the api call
    state_code = '0600348'
    job_code = "151021"
    api_call = "http://api.bls.gov/publicAPI/v1/timeseries/data/NWU#{state_code}1020000#{job_code}2505000"
    response = Excon.get(api_call)
    #save the response to the database and save the record.
    avg_salary = Job.create(data: response.body)
    job.avg_salary = avg_salary
    job.save
    puts "salary: #{job.avg_salary}"
  end
end

