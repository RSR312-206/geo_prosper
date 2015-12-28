class Industry < ActiveRecord::Base
  has_many :cities
  has_many :jobs
  validates_presence_of :classification
end
