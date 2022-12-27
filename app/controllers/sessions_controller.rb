class SessionsController < ApplicationController
  def new
    @user = User.first
    @behavior_patterns = [
      [1, '通常ログイン'],
      [2, 'Eメールのみでログイン']
    ]

    @query = User::SQL_QUERY
  end

  def create
    if (normal_login? && !sql_query?) || (security_attack? && sql_query?)
      password = params[:password]
    elsif normal_login? && sql_query? then
      password = nil
    else
      password = params[:password]
    end

    user = User.where("email = '#{params[:email]}' AND password = '#{password}'").first
    # プレースホルダーを使えば文字列処理に変換される
    # user = User.where("email = ? and password = ?", params[:email], password).first
    # ハッシュでも大丈夫
    # user = User.where(email: params[:email], password: password).first

    if user
      redirect_to posts_path
      flash[:success] = "ログインしました。"
      session[:user_id] = user.id
    else
      flash[:alert] = "認証できません。"
      redirect_to new_sessions_path
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to new_sessions_path
    flash[:success] = "ログアウトしました。"
  end

  private

  def normal_login?
    params[:pattern_id].to_i == 1
  end

  def security_attack?
    params[:pattern_id].to_i == 2
  end

  def sql_query?
    params[:password] == User::SQL_QUERY
  end
end
