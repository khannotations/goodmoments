# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Do so before initialization!
unless Rails.env.production?
  credentials = YAML.load_file("#{Rails.root}/config/credentials.yml")
  credentials.each do |key, value|
    ENV[key] = value
  end
end

# Initialize the Rails application.
Rails.application.initialize!
