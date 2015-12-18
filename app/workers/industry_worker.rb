class IndustryWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(industry_id, job_id)
      cities_ids = []
      city_ind = CitiesIndustries.where(industry_id: industry_id )

      city_ind.each do |city|
        c = City.find(city.city_id)
        cities_ids.push(c.name_id)
      end

    JobWorker.perform_async(job_id, name_id_hash)
  end
end
