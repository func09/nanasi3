# Load ENV
# 1. Try load ./env.rb
# 2. Try load ../../shared/env.rb
[File.expand_path('env.rb',Rails.root), File.expand_path('../../shared/env.rb', Rails.root)].each do |env_file|
  if File.exists? env_file
    require env_file
    p "load env file #{env_file}"
    break
  end
end



