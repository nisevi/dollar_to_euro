require 'spec_helper'

Dollar = Struct.new(:date, :value)

describe 'Dollar class attributes.' do
  before(:each) do
    @dollar = Dollar.new(Date.today, 1.234)
  end

  it 'should assign values to class attributes' do
    expect(@dollar).to have_attributes(date: Date.today)
    expect(@dollar).to have_attributes(value: 1.234)
    expect(@dollar).to have_attributes(date: Date.today, value: 1.234)
    expect(@dollar).not_to have_attributes(date: Date.parse('2018-09-09'))
    expect(@dollar).not_to have_attributes(value: 2.345)
  end
end