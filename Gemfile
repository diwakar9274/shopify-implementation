# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 7.0.4'

gem 'sprockets-rails'

gem 'pg'

gem 'puma', '~> 5.0'

gem 'importmap-rails'

gem 'turbo-rails'

gem 'stimulus-rails'

gem 'jbuilder'

# gem "redis", "~> 4.0"

# gem "kredis"

# gem "bcrypt", "~> 3.1.7"

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# gem "sassc-rails"

# gem "image_processing", "~> 1.2"

group :development, :test do
  gem 'byebug', '~> 11.1'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'web-console'

  # gem "rack-mini-profiler"

  # gem "spring"
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'dotenv-rails', groups: %i[development test]
gem 'faraday', '~> 2.6'
gem 'haml-rails', '~> 2.1'
gem 'requestjs-rails', '~> 0.0.10'
gem 'sass-rails', '~> 6.0'
gem 'sidekiq', '~> 6.5', '>= 6.5.8'
gem 'stripe'
gem 'whenever', '~> 1.0'

gem 'rubocop', '~> 1.41', group: :development
