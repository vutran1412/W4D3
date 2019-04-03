class SessionsController < ApplicationController

  before_action :require_logout, only: [:new, :create]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    @user.reset_session_token!

    if @user
      login!(@user)
      redirect user_url(@user)
    else
      render :new
    end
  end

  def destroy
    logout!
  end
end
