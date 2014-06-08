require_relative 'spec_helper'

describe 'Sinatra Dashboard' do

  include Rack::Test::Methods

  def app
    Sinatra::Application.new(App.new)
  end

  it 'should have a status endpoint' do
    get '/status'
    last_response.status.should == 200
  end

end
