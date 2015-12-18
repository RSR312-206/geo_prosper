class City < ActiveRecord::Base
  has_many :industries
  has_many :cities_jobs_wages
end