class CityWorker
  include Sidekiq::CityWorker
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
    geo_ids = "3651000"

    table_ids = "#{table_id1},#{table_id2},#{table_id3},#{table_id4},#{table_id5},#{table_id6},#{table_id7}"

    Excon.get("#{api_call}table_ids=#{table_ids}&geo_ids=16000US#{geo_ids}")
  end
end