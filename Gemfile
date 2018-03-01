source 'https://rubygems.org'

gem 'bcrypt'
gem 'json'
gem 'puma'
gem 'rake'
gem 'rack_csrf'
gem 'roda'
gem 'sequel'
gem 'erubis'

group :production do
  gem 'pg'
end

group :documentation do
  gem 'yard', :require => false
end

group :testing, :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'capybara'
  gem 'rack-test' :require => 'rack/test'
  gem 'rspec'
  gem 'sass'
  gem 'sqlite3'
end

group :testing do
  gem 'coderay'
end
