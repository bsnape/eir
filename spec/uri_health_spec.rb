require_relative 'spec_helper'

describe Uri::Health do

  before(:each) do
    @request = Uri::Health::Request.new
  end

  it 'should look for custom YAML in the current directory' do
    File.open('uris.yaml', 'w+') { |f| f.write('- http://www.google.co.uk : Google') }
    Uri::Health::Request.new.uris.should == [{ 'http://www.google.co.uk' => 'Google' }]
    File.delete 'uris.yaml'
  end

  it 'should fall back to a list of default URIs if no local YAML file is present' do
    @request.uris.should ==
      [
        { 'http://www.google.co.uk' => 'Google' },
        { 'http://www.yahoo.co.uk' => 'Yahoo' },
        { 'http://www.itv.com' => 'ITV' }
      ]
  end

  it 'should make an HTTP request for each URI' do
    @request.stub(:get_http_response_code).and_return(200)
    responses = @request.go
    responses.each { |uri, status_code| status_code.should == 200 }
  end

  it 'should return a hash of the URL alias and status code' do
    @request.stub(:get_http_response_code).and_return(200)
    responses = @request.go
    responses.should == { 'Google' => 200, 'Yahoo' => 200, 'ITV' => 200 }
  end

end
