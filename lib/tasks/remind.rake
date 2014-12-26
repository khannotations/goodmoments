desc "Notify users to write"
task :remind_users => :environment do
  User.remind_all
end