require 'puma'
require 'roda'
require 'json'
require 'better_errors'
require 'logger'
require 'rbnacl'
require 'securerandom'
require 'base64'
require 'active_support'
require 'active_support/core_ext/date_time'
require 'active_support/core_ext/date'
require 'active_support/core_ext/time'
require 'active_support/core_ext/numeric'
require 'nokogiri'
require 'jwt'
require 'tilt/erubis'
require './models'
require './env.rb'

class App < Roda
  plugin :default_headers,
    'Content-Type' => 'text/html',
    'Content-Security-Policy' => "default-src 'self' #{ENV['BASE_URL']} *.cloudflare.com *.fontawesome.com *.googleapis.com *.gstatic.com unpkg.com; style-src 'unsafe-inline' *.fontawesome.com *.googleapis.com *.gstatic.com unpkg.com #{ENV['BASE_URL']}; img-src *",
    'Strict-Transport-Security' => 'max-age=160704400',
    'X-Frame-Options' => 'deny',
    'X-Content-Type-Options' => 'nosniff',
    'X-XSS-Protection' => '1; mode=block'
  plugin :environments
  plugin :multi_route
  plugin :render, :engine => 'erubis', :views => 'views'
  plugin :static, ['/js', '/css']
  plugin :flash
  plugin :all_verbs
  plugin :h
  plugin :multi_route
  plugin :not_found do
    Nokogiri::HTML(File.open("public/404.html")).to_s
  end

  self.environment = :development

  configure do
    use Rack::Session::Cookie, :secret => ENV['SECRET']
    use Rack::Session::Pool, :expire_after => 252000
  end

  configure :development do
    use Rack::MethodOverride
    use BetterErrors::Middleware
    BetterErrors.application_root = __dir__
  end

  configure :production do
  end

  Dir['./route/*.rb'].each { |f| require f }
  Dir['./helpers/*.rb'].each { |f| require f }
  Dir['./lib/*.rb'].each { |f| require f }

  route do |r|
    r.multi_route

    r.root do
      view 'index'
    end
  end
end
