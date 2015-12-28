require './app'

run lambda { |env|
  [
    404,
    {
      'Content-Type' => 'text/html'
    },
    File.open('public/404.html', File::RDONLY)
  ]
}

use Rack::Deflater
run App
