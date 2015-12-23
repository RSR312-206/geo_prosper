class AnalyzeSurvey
  def initialize(industry_id, job_id)
    @industry_id = industry_id
    @job_id = job_id
  end

  def run
    JobWorker.perform_async(@industry_id, @job_id)

    #database calls for CitiesJobswages
    cities_jobs_wages = CitiesJobsWages.where(job_id: 5).joins(:city).all
    city_set = cities_jobs_wages.length
    city_ids = cities_jobs_wages.map {|city_id| city_id.city_id }
    # 40% weight
    wages = cities_jobs_wages.sort_by {|wage| wage.wage }

    #database call for Industries
    # 40% weight
    industries = CitiesIndustries.where(city_id: city_ids, industry_id: @industry_id)
    industry_rank = industries.sort_by { |ind| ind.rank }


    #databse calls for Cities
    cities = City.where(id: city_ids)
    #30% weight
    open_housing = cities.sort_by { |oh| oh.open_housing }
    housing_cost = cities.sort_by { |hc| hc.housing_cost }
    # 20% weight
    unemployment = cities.sort_by { |u|  u.unemployment }
    hours_worked = cities.sort_by { |hw| hw.hours_worked }

    # 10% weight
    commute_time = cities.sort_by { |ct| ct.commute_time }
  end
end

# industry = CitiesIndustries.where(city_id: city_job_wage.city_id).pluck('industry_id').first
# industries[city_job.city_id] = industry
#first- find the cities from the list where the industry is found in the top 10.
#the rank in the databse is the rank in the algorithm. 1 is greatest, 10 is least.
#then, gather the wages of those cities and order them from least to greatest
#the rank of wage is the length of the array. the greatest has a rank of 1,
#the least has a rank of the last index + 1
#fianlly , limit your results to 10 cities. More than that and the map becomes cluttered.

