class JobsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :jobs]
  before_action :correct_user,   only: :destroy

  def jobs
    if logged_in?
      @user = current_user
      @job = Job.new
      @user_jobs = @user.jobs.paginate(page: params[:page])
      @public_jobs = Job.where("user_id != ?", @user.id).paginate(page: params[:page])
    end
  end

  def create
    @job = current_user.jobs.build(job_params)
    @user = current_user
    @user_jobs = @user.jobs.paginate(page: params[:page])
    @public_jobs = Job.where("user_id != #{@user.id}").paginate(page: params[:page])
    if @job.save
      flash[:success] = "Job created!"
      redirect_to jobs_path
    else
      flash.now[:danger] = "Job failed to be created."
      render 'jobs'
    end

  end

  def destroy
    @job.destroy
    flash[:success] = "Job Post deleted"
    redirect_to jobs_path
  end

  private

    def job_params
      params.require(:job).permit(:title, :company, :website, :link, :role, :notes)
    end

    def correct_user
      @job = current_user.jobs.find_by(id: params[:id])
      redirect_to root_url if @job.nil?
    end

end
