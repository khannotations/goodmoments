# My SMTP settings. ENV draws from environment variables. Because I don't want
# the world at large to just see my Gmail username and password, I store those
# in a separate file that I include in my .gitignore file (in this case,
# config/credentials.yml). I then load those in my config/environments.rb.
ActionMailer::Base.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'gmail.com',
  user_name:            ENV['GMAIL_USERNAME'],
  password:             ENV['GMAIL_PASSWORD'],
  authentication:       'plain',
  enable_starttls_auto: true
}