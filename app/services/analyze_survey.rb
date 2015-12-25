class AnalyzeSurvey
  def initialize(industry_id, job_id)
    @industry_id = industry_id
    @job_id = job_id
  end

  def run
    JobWorker.perform_async(@industry_id, @job_id)

    #database calls for CitiesJobswages
    cities_jobs_wages = CitiesJobsWages.where(job_id: 5).joins(:city).all
    city_ids = cities_jobs_wages.map {|city_id| city_id.city_id }
    wage_rank = 0
    # 40% weight
      wages = cities_jobs_wages.sort_by {|wage| wage.wage }.reverse!
      wages.each do |w|
        if w.city_id === 4
          wage_rank = wages.index(w)
          puts wage_rank
        end
      end

    #database call for Industries
    # 40% weight
    industry_rank = CitiesIndustries.where(city_id: 4, industry_id: 1).pluck('rank').first

    #databse calls for Cities
    cities = City.where(id: city_ids)
    #30% weight

    open_housing = cities.sort_by { |oh| oh.open_housing }
    open_housing.each do |oh|
      if oh.id === 4
        open_housing_rank = open_housing.index(oh) + 1
        puts open_housing_rank
      end
    end
    housing_cost = cities.sort_by { |hc| hc.housing_cost }
    housing_cost.each do |hc|
      if hc.id === 4
        housing_cost_rank = housing_cost.index(hc) + 1
        puts housing_cost_rank
      end
    end
    # 20% weight
    unemployment = cities.sort_by { |u|  u.unemployment }
    unemployment.each do |u|
      if u.id === 4
        unemployment_rank = unemployment.index(u) + 1
        puts unemployment_rank
      end
    end
    hours_worked = cities.sort_by { |hw| hw.weekly_hours_worked }
    hours_worked.each do |hw|
      if hw.id === 4
        hours_worked_rank = hours_worked.index(hw) + 1
        puts hours_worked_rank
      end
    end

    # 10% weight
    commute_times = cities.sort_by { |ct| ct.commute_time }
    commute_times.each do |ct|
      if ct.id === 4
        commute_time_rank = commute_times.index(ct) + 1
        puts commute_time_rank
      end
    end

    weight_1 = wage_rank.to_i + industry_rank.to_i
    weight_2 = housing_cost_rank.to_i + 3
    weight_3 = unemployment_rank.to_i + hours_worked_rank.to_i
    weight_4 = commute_time_rank.to_i
    weighted_avg = ((40 * weight_1) + (30 * weight_2) + (20 * weight_3 ) + (10 * weight_4 )) / 100
    puts weighted_avg
  end
end

#the algorithm must return an array of cities to the controller- maybe a rank attribute?
# industry = CitiesIndustries.where(city_id: city_job_wage.city_id).pluck('industry_id').first
# industries[city_job.city_id] = industry
#first- find the cities from the list where the industry is found in the top 10.
#the rank in the databse is the rank in the algorithm. 1 is greatest, 10 is least.
#then, gather the wages of those cities and order them from least to greatest
#the rank of wage is the length of the array. the greatest has a rank of 1,
#the least has a rank of the last index + 1
#fianlly , limit your results to 10 cities. More than that and the map becomes cluttered.

