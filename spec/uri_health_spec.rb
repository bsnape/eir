require_relative 'spec_helper'

describe Uri::Health do

  it 'should return the status code of a URI' do
    responses = Uri::Health::Status.new(['http://www.google.co.uk']).go
    responses.each { |uri, status_code| status_code.should be_a_kind_of(Fixnum) }
  end

  it 'should return a hash with URIs as keys with corresponding status codes' do
    Uri::Health::Status.new(['http://www.google.co.uk']).go.should be_a_kind_of(Hash)
  end

end
