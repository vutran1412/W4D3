class SessionsController < ApplicationController

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
      redirect cat_url(@cat)
    else
      render :new
    end
  end

  def destroy

  end
end
