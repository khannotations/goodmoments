class Auth::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      # session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to root_url # For now, only allowed Rafi or Kenta in
    end
  end
end
