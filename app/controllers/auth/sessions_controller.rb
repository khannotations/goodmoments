class Auth::SessionsController < Devise::SessionsController
  def new
    render 'main/index'
  end
end
