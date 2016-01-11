class JobWorker
  include Sidekiq::Worker
  sidekiq_options retry: true, retry_count: 2

  def perform(industry_id, job_id)
    job = Job.find(job_id)

    bls_city_codes = CitiesIndustries.where(industry_id: industry_id).joins(:city).pluck('cities.bls_city_code')


    bls_component = BlsComponent.where(title: job.job_title).first
    title_id = bls_component.title_id

    series_ids = bls_city_codes.map do |bls_city_code|
      "OEUM#{bls_city_code}000000#{title_id}03"
    end

    body = {
      'seriesid' => series_ids,
      'registrationKey' => ENV['BLS']
    }

    response = Excon.post("http://api.bls.gov/publicAPI/v2/timeseries/data/",
      body: body.to_json,
      headers: { "Content-Type" => "application/json" }
    )

    data = JSON.parse(response.body)

    ap data

    series = data['Results']['series']
    message = data["message"]

    #test the api for errors in salary data for each call that was made in the batch.
    no_data_error = series.all? {|s| s['data'].empty? }

    no_data_message = "There was no salary data available for this job title."
    error_message = "This request can't be processed right now."

    if no_data_error === true
      job.update_attributes(message: no_data_message)
    elsif data['Results'] === {}
      job.update_attributes(messge: error_message)
    else
      series.each do |s|
        if s['data'].empty?
          Rails.logger.warn "CitiesIndustries not created!"
          next
        end

        wage = s["data"][0]["value"]

        series_id = s["seriesID"]
        puts "the job salary is: #{wage} and the seriesID is #{series_id}"

        bls_city_code = series_id[4..10]

        city_id = City.where(bls_city_code: bls_city_code).first.id

        cities_jobs_wages = CitiesJobsWages.create(wage: wage, city_id: city_id, job_id: job.id)

        CityWorker.perform_async(city_id, industry_id, job_id)

        if cities_jobs_wages.persisted?
          Rails.logger.info "CitiesJobsWages created! #{cities_jobs_wages.id}"
        end
      end
    end
  end
end