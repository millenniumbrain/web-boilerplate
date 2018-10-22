source 'https://rubygems.org'

gem 'json'
gem 'puma'
gem 'rake'
gem 'rack_csrf'
gem 'roda'
gem 'sequel'
gem 'erubis'
gem 'tilt'
gem 'rbnacl'
gem 'nokogiri'
gem 'activesupport'
gem 'jwt'

group :production do
  gem 'pg'
end

group :documentation do
  gem 'yard', :require => false
end

group :testing, :development do
  gem 'binding_of_caller'
  gem 'rack-test', :require => 'rack/test'
  gem 'rspec'
  gem 'sass'
  gem 'sqlite3'
end

group :testing do
  gem 'coderay'
end
