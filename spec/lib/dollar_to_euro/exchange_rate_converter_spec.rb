# frozen_string_literal: true

require 'spec_helper'

describe 'Methods that involve database interaction' do
  before(:each) do
    @dollar1 = Dollar.create(date: Date.parse('2017-12-27'), value: rand(0.1...1.9))
    @dollar2 = Dollar.create(date: Date.parse('2017-12-28'), value: rand(0.1...1.9))
    @dollar3 = Dollar.create(date: Date.parse('2017-12-29'), value: rand(0.1...1.9))
  end

  after(:each) do
    Dollar.delete_all
  end

  it 'should pick the previous rate available' do
    expect(Dollar.count).to eql 3
    weekend = Date.parse('2018-01-14')
    holiday = Date.parse('2018-01-15')
    expect(ExchangeRateConverter.previous_rate_available(weekend)).to eql Dollar.last.value
    expect(ExchangeRateConverter.previous_rate_available(holiday)).to eql Dollar.last.value
  end

  it 'should validate if default date' do
    expect(Dollar.count).to eql 3
    today = Date.today
    middle_date = Date.parse('2017-12-28')
    very_old_date = Date.parse('1990-04-04')
    expect(ExchangeRateConverter.default_date?(today)).to be true
    expect(ExchangeRateConverter.default_date?(very_old_date)).to be true
    expect(ExchangeRateConverter.default_date?(middle_date)).to be false
  end

  it 'should calculate with a default rate' do
    amount = 150
    today = Date.today
    very_old_date = Date.parse('1990-04-04')
    expect(ExchangeRateConverter.calculate_with_default_rate(amount, today)).to eql(amount / Dollar.last.value)
    expect(ExchangeRateConverter.calculate_with_default_rate(amount, very_old_date)).to eql(amount / Dollar.first.value)
  end

  it 'should convert with with a default exchange rate' do
    amount = 200
    very_old_date = '1990-04-04'
    today = Date.today.to_s
    future = (Date.today + 1).to_s
    expect(ExchangeRateConverter.convert(amount, today)).to eql(amount / @dollar3.value)
    expect(ExchangeRateConverter.convert(amount, future)).to eql(amount / @dollar3.value)
    expect(ExchangeRateConverter.convert(amount, very_old_date)).to eql(amount / @dollar1.value)
  end

  it 'should convert with with an existent exchange rate' do
    amount = 175
    expect(ExchangeRateConverter.convert(amount, @dollar2.date.to_s)).to eql(amount / @dollar2.value)
  end

  it 'should convert with with a previous exchange rate' do
    amount = 36
    weekend = '2018-01-14'
    holiday = '2018-01-15'
    expect(ExchangeRateConverter.convert(amount, weekend)).to eql(amount / @dollar3.value)
    expect(ExchangeRateConverter.convert(amount, holiday)).to eql(amount / @dollar3.value)
  end

  it 'should inform if database is out of date' do
    expect(ExchangeRateConverter.database_is_out_of_date?).to be false
    Dollar.delete_all
    expect(ExchangeRateConverter.database_is_out_of_date?).to be true
  end
end