class UserMailer < ActionMailer::Base
  # Configuration options at config/initializers/smtp_settings.rb
  default from: "Good Moments <noreply@goodmoments.com>"

  # Send a reminder email, given the user
  def remind(user)
    @user = user # Set to instance variable so view has access
                 # View is in view/mailers/remind.html.erb
    # `pretty_email` defined in app/models/user.rb
    mail(to: user.pretty_email, subject: "Note today's good moments!")
  end
end
