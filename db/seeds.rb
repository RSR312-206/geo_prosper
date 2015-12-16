City.create([
  {name: "Aberdeen, SD", size: 27333, open_housing: 95, housing_cost: 136600, name_id: 10100},
  {name: "Atlantic City-Hammonton, NJ", size: 275862, open_housing: 80 , housing_cost: 127888, name_id: 12100},
  {name: "Boston-Cambridge-Newton, MA-NH", size: 4684299 , open_housing: 93 , housing_cost: 363200, name_id: 14460},
  {name: "Clarksdale, MS", size: 25570 , open_housing: 89 , housing_cost: 56600, name_id: 17260},
  {name: "Chicago-Naperville-Elgin, IL-IN-WI", size: 9537040, open_housing: 91, housing_cost: 206300, name_id: 16980 },
  {name: "Las Vegas-Henderson-Paradise, NV", size: 2027868, open_housing: 84 , housing_cost: 162300, name_id: 29820},
  {name: "Salt Lake City, UT", size: 1140483 , open_housing: 94, housing_cost: 225100, name_id: 41620},
  {name: "Seattle-Tacoma-Bellevue, WA", size: 3610105 , open_housing: 93, housing_cost: 307900 , name_id: 42660}
  ])

Industry.create([
  {classification: "Health care and social assistance", type_id: 62},
  {classification: "Wholesale trade",type_id: 42},
  {classification: "Professional, scientific, and technical services", type_id: 54},
  {classification: "Finance and insurance", type_id: 52},
  {classification: "Mining, quarrying, and oil and gas extraction", type_id: 21},
  {classification: "Utilities", type_id: 22},
  {classification: "Agriculture, forestry, fishing, and hunting", type_id: 11},
  {classification: "Construction", type_id: 72},
])

CitiesIndustries.create([
  { city_id: 1, industry_id: 1 },
  { city_id: 1, industry_id: 2 },
  { city_id: 1, industry_id: 4 },
  { city_id: 1, industry_id: 5 },
  { city_id: 1, industry_id: 6 },
  { city_id: 1, industry_id: 7 },

  { city_id: 2, industry_id: 1 },
  { city_id: 2, industry_id: 2 },
  { city_id: 2, industry_id: 3 },
  { city_id: 2, industry_id: 6 },
  { city_id: 2, industry_id: 7 },

  { city_id: 3, industry_id: 1 },
  { city_id: 3, industry_id: 3 },
  { city_id: 3, industry_id: 4 },
  { city_id: 3, industry_id: 5 },
  { city_id: 3, industry_id: 6 },

  { city_id: 4, industry_id: 2 },
  { city_id: 4, industry_id: 3 },
  { city_id: 4, industry_id: 5 },
  { city_id: 4, industry_id: 7 },
  { city_id: 4, industry_id: 8 },

  { city_id: 5, industry_id: 1 },
  { city_id: 5, industry_id: 3 },
  { city_id: 5, industry_id: 5 },
  { city_id: 5, industry_id: 7 },
  { city_id: 5, industry_id: 8 },

  { city_id: 6, industry_id: 2 },
  { city_id: 6, industry_id: 4 },
  { city_id: 6, industry_id: 5 },
  { city_id: 6, industry_id: 7 },
  { city_id: 6, industry_id: 1 },

  { city_id: 7, industry_id: 1 },
  { city_id: 7, industry_id: 3 },
  { city_id: 7, industry_id: 4 },
  { city_id: 7, industry_id: 5 },
  { city_id: 7, industry_id: 6 },

  { city_id: 8, industry_id: 3 },
  { city_id: 8, industry_id: 4 },
  { city_id: 8, industry_id: 5 },
  { city_id: 8, industry_id: 6 },
  { city_id: 8, industry_id: 8 },
  ])


Job.create([
  { job_title: "Nurse", industry_id: 1, student_loan_pmt: 340, college: "University of Washington"},
  { job_title: "Software Developer", industry_id: 3, student_loan_pmt: 300, college: "University of Illinois"}
])
