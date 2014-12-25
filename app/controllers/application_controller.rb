class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def render_error(msg="", status=400) 
    render json: {error: msg}, status: status
  end

  def error_messages(model)
    model.errors.full_messages.join " and "
  end

  # Devise methods
  def after_sign_in_path_for(resource)
    '/protected'
  end

  def after_sign_out_path_for(resource)
    root_url
  end
end
