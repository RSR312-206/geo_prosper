class CitiesJobsWages < ActiveRecord::Base
  belongs_to :job
  belongs_to :city
end