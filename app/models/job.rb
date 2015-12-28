class Job < ActiveRecord::Base
  validates_presence_of :job_title, :student_loan_pmt, :college
  belongs_to :industries
  has_many :cities_jobs_wages
end