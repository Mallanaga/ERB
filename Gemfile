source 'https://rubygems.org'

ruby '1.9.3'
  
gem 'rails', '3.2.12'
gem 'thin'
gem 'memcachier'
gem 'dalli'
gem 'bcrypt-ruby', '~>3.0.1'
gem 'anjlab-bootstrap-rails', require: 'bootstrap-rails', github: 'anjlab/bootstrap-rails'
gem 'kaminari'
gem 'kaminari-bootstrap', github: 'mcasimir/kaminari-bootstrap'
gem 'faker', '1.0.1'
gem 'rails_autolink', '1.1.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'
gem 'friendly_id', '~> 4.0.9'
gem 'rake'
gem 'ckeditor'
gem 'carrierwave'
gem 'mini_magick', github: 'minimagick/minimagick', ref: '6d0f8f953112cce6324a524d76c7e126ee14f392'
gem 'fog'
gem 'unf'
gem 'nokogiri', '~> 1.6.0'
gem 'feedzirra', github: 'pauldix/feedzirra'
gem 'best_in_place'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '2.11.0'
  gem 'annotate', '2.5.0'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '>= 1.2.3'
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails', '4.1.0'
  gem 'cucumber-rails', '1.2.1', require: false
  gem 'database_cleaner', '0.7.0'
  
  # System-dependent gems
  gem 'rb-fchange', '0.0.5'
  gem 'rb-notifu', '0.0.4'
  gem 'win32console', '1.3.0'
  gem 'wdm', '~> 0.0.3'
  # gem 'launchy', '2.1.0'
  # gem 'rb-fsevent', '0.9.1', :require => false
  # gem 'growl', '1.0.3'
end

group :production do
  gem 'pg'
  gem 'newrelic_rpm', github: 'newrelic/rpm'
end