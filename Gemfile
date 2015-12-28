source 'https://rubygems.org'

gem 'bcrypt', '~> 3.1.10'
gem 'json', '~> 1.8.3'
gem 'puma', '~> 2.15.3'
gem 'rake', '~> 10.4.2'
gem 'rack_csrf', '~> 2.5.0'
gem 'roda', '~> 2.9.0'
gem 'sequel', '~> 4.29.0'
gem 'slim', '~> 3.0.6'

group :production do
  gem 'pg', '~> 0.18.4'
end

group :documentation do
  gem 'yard', '~> 0.8.7.6', :require => false
end

group :testing, :development do
  gem 'better_errors', '~> 2.1.1'
  gem 'binding_of_caller', '~> 0.7.2'
  gem 'capybara', '~> 2.5.0'
  gem 'rack-test', '~> 0.6.3', :require => 'rack/test'
  gem 'rspec', '~> 3.4.0'
  gem 'sass', '~> 3.4.20'
  gem 'shotgun', '~> 0.9.1'
  gem 'sqlite3', '~> 1.3.11'
end

group :testing do
  gem 'coderay', '~> 1.1.0'
end
