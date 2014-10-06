require_relative 'spec_helper'

describe Eir do

  it 'should look for custom YAML in the current directory' do
    File.open('uris.yaml', 'w+') { |f| f.write('- http://www.google.co.uk : Google') }
    expect(Eir::Request.new.uris).to eq([{ 'http://www.google.co.uk' => 'Google' }])
    File.delete 'uris.yaml'
  end

  it 'should fall back to a list of default URIs if no local YAML file is present' do
    expect(Eir::Request.new.uris).to eq(
                                       [
                                         { 'http://www.google.co.uk' => 'Google' },
                                         { 'http://www.yahoo.co.uk' => 'Yahoo' },
                                         { 'http://www.itv.com' => 'ITV' }
                                       ]
                                     )
  end

  it 'should make an HTTP request for each URI' do
    @request = Eir::Request.new
    @request.stub(:get_http_response_code).and_return(200)
    responses = @request.go
    responses.each { |_, status_code| expect(status_code).to eq(200) }
  end

  it 'should return a hash of the URL alias and status code' do
    @request = Eir::Request.new
    @request.stub(:get_http_response_code).and_return(200)
    responses = @request.go
    expect(responses).to eq('Google' => 200, 'Yahoo' => 200, 'ITV' => 200)
  end

  it 'should time out after 5 seconds for an unresponsive status call' do
    @request      = Eir::Request.new
    @request.uris = [{ 'http://www.google.co.uk' => 'Google' }]
    @request.stub(:request) { sleep 10 }
    responses = @request.go
    expect(responses).to eq('Google' => false)
  end

end
