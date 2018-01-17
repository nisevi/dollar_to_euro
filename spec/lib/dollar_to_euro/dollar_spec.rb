require 'spec_helper'

describe 'Dollar class attributes.' do
  it 'should assign values to class attributes' do
    dollar = Dollar.create(date: Date.today, value: 1.234)
    expect(dollar).to have_attributes(date: Date.today)
    expect(dollar).to have_attributes(value: 1.234)
    expect(dollar).to have_attributes(date: Date.today, value: 1.234)
    expect(dollar).not_to have_attributes(date: Date.parse('2018-09-09'))
    expect(dollar).not_to have_attributes(value: 2.345)
  end
end