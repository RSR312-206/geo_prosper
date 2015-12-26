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

    # 40% weight
      wages = cities_jobs_wages.sort_by {|wage| wage.wage }.reverse!
      wages.each {|w| wage_rank = wages.index(w) + 1 while city_id === 4 }

    #database call for Industries

    # 40% weight
    industry_rank = CitiesIndustries.where(city_id: 4, industry_id: 1).pluck('rank').first

    #databse calls for Cities
    cities = City.where(id: city_ids)

    #30% weight
    open_housing = cities.sort_by { |oh| oh.open_housing }
    open_housing.each { |oh| open_housing_rank = open_housing.index(oh) + 1 while oh.id === 4 }

    housing_cost = cities.sort_by { |hc| hc.housing_cost }
    housing_cost.each { |hc| housing_cost_rank = housing_cost.index(hc) + 1 while hc.id === 4 }

    # 20% weight
    unemployment = cities.sort_by { |u|  u.unemployment }
    unemployment.each { |u| unemployment_rank = unemployment.index(u) + 1 while u.id === 4 }

    hours_worked = cities.sort_by { |hw| hw.weekly_hours_worked }
    hours_worked.each { |hw| hours_worked_rank = hours_worked.index(hw) + 1 while hw.id === 4 }

    # 10% weight
    commute_times = cities.sort_by { |ct| ct.commute_time }
    commute_times.each { |ct| commute_time_rank = commute_times.index(ct) + 1 while ct.id === 4  }

    weight_4 = wage_rank.to_i + industry_rank.to_i
    weight_3 = housing_cost_rank.to_i + 3
    weight_2 = unemployment_rank.to_i + hours_worked_rank.to_i
    weight_1 = commute_time_rank.to_i
    weighted_avg = ((40 * weight_4) + (30 * weight_3) + (20 * weight_2 ) + (10 * weight_1 )) / 100
    puts weighted_avg
  end
end
