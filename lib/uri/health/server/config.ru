#\ -D lib/uri/health/server/app.rb -p 8700
require 'sinatra'

require_relative 'app'
require_relative '../../health'

run App
