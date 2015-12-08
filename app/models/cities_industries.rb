class CitiesIndustries < ActiveRecord::Base
  belongs_to :city
  belongs_to :industry
end