class JobWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(industry_id, job_id)
    job = Job.find(job_id)
    bls_component = BlsComponent.where(title: job.job_title).first
    title_id = bls_component.title_id

    bls_city_codes = CitiesIndustries.where(industry_id: industry_id).joins(:city).pluck('cities.bls_city_code')

    series_ids = bls_city_codes.map do |bls_city_code|
      "OEUM#{bls_city_code}000000#{title_id}03"
    end

    body = {
      'seriesid' => series_ids,
      'registrationKey' => 'fd7a78975adb4c4da37da37d95207f0f'
    }

    response = Excon.post("http://api.bls.gov/publicAPI/v2/timeseries/data/",
      body: body.to_json,
      headers: { "Content-Type" => "application/json" }
    )

    data = JSON.parse(response.body)

    ap data

    series = data['Results']['series']
    message = data["message"]
    series.each do |s|
      # if s['data'].empty?
      #   Rails.logger.warn "CitiesIndustries not created!"
      #   next
      # end

      wage = s["data"][0]["value"]
      series_id = s["seriesID"]
      puts "the job salary is: #{wage} and the seriesID is #{series_id}"

      bls_city_code = series_id[4..10]

      city_id = City.where(bls_city_code: bls_city_code).first.id

      cities_jobs_wages = CitiesJobsWages.create(wage: wage, city_id: city_id, job_id: job.id)

      CityWorker.perform_async(city_id)

      # if cities_jobs_wages.persisted?
      #   Rails.logger.info "CitiesJobsWages created! #{cities_jobs_wages.id}"
      # end
    end
  end
end