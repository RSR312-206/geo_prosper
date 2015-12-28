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

      redirect_to job_path(@job)
    else
      flash[:alert] = "something went wrong"
      render :new
    end

  end

  def show
    @job = Job.find(params[:id])
    @cities_jobs_wages = CitiesJobsWages.where(job_id: @job.id).all
    @industries = CitiesIndustries.where(industry_id: @job.industry_id).joins(:city).all
  end

  private

  def job_params
    params.require(:job).permit(:student_loan_pmt, :college, :job_title, :industry_id, :avg_salary)
  end

end

#