class CandidatesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: :destroy

  def candidate
    if logged_in?
      @candidate = Candidate.new
      @user = current_user
      if @user.candidate
        @user_candidate = @user.candidate
        @public_candidates = Candidate.where("user_id != ?", @user.id).paginate(page: params[:page])
      else
        @public_candidates = Candidate.paginate(page: params[:page])
      end
    end
  end

  def create

    @candidate = current_user.build_candidate(candidate_params)
    @candidate.name = current_user.name
    if @candidate.save
      flash[:success] = "Candidate posting created!"
      redirect_to candidate_path
    else
      @user = current_user
      @user.candidate ? @public_candidates = Candidate.where("user_id != ?", @candidate.user_id).paginate(page: params[:page]) : @public_candidates = Candidate.paginate(page: params[:page])
      flash[:danger] = "Candidate posting was not created."
      render 'candidate'
    end

  end

  def destroy
    @user_candidate.destroy
    flash[:success] = "Micropost deleted"
    redirect_to candidate_path
  end

  def update
    redirect_to candidate_path
  end

  private

    def candidate_params
      params.require(:candidate).permit(:bio, :portfolio, :role)
    end

    def correct_user
      @user_candidate = (current_user.candidate.id.to_s == params["format"]) ? current_user.candidate : nil
      redirect_to root_url if @user_candidate.nil?
    end

end
