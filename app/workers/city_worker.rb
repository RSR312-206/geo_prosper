class CityWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(city_id)

    city = City.find(city_id)

    api_call = "http://api.censusreporter.org/1.0/data/show/latest?"

    table_id1 = "B25008" #total, owner, and rental occupied housing in the location
    table_id2 = "B25002" # housing Occupancy Status
    table_id3 =  "B25075" #Owner-occupied Housing Units. total, cost breakout.
    table_id4 = "B23025" #total unemployed, employed persons by city
    table_id5 = "B08136" #total travel time and mode of travel to work
    table_id6 = "B19113" #median salary by household
    table_id7 = "B23020" #Mean Usual Hours Worked in the Past 12 Months for Workers 16 to 64 Years by Gender
    geo_ids = city.census_city_code

    table_ids = "#{table_id1},#{table_id2},#{table_id3},#{table_id4},#{table_id5},#{table_id6},#{table_id7}"

    response = Excon.get("#{api_call}table_ids=#{table_ids}&geo_ids=16000US#{geo_ids}")

    data = JSON.parse(response.body)

    api_path = data["data"]["16000US#{geo_ids}"]

    #housing and occupancy
    total_housing =  api_path["B25002"]["estimate"]["B25002001"].to_f
    occupied = api_path["B25002"]["estimate"]["B25002002"].to_f
    vacancy = api_path["B25002"]["estimate"]["B25002003"].to_f
    open_housing = occupied / total_housing

    #owner-occupied housing stats
    housing_cost =  api_path["B25075"]["estimate"]["B25075001"]

    #unemplyed/employed persons by city
    total_workers = api_path["B23025"]["estimate"]["B23025002"]
    employed  = api_path["B23025"]["estimate"]["B23025004"]
    unemployed = api_path["B23025"]["estimate"]["B23025005"]

    unemployment = unemployed / total_workers

    #total travel time and mode of travel to work in seconds
    commute_time = api_path["B08136"]["estimate"]["B08136002"]

    #median salary by individual
    income_by_household = api_path["B19113"]["estimate"]["B19113001"]
    puts income_by_household

    #mean usual hours worked by gender per city
    weekly_hours_worked = api_path["B23020"]["estimate"]["B23020001"]
    female_hours_worked = api_path["B23020"]["estimate"]["B23020003"]
    male_hours_worked = api_path["B23020"]["estimate"]["B23020002"]

    city.update_attributes(open_housing: open_housing, housing_cost: housing_cost, unemployment: unemployment, commute_time: commute_time, income_by_household: income_by_household, weekly_hours_worked: weekly_hours_worked)

  end
end



