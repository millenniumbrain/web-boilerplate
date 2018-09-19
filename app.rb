require 'puma'
require 'roda'
require 'json'
require 'better_errors'
require 'logger'
require 'tilt/erubis'
require './models'

class App < Roda
  plugin :default_headers,
    'Content-Type' => 'text/html',
    #'Content-Security-Policy' => "default-src 'self'",
    'Strict-Transport-Security' => 'max-age=160704400',
    'X-Frame-Options' => 'deny',
    'X-Content-Type-Options' => 'nosniff',
    'X-XSS-Protection' => '1; mode=block'
  plugin :environments
  plugin :multi_route
  plugin :render, :engine => 'erubis', :views => 'views'
  plugin :static, ['/js', '/css']
  plugin :flash
  plugin :h
  plugin :multi_route

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
