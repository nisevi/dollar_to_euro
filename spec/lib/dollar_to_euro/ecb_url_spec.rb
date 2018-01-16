require 'spec_helper'

describe 'Source URL from where exchange values are collected.' do
  it 'should be a string' do
    expect(DollarToEuro::ECB_URL).to be_kind_of(String)
  end

  it 'should be an URL' do
    @url = URI.parse(DollarToEuro::ECB_URL) rescue false
    expect(@url).not_to be false
    expect(@url).to be_kind_of URI::HTTP
    expect(@url.host).to match /sdw\.ecb\.europa\.eu/
    expect(@url.html_safe?).to be false
    expect(@url.to_s).to match DollarToEuro::ECB_URL
  end
end