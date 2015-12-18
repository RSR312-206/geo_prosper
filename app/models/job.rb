class Job < ActiveRecord::Base
  belongs_to :industries
  has_many :cities_jobs_wages
end