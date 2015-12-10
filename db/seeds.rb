# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cities.create([
  {name: "Aberdeen, SD", size: 27333, open_housing: 95, housing_cost: 136600, name_id: 10100},
  {name: "Atlantic City-Hammonton, NJ", size: 275862, open_housing: 80 , housing_cost: 127888, name_id: 12100},
  {name: "Boston-Cambridge-Newton, MA-NH", size: 4684299 , open_housing: 93 , housing_cost: 363200, name_id: 14460},
  {name: "Clarksdale, MS", size: 25570 , open_housing: 89 , housing_cost: 56600, name_id: 17260},
  {name: "Chicago-Naperville-Elgin, IL-IN-WI", size: 9537040, open_housing: 91, housing_cost: 206300, name_id: 16980 },
  {name: "Las Vegas-Henderson-Paradise, NV", size: 2027868, open_housing: 84 , housing_cost: 162300, name_id: },
  {name: "Salt Lake City, UT", size: 1140483 , open_housing: 94, housing_cost: 225100, name_id: 41620},
  {name: "Seattle-Tacoma-Bellevue, WA", size: 3610105 , open_housing: 93, housing_cost: 307900 , name_id: 42660}
  ]),

Industries.create([
  {type: "Health care and social assistance", type_id: 62},
  {type: "Wholesale trade",type_id: 42},
  {type: "Professional, scientific, and technical services", type_id: 54},
  {type: "Finance and insurance", type_id: 52},
  {type: "Mining, quarrying, and oil and gas extraction", type_id: 21},
  {type: "Utilities", type_id: 22},
  {type: "Agriculture, forestry, fishing, and hunting", type_id: 11},
  {type: "Construction", type_id: 72}
])

Jobs.create([
  {job_title: "software deveoper", avg_salary: 84000 },
  {job_title: "fiacial analyst", avg_salary: 60200},
  {job_title: "chemical engineer", avg_salary: 83000},
  {job_title: "biologist", avg_salary: 53000},
  {job_title: "cartograper", avg_salary: 43000 },
  {job_title: "nurse", avg_salary: 54000},
  {job_title: "accountant", avg_salary: 55000},
  {job_title: "construction worker", avg_salary: 34000 }

])

Sureys.create([
  {student_loan_pmt:, college: , job_id: }
  ])


