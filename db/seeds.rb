City.create([
  {name: "Los Angeles-Long Beach-Santa Ana, CA", size: 13131431, open_housing: 94, housing_cost: 453500, name_id: 31080, bls_city_code: "0031100"},
  {name: "Chicago-Joliet-Naperville, IL-IN-WI", size: 9537040, open_housing: 91 , housing_cost: 206300, name_id: 16980, bls_city_code: "0016980"},
  {name: "Boston-Cambridge-Newton, MA-NH", size: 4684299 , open_housing: 93 , housing_cost: 363200, name_id: 14460, bls_city_code: "0071654"},
  {name: "Houston-Sugar Land-Baytown, TX", size: 6313158 , open_housing: 90 , housing_cost: 144400, name_id: 26420, bls_city_code: "0026420"},
  {name: "Denver-Aurora-Broomfield, CO", size: 2697476, open_housing: 94, housing_cost: 257000, name_id: 19740, bls_city_code: "0019740"},
  {name: "Las Vegas-Henderson-Paradise, NV", size: 2027868, open_housing: 84 , housing_cost: 162300, name_id: 29820, bls_city_code: "0029820"}
])

Industry.create([
  {classification: "Health care and social assistance", type_id: 62},
  {classification: "Wholesale trade",type_id: 42},
  {classification: "Professional, scientific, and technical services", type_id: 54},
  {classification: "Finance and insurance", type_id: 52 },
  {classification: "Accommodation & food services", type_id: 72 },
  {classification: "Utilities", type_id: 22 },
  {classification: "Retail trade", type_id: 44 },
  {classification: "Construction", type_id: 23 }
])

CitiesIndustries.create([
  { city_id: 1, industry_id: 1, rank: 1},
  { city_id: 1, industry_id: 2, rank: 7},
  { city_id: 1, industry_id: 3, rank: 6},
  { city_id: 1, industry_id: 4, rank: 9},
  { city_id: 1, industry_id: 5, rank: 3},
  { city_id: 1, industry_id: 7, rank: 2},
  { city_id: 1, industry_id: 8, rank: 11},

  { city_id: 2, industry_id: 1, rank: 1},
  { city_id: 2, industry_id: 2, rank: 7},
  { city_id: 2, industry_id: 3, rank: 6},
  { city_id: 2, industry_id: 4, rank: 8},
  { city_id: 2, industry_id: 5, rank: 5},
  { city_id: 2, industry_id: 7, rank: 2},
  { city_id: 2, industry_id: 8, rank: 12},

  { city_id: 3, industry_id: 1, rank: 1},
  { city_id: 3, industry_id: 2, rank: 9},
  { city_id: 3, industry_id: 3, rank: 3},
  { city_id: 3, industry_id: 4, rank: 5},
  { city_id: 3, industry_id: 5, rank: 4},
  { city_id: 3, industry_id: 7, rank: 2},
  { city_id: 3, industry_id: 8, rank: 12},

  { city_id: 4, industry_id: 1, rank: 1 },
  { city_id: 4, industry_id: 2, rank: 8 },
  { city_id: 4, industry_id: 3, rank: 5 },
  { city_id: 4, industry_id: 4, rank: 12},
  { city_id: 4, industry_id: 5, rank: 3 },
  { city_id: 4, industry_id: 7, rank: 2 },
  { city_id: 4, industry_id: 8, rank: 7 },

  { city_id: 5, industry_id: 1, rank: 1 },
  { city_id: 5, industry_id: 2, rank: 8 },
  { city_id: 5, industry_id: 3, rank: 4 },
  { city_id: 5, industry_id: 4, rank: 6 },
  { city_id: 5, industry_id: 5, rank: 5 },
  { city_id: 5, industry_id: 7, rank: 2 },
  { city_id: 5, industry_id: 8, rank: 7 },

  { city_id: 6, industry_id: 1, rank: 3 },
  { city_id: 6, industry_id: 2, rank: 11},
  { city_id: 6, industry_id: 3, rank: 5 },
  { city_id: 6, industry_id: 4, rank: 8 },
  { city_id: 6, industry_id: 5, rank: 1 },
  { city_id: 6, industry_id: 7, rank: 2 },
  { city_id: 6, industry_id: 8, rank: 6 }

])

BlsComponent.create([
  { title_id: 151130, title: "Software Developers and Programmers" },
  { title_id: 132011, title: "Accountants and Auditors"},
  { title_id: 172011, title: "Aerospace Engineers "},
  { title_id: 291141, title: "Registered Nurses"},
  { title_id: 191023, title: "Zoologists and Wildlife Biologists"},
  { title_id: 193011, title: "Economists "},
  { title_id: 193030, title: "Psychologists"},
  { title_id: 231011, title: "Lawyers"},
  { title_id: 273020, title: "News Analysts, Reporters and Correspondents"},
  { title_id: 291071, title: "Physician Assistants"},
  { title_id: 351011, title: "Chefs and Head Cooks"},
  { title_id: 132051, title: "Financial Analysts"},
  { title_id: 151134, title: "Web Developers" }
])

