require 'spec_helper'

describe 'Check app version.' do
  it 'should be the latest version' do
    expect(DollarToEuro::VERSION).to match('0.1.0')
  end
end