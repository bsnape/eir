require 'sinatra'
require 'json'
require 'logger'

configure { set :server, :puma }

class App < Sinatra::Base

  configure do
    set :root, File.dirname(__FILE__)
    enable :logging
  end

  get '/status' do
    status 200
  end

  get '/' do
    @uri_health_request = Uri::Health::Request.new
    @responses          = @uri_health_request.go
    haml :dashboard, :layout => (request.xhr? ? false : :layout)
  end

end
