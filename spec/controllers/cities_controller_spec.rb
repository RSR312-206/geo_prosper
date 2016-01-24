require "rails_helper"

RSpec.describe CitiesController, :type => :controller do
  describe "GET #show" do
    before {@c = City.where(name: "New York-Northern New Jersey-Long Island, NY-NJ-PA")}
    it "responds successfully with an HTTP 200 status code" do
      get :show
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end