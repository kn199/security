class PostsController < ApplicationController
  before_action :current_user
  before_action :check_login

  def index
    @posts = Post.last(Post::INDEX_DISPLAY)
  end

  def new; end

  def create
    post = Post.new
    post.title = params[:title]
    post.description = params[:description]
    post.user_id = @current_user.id

    if post.save!
      redirect_to action: "index"
      flash[:success] = "投稿を作成しました。"
    end
  end
end
