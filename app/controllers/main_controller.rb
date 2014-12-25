class MainController < ApplicationController
  before_action :authenticate_user!, only: [:history, :write, :create]

  def history
    @posts = current_user.posts
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to history_path, notice: "Post created"
    else
      flash[:error] = "Post failed to create. " + error_messages(@post)
    end
  end

  protected

  def post_params
    params.permit(:text)
  end
end
