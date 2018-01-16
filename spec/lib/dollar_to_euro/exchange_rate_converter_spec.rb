require 'spec_helper'

describe 'Exchange rates functionality.' do
  before(:each) do
    @weekend = '2018-01-14'
    @holiday = '2018-01-15'
    @workday = '2018-01-16'
  end

  it 'should be holidays' do
    expect(ExchangeRateConverter.holiday?(@holiday)).to be true
  end

  it 'should not be holidays' do
    expect(ExchangeRateConverter.holiday?(@workday)).to be false
  end

  it 'should be weekend' do
    expect(ExchangeRateConverter.weekend?(@weekend)).to be true
  end

  it 'should not be a weekend' do
    expect(ExchangeRateConverter.weekend?(@workday)).to be false
  end

  it 'should check holiday or weekend' do
    expect(ExchangeRateConverter.date_is_holiday_or_weekend?(@holiday)).to be true
    expect(ExchangeRateConverter.date_is_holiday_or_weekend?(@weekend)).to be true
    expect(ExchangeRateConverter.date_is_holiday_or_weekend?(@workday)).to be false
  end

  it 'should check if the we have registers for exchange' do
    @dollar = Dollar.new(date: Date.today, value: 1.234)
    @dollar.save
    expect(Dollar.count.zero?).not_to be true
    expect(Dollar.count).to eql 1
    Dollar.destroy_all
    expect(Dollar.count.zero?).to be true
  end

  it 'should return the previous available' do

  end

  it 'should return a default date' do

  end

  it 'should use a default rate' do

  end

  it 'should convert with the correct exchange' do

  end
end