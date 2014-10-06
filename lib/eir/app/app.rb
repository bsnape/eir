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
    @eir       = Eir::Request.new
    @responses = @eir.go
    haml :dashboard, layout: (request.xhr? ? false : :layout)
  end

end
