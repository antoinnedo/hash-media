source 'https://rubygems.org'

# Core Rails
gem 'rails', '~> 8.0.2'

# Database
gem 'pg', '~> 1.1'
gem 'solid_queue'
gem 'solid_cache'
gem 'solid_cable'

# Authentication
gem 'devise', '~> 4.9.4'
gem 'omniauth', '~> 2.1.3'

# Frontend
gem 'importmap-rails', '~> 2.1.0'
gem 'propshaft', '~> 1.1.0'
gem 'stimulus-rails', '~> 1.3.4'
gem 'tailwindcss-rails', '~> 4.4.0'
gem 'turbo-rails', '~> 2.0.16'

# Image processing
gem 'image_processing', '~> 1.14.0'
gem 'ruby-vips', '~> 2.2.4'

# Production
gem 'kamal', '~> 2.7.0'
gem 'thruster', '~> 0.1.14'
gem 'bootsnap', '~> 1.18.6', require: false
gem 'jbuilder', '~> 2.13.0'
gem 'puma', '>= 5.0'

# System dependencies
gem 'psych', '~> 5.2.6'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem 'debug', '~> 1.11.0', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', '~> 3.1.8'
  gem 'capybara', '~> 3.40.0'
  gem 'selenium-webdriver', '~> 4.34.0'
  gem 'brakeman', '~> 7.0.2', require: false
  gem 'rubocop-rails-omakase', '~> 1.1.0'
end

group :development do
  gem 'letter_opener', '~> 1.10.0'
  gem 'listen', '~> 3.9.0'
  gem 'spring', '~> 4.3.0'
  gem 'web-console', '~> 4.2.1'
end
