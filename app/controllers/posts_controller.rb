class PostsController < ApplicationController
  def index
    @posts = Post.limit(Post::INDEX_DISPLAY)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def create
    @post = Post.new
    @post.title = params[:title]
    @post.description = params[:description]

    if @post.save!
      redirect_to action: "show", id: @post.id
      flash[:success] = "投稿を作成しました。"
    end
  end
end
