class UsersController < ApplicationController

  def signup
    @user = User.new
    render 'signup'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.name}, thanks for signing up!"
      redirect_to root_path
    else
      render 'signup'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
