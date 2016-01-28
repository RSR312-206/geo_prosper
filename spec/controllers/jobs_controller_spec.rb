require "rails_helper"

RSpec.describe JobsController, :type => :controller do
  describe "POST #create" do
    let(:job) {Job.create!(student_loan_pmt: 100, job_title: "Chemists")}
    it "creates a new job record with the right params" do
      p response
       expect(:job).record.to eq(1)
       # expect(:job)).record.length.to eq(0)
    end

    xit "returns error if no salary data is present" do
      get :show
      if @job.message.nil?
      expect { raise StandardError }.to raise_error
      end
    end
  end
end


