class Industry < ActiveRecord::Base
  has_many :cities
  has_many :jobs
end