class JobWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(job_id, industry_id)
    cities_ids = []
    series_arr = []

    job_record = Job.find(1)
    result = BlsComponent.where(title: job_record.job_title)
    t = result.pluck(:title_id)
    title = t[0]

    city_ind = CitiesIndustries.where(industry_id: 1)

    city_ind.each do |city|
      c = City.find(city.city_id)
      cities_ids.push(c.bls_city_code)
    end

    cities_ids.each do |location|
      series_arr.push("OEUM#{location}000000#{title}03")
    end


    url = "http://api.bls.gov/publicAPI/v2/timeseries/data/"
    response = Excon.post(url,
                               :body => {'seriesid' =>  series_arr,
                                'registrationKey' => 'fd7a78975adb4c4da37da37d95207f0f'
                               }.to_json,
                               :headers => { "Content-Type" => "application/json" })
    # data = JSON.parse(response.body)
    # salary = data['Results']['series'][0]['data'][0]['value']
    #save the response to the database and save the record.
    # job_record.update(avg_salary: salary)
    # job_record.save
    # puts "Salary: #{job_record.avg_salary}"
  end
end



# http://api.bls.gov/publicAPI/v2/timeseries/data/
# Payload:  JSON Payload:
# {"seriesid":["Series1",..., "SeriesN"],
# "startyear":"yearX",
#  "endyear":"yearY",
# "catalog":true|false,
# "calculations":true|false,
# "annualaverage":true|false,
# "registrationKey":"995f4e779f204473aa565256e8afe73e"
# }


# http://api.bls.gov/publicAPI/v2/timeseries/data/
# OEUM 3108   0000000 35101103
# OEUM 001018 0000000 29114103
  # OEUM 001698 0000000 29114103

  # # OEUM  0035620 000000 29114103
  #   OEUM  0016980  000000  29114103


  # OEUM 001018 0000000 291141 03
  # OEUM 002982 0000000 291141 03
# The last component is the BLS "seriesID". Breaking it down:

# OE: dataset ID
# U: not seasonally adjusted
# M: area type is metro
# 0010180: area code for metro area of Abilene, TX
# 000000: industry code "total", all types of businesses
# 291141: occupation code for Registered Nurses
# 03: statistic code - get the mean hourly wage



#
# OEUM002982000000029114103






