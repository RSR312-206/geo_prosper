class JobsController < ApplicationController
  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      job_id = @job.id
      industry_id = @job.industry_id
      AnalyzeSurvey.new(industry_id, job_id).run
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
    @cities_jobs_wages = CitiesJobsWages.where(job_id: @job.id).all
    @industries = CitiesIndustries.where(industry_id: @job.industry_id).joins(:city).all
    @cities = City.where(rank: 1..10).order(:rank)
  end

  def ready
    @job = Job.find(params[:id])

    if @job.industry_id.present?
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

