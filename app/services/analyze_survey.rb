class AnalyzeSurvey
  def initialize(industry_id, job_id)
    @industry_id = industry_id
    @job_id = job_id
  end

  def run

    JobWorker.perform_async(@industry_id, @job_id)
    #all records by job_id which include city properties
    cities_jobs_wages = CitiesJobsWages.where(job_id: 5).joins(:city).all
    city_set = cities_jobs_wages.length

    cities_jobs_wages.each do |city_job_wage|
      city =  city
      wages[city] = city_job_wage.wage

      industries[city] = city_job_wage.cities_industries.rank
      open_housing[city] = city_job_wage.city.open_housing
      unemployment[city] = city_job_wage.city.unemployment
      weekly_hours_worked[city] = city_job_wage.city.weekly_hours_worked
      commute_time[city] = city_job_wage.city.commute_time
      housing_cost[city] = city_job_wage.city.housing_cost

    end

  end

end

#for each city- find the place of each property in the hash and assign it a value based on the order.
#so, if the wage is position #3 in the hash- the value of the wage property is 3



# industry = CitiesIndustries.where(city_id: city_job_wage.city_id).pluck('industry_id').first
# industries[city_job.city_id] = industry
#first- find the cities from the list where the industry is found in the top 10.
#the rank in the databse is the rank in the algorithm. 1 is greatest, 10 is least.
#then, gather the wages of those cities and order them from least to greatest
#the rank of wage is the length of the array. the greatest has a rank of 1,
#the least has a rank of the last index + 1
#fianlly , limit your results to 10 cities. More than that and the map becomes cluttered.

