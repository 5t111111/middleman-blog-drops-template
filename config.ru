require 'rack'
require 'rack/contrib/try_static'
# Heroku New Relic Addon
require 'newrelic_rpm' if ENV['RACK_ENV'] == 'production'

# Build the static site when the app boots
`npm install`
`bundle exec middleman build`

use Rack::TryStatic,
    :root => 'build',
    :urls => %w[/],
    :try => ['.html', 'index.html', '/index.html']

# otherwise 404 NotFound
run proc { [404, { 'Content-Type' => 'text/html' }, [File.read(File.expand_path('../build/404/index.html', __FILE__))]] }
