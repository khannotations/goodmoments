class MainController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about]

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

  def toggleEmail
    current_user.email_reminder = !current_user.email_reminder
    current_user.save
    render json: ""
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end

  protected

  def post_params
    params.permit(:text)
  end
end
