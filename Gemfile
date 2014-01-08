source 'https://rubygems.org'

ruby '1.9.3'
  
gem 'rails', '~> 3.2.16'

gem 'thin'
gem 'memcachier'
gem 'dalli'
gem 'bcrypt-ruby', '~> 3.0.1'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'rake'

gem 'sass-rails'
gem 'anjlab-bootstrap-rails', require: 'bootstrap-rails', github: 'anjlab/bootstrap-rails'
gem 'kaminari'
gem 'kaminari-bootstrap', github: 'mcasimir/kaminari-bootstrap'

gem 'rails_autolink'
gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'

gem 'friendly_id', '~> 4.0.9'
gem 'best_in_place'
gem 'gmaps4rails', '~> 2.1.1'
gem 'geocoder'
gem 'meta-tags', require: 'meta_tags'

# posts and images inside of posts for uploading to amazon s3
gem 'ckeditor', '~> 4.0.6'
gem 'carrierwave', '~> 0.9.0'
gem 'mini_magick', github: 'minimagick/minimagick', ref: '6d0f8f953112cce6324a524d76c7e126ee14f392'
gem 'unf'
gem 'fog', '~> 1.18.0'
gem 'nokogiri', '~> 1.6.0'
gem 'feedzirra', github: 'pauldix/feedzirra'


group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'annotate'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '>= 3.2.2'
  gem 'uglifier', '>= 1.2.3'
  gem 'turbo-sprockets-rails3'
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails', '4.1.0'
end

group :production do
  gem 'pg'
  gem 'newrelic_rpm'
  gem 'rails_12factor'
end