class Job < ActiveRecord::Base
  belongs_to :industries
  has_many :surveys
end