# Load the Rails application.
require File.expand_path('../application', __FILE__)

credentials_file = "config/credentials.yml"
# Do so before initialization!
# Load the environment from a secret file. When you deploy to Heroku, you'll
# have to set these files manually.
unless Rails.env.production?
  credentials = YAML.load_file("#{Rails.root}/#{credentials_file}")
  credentials.each do |key, value|
    ENV[key] = value
  end
end

# Initialize the Rails application.
Rails.application.initialize!
