source 'https://rubygems.org'
ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring', group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'foreman'
gem 'puma', '~> 2.9.0'

gem 'pg'
# foreign keys for AR
gem "schema_plus"

gem 'slim', "~> 2.0.2"

gem "twitter-bootstrap-rails"

# Speed boost for rails 4 logging and assets. Needed for Heroku.
gem 'rails_12factor', group: :production

gem "github_api"

group :development do
  gem 'quiet_assets'
  gem 'guard', '~> 2.6.1'
  gem 'guard-spring'
  gem 'guard-cucumber'
  gem 'guard-rspec', '~> 4.3.1'
  # fast console
  gem 'pry-rails'
  gem "spring-commands-rspec"
  gem "spring-commands-cucumber"
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0.2'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'zonebie'
  gem 'webmock'
  gem 'vcr', '~> 2.9.2'
end

group :test do
  gem 'minitest'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'simplecov', :require => false
  gem 'cucumber-rails', '~> 1.4.1', :require => false
end
