class ApplicationController < ActionController::Base
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def check_login
    unless @current_user
      flash[:alert] = "ログインしてください。"
      redirect_to new_sessions_path
    end
  end
end
