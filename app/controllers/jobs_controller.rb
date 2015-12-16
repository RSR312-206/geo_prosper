class JobsController < ApplicationController
  def new
    @job = Job.new
  end

  def create

    @job = Job.new(job_params)
    if @job.save
      job_params = params[:id]
      JobWorker.perform_async(job_params)
      redirect_to job_path(@job)
    else
      flash[:alert] = "something went wrong"
      redirect_to :new
    end

  end

  def show

    @job = Job.find(params[:id])
  end

  private

  def job_params
    params.require(:job).permit(:student_loan_pmt, :college, :job_title, :industry_id, :avg_salary)
  end

end

#Once the worker is kicked off, it will send the results to the database.

#then, you need to call that records in def show for it to be rendered on to the show.html.erb view.