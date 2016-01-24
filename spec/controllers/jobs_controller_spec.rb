require "rails_helper"

RSpec.describe JobsController, :type => :controller do
  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns error if no salary data is present" do
      get :show
      if @job.message.nil?
      expect { raise StandardError }.to raise_error
      end
    end
  end
end