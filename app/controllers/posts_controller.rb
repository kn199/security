class PostsController < ApplicationController
  before_action :current_user
  before_action :check_login

  def index
    @posts = Post.last(Post::INDEX_DISPLAY)
  end
end
