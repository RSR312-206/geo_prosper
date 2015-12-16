class JobWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(job_id)
    #find record by ID
    update_job = Job.find(job_id)
    #make the api call
    state_code = '0438060'
    job_code = "151030"
    # api_call = 'http://api.bls.gov/publicAPI/v1/timeseries/data/NWU530050010200001510302505000'
    api_call = "http://api.bls.gov/publicAPI/v1/timeseries/data/NWU#{state_code}1020000#{job_code}2505000"
    response = Excon.get(api_call)
    data = JSON.parse(response.body)
    salary = data['Results']['series'][0]['data'][0]['value']
    puts salary
    #save the response to the database and save the record.
    update_job.update(avg_salary: salary)
    update_job.save
  end
end

 #software developer in Seattle-Bellevue-Tacoma MSA:
 # NWU53 00500 1020000 151030 2505000
   # NWU530050010200001510302505000
    # NWU0438060 1020000 151030 2505000