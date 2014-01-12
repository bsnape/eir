require_relative 'spec_helper'

describe Uri::Health do

  it 'should return the status code of a URI' do
    Uri::Health::Status.new('http://www.google.co.uk').go.should be_a_kind_of(Fixnum)
  end

end
