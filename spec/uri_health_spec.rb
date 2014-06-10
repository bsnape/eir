require_relative 'spec_helper'

describe Uri::Health do

  before(:each) do
    @uri_health = Uri::Health::Status.new
  end

  it 'should read URIs from a YAML file' do
    @uri_health.uris.should ==
      [
        { 'http://www.google.co.uk' => 'Google' },
        { 'http://www.yahoo.co.uk' => 'Yahoo' },
        { 'http://www.itv.com' => 'ITV' }
      ]
  end

  it 'should make an HTTP request for each URI' do
    @uri_health.stub(:get_http_response_code).and_return(200)
    responses = @uri_health.go
    responses.each { |uri, status_code| status_code.should == 200 }
  end

  it 'should return a hash of the URL alias and status code' do
    @uri_health.stub(:get_http_response_code).and_return(200)
    responses = @uri_health.go
    responses.should == { 'Google' => 200, 'Yahoo' => 200, 'ITV' => 200 }
  end

  it 'should start and stop without errors' do
    @uri_health.start
    @uri_health.stop
  end

end
