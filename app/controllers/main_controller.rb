class MainController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about]

  # Like an 'index' action, except it made more sense to me to name it 
  # 'history' because that's what it's showing. Actions can be named anything!
  def history
    # Order by date created in reverse order. Only get the current_user's
    # posts
    @posts = current_user.posts.order(created_at: :desc)
  end

  # Create a new post
  def create
    # post_params is defined in a method below.
    @post = Post.new(post_params)
    # post's user must be current user
    @post.user = current_user
    if @post.save
      redirect_to history_path, notice: "Post created"
    else
      # error_messages is defined in app/controllers/application_controller.rb
      redirect_to write_path, alert: ("Post failed to create. " + 
        error_messages(@post))
    end
  end

  # Toggles email notification. Request is submitted by AJAX.
  def toggleEmail
    current_user.email_reminder = !current_user.email_reminder
    current_user.save # Assumes success...probably not the best practice
    render json: ""
  end

  # Destroys user account
  def destroy
    current_user.destroy
    redirect_to root_path
  end

  protected

  # Only allow post text.
  def post_params
    params.permit(:text)
  end
end
