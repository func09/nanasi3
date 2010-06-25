# include at least one source and the rails gem
source :gemcutter
gem 'rails', '~> 2.3.8', :require => nil
gem 'haml'
gem 'forgery'
gem 'json'
gem 'oauth'
gem 'ezcrypto'

# Devise 1.0.2 is not a valid gem plugin for Rails, so use git until 1.0.3
# gem 'devise', :git => 'git://github.com/plataformatec/devise.git', :ref => 'v1.0'

group :development do
  # bundler requires these gems in development
  gem 'rails-footnotes'
  gem 'sqlite3-ruby', :require => 'sqlite3'
end

group :test do
  # bundler requires these gems while running tests
  gem 'rspec'
end
