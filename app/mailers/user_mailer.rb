class UserMailer < ActionMailer::Base
  default from: "Good Moments <noreply@goodmoments.com>"

  def remind(user)
    @user = user
    mail(to: user.pretty_email, subject: "Note today's good moments!")
  end
end
