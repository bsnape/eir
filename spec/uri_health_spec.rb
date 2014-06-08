require_relative 'spec_helper'

describe Uri::Health do

  before(:each) do
    @uri_health = Uri::Health::Status.new
  end

  it 'should read URIs from a YAML file' do
    @uri_health.uris.should == %w(http://www.google.co.uk http://www.yahoo.co.uk http://www.itv.com)
  end

  it 'should make an HTTP request for each URI' do
    @uri_health.stub(:get_http_response_code).and_return(200)
    responses = @uri_health.go
    responses.each { |uri, status_code| status_code.should == 200 }
  end

  it 'should start and stop without errors' do
    @uri_health.start
    @uri_health.stop
  end

end
