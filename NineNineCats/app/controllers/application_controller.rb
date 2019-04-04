class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])    
  end

  def require_logout
    redirect_to users_url if logged_in?
  end

  def require_login
    redirect_to sessions_new_url unless logged_in?
  end

  def logged_in?
    !!(current_user)
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  # def login_user!(params)
  #   @user = User.find_by_credentials(
  #     params[:user][:username],
  #     params[:user][:password]
  #   )

  #   if @user
  #     login!(@user)
  #     redirect user_url(@user)
  #   else
  #     render :new
  #   end
  # end

  def logout!
    if current_user
      current_user.reset_session_token!
    end
    session[:session_token] = nil
    @current_user = nil
  end

end
