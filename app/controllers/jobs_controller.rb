class JobsController < ApplicationController
  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      job_id = @job.id
      industry_id = @job.industry_id
      JobWorker.perform_async(industry_id, job_id)
      redirect_to job_load_path(@job)
    else
      flash.now[:alert] = "Please fill out all the data in the survey."
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
      if @job.message != nil
        flash.now[:error] = "Unfortunately, there was no data for this job. Please try another!"
      end
    @cities = City.order(rank: :asc).limit(15)
    @cities_jobs_wages = CitiesJobsWages.where(job_id: @job.id, city_id: @cities).all
    @industries = CitiesIndustries.where(industry_id: @job.industry_id).joins(:city).all

  end

  def ready
    @job = Job.find(params[:id])
    if @job.message.present?
      render json: {ready: true}
    elsif
      @cities_jobs_wages = CitiesJobsWages.joins(:city).where(job_id: @job.id).last
      @cities_jobs_wages.city.rank.present?
       render json: {ready: true}
     else
       render json: {ready: false}
     end
  end

  def load
    @job = Job.find(params[:id])
  end

  private

  def job_params
    params.require(:job).permit(:student_loan_pmt, :job_title, :industry_id, :avg_salary, :message)
  end
end

