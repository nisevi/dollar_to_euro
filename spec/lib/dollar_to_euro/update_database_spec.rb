# frozen_string_literal: true

require 'spec_helper'
require 'csv'

describe 'Update the database.' do
  def csv_headers
    [
      ['Data Source in SDW: null', ''],
      ['', 'EXR.D.USD.EUR.SP00.A'],
      ['', '"ECB reference exchange rate, US dollar/Euro, 2:15 pm (C.E.T.)"'],
      ['Collection:', 'Average of observations through period (A)'],
      ['Period\Unit:', '[US dollar ]']
    ]
  end

  def csv_content
    [
      %w[2018-02-16 1.2464],
      %w[2018-02-15 1.2493],
      %w[2018-02-14 1.2348],
      %w[2018-02-13 1.2333],
      %w[2018-02-09 1.2273],
      %w[2018-02-12 1.2263],
      %w[2018-02-08 1.2252]
    ]
  end

  def csv_file
    CSV.generate do |csv|
      csv_headers.each { |header| csv << header }
      csv_content.each { |content| csv << content }
    end
  end

  let(:file) { csv_file }

  before(:each) do
    @dollar1 = Dollar.create(date: Date.parse('2017-12-27'), value: rand(0.1...1.9))
    @dollar2 = Dollar.create(date: Date.parse('2017-12-28'), value: rand(0.1...1.9))
    @dollar3 = Dollar.create(date: Date.parse('2017-12-29'), value: rand(0.1...1.9))
  end

  after(:each) do
    Dollar.delete_all
  end

  it 'should perform the update'

  it 'should download the file'

  it 'should tell us if the file has changed' do
    digest = Digest::SHA2.new(256).hexdigest(file)
    CsvHash.create(digest: digest)
    expect(UpdateDatabase.file_not_changed?(digest)).to be true
    CsvHash.delete_all
    expect(UpdateDatabase.file_not_changed?(digest)).to be false
  end

  it 'should process the CSV file'

  it 'should setup the attributes'

  it 'should update the database'
end