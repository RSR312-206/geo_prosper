class AnalyzeSurvey
  def initialize(industry_id, job_id)
    @industry_id = industry_id
    @job_id = job_id
  end

  def run

    cities_jobs_wages = CitiesJobsWages.where(job_id: @job_id).joins(:city).all
    city_ids = cities_jobs_wages.map {|city_id| city_id.city_id }
    wages = cities_jobs_wages.sort_by {|wage| wage.wage }.reverse!

    cities = City.where(id: city_ids)
    open_housing = cities.sort_by { |oh| oh.open_housing }
    housing_cost = cities.sort_by { |hc| hc.housing_cost }
    unemployment = cities.sort_by { |u|  u.unemployment }
    hours_worked = cities.sort_by { |hw| hw.weekly_hours_worked }

    wage_rank = 0
    open_housing_rank = 0
    housing_cost_rank = 0
    unemployment_rank = 0
    hours_worked_rank = 0
    #identify the rank of each attribute of the city and industry.
    city_ids.each do |id|
      # 50% weight
      industry_rank = CitiesIndustries.where(city_id: id, industry_id: @industry_id).pluck('rank').first
      wages.each do |w|
        if  w.city_id === id
          wage_rank = wages.index(w) + 1
        end
      end
      #30% weight
      open_housing.each do |oh|
        if oh.id === id
          open_housing_rank = open_housing.index(oh) + 1
        end
      end
      housing_cost.each do |hc|
        if hc.id === id
          housing_cost_rank = housing_cost.index(hc) + 1
        end
      end
      # 20% weight
      unemployment.each do |u|
        if u.id === id
          unemployment_rank = unemployment.index(u) + 1
        end
      end

      hours_worked.each do |hw|
        if hw.id === id
          hours_worked_rank = hours_worked.index(hw) + 1
        end
      end
      #calculate the weighted average and assign a rank value to the city attribute
      weight_5 = wage_rank.to_i + industry_rank.to_i
      weight_3 = housing_cost_rank.to_i + open_housing_rank.to_i
      weight_2 = unemployment_rank.to_i + hours_worked_rank.to_i
      rank = ((50 * weight_5) + (30 * weight_3) + (20 * weight_2 )) / 100
      p rank
      city = City.find(id)
      city.update_attributes( rank: rank )
    end
  end
end
