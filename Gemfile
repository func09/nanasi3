# include at least one source and the rails gem
source :gemcutter
gem 'rails', '~> 2.3.8', :require => nil
gem 'haml'
gem 'forgery'
gem 'json'
gem 'oauth'
gem 'ezcrypto'

group :development do
  # bundler requires these gems in development
  gem 'rails-footnotes'
  gem 'sqlite3-ruby', :require => 'sqlite3'
end

group :test do
  # bundler requires these gems while running tests
  gem 'rspec'
end
