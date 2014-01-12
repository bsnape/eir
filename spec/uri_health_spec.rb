require_relative 'spec_helper'

describe Uri::Health do

  it 'should read URIs from a YAML file and return a hash with status codes' do
    responses = Uri::Health::Status.new('spec/support/uris.yaml').go
    responses.each { |uri, status_code| status_code.should be_a_kind_of(Fixnum) }
  end

end
