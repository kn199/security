class PostsController < ApplicationController
  def index
    @posts = Post.last(Post::INDEX_DISPLAY)
  end

  def new; end

  def create
    @post = Post.new
    @post.title = params[:title]
    @post.description = params[:description]

    if @post.save!
      redirect_to action: "index"
      flash[:success] = "投稿を作成しました。"
    end
  end
end
