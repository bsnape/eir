require_relative 'spec_helper'

describe Uri::Health do

  it 'should read URIs from a YAML file and return a hash with status codes' do
    responses = Uri::Health::Status.new('spec/support/uris.yaml').go
    responses.each { |uri, status_code| status_code.should be_a_kind_of(Fixnum) }
  end

  it 'should generate a JSON run report' do
    response = Uri::Health::Status.new('spec/support/uris.yaml').go
    generated_json_file = File.read 'uri-health/last_run.json'
    response.to_json.should == generated_json_file
  end

end
