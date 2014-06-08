require 'sinatra'
require 'json'

class App < Sinatra::Base

  set :root, File.dirname(__FILE__)

  get '/status' do
    status 200
  end

  get '/' do
    @uri_health = Uri::Health::Status.new
    @responses  = @uri_health.go
    haml :dashboard
  end

end
