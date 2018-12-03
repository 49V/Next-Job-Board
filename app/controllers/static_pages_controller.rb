class StaticPagesController < ApplicationController
  before_action :require_login

  def home
  end

  def account
  end

  def candidates
  end

  def job
  end

    private

    def require_login
      unless logged_in?
        flash[:danger] = "You must be logged in to access this section"
        redirect_to login_path # halts request cycle
      end
    end

end
