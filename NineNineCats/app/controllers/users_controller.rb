class UsersController < ApplicationController

  before_action :require_logout, only: [:new, :create]

  def new
    render :new
  end

  def create

    user = User.new(user_params)
    user.save!
    login!(user)
    redirect_to :cats
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
