class IntroductionsController < ApplicationController
  before_action :current_user

  def index
    @users = User.last(3)
    @posts = Post.last(3)
    @profiles = Profile.last(3)
  end
end
