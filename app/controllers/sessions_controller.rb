class SessionsController < ApplicationController
  def new
    @user = User.first
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.password == params[:password]
      redirect_to posts_path
      flash[:success] = "ログインしました。"
      session[:user_id] = user.id
    else
      flash[:alert] = "認証できません。"
      render "sessions/new"
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to new_sessions_path
    flash[:success] = "ログアウトしました。"
  end
end
