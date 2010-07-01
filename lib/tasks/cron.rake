task :cron => :environment do
  puts "Updating App User Info..."
  User.update_app_user
  puts "done."
end