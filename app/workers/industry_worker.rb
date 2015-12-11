Class IndustryWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(industry_id)
  end
end