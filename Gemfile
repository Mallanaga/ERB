source 'https://rubygems.org'

ruby '1.9.3'
  
gem 'rails', '~> 3.2.16'

gem 'thin'
gem 'memcachier'
gem 'dalli'
gem 'bcrypt-ruby', '~> 3.0.1'
gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'sass-rails', '~> 3.2.3'
gem 'anjlab-bootstrap-rails', require: 'bootstrap-rails', github: 'anjlab/bootstrap-rails'
gem 'kaminari'
gem 'kaminari-bootstrap', github: 'mcasimir/kaminari-bootstrap'

gem 'rails_autolink', '1.1.0'
gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'

gem 'friendly_id', '~> 4.0.9'
gem 'rake'
gem 'best_in_place'

# posts and images inside of posts for uploading to amazon s3
gem 'ckeditor', '~> 4.0.6'
gem 'carrierwave', '~> 0.9.0'
gem 'mini_magick', github: 'minimagick/minimagick', ref: '6d0f8f953112cce6324a524d76c7e126ee14f392'
gem 'fog', '~> 1.18.0'
gem 'nokogiri', '~> 1.6.0'
gem 'feedzirra', github: 'pauldix/feedzirra'


group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '2.11.0'
  gem 'annotate', '2.5.0'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '>= 1.2.3'
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails', '4.1.0'
end

group :production do
  gem 'pg'
  gem 'newrelic_rpm'
end