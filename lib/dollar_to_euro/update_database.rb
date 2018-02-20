# frozen_string_literal: true

require 'open-uri'
require 'mongoid'
require 'digest/sha2'
require 'date'
require_relative 'dollar'
require_relative 'csv_hash'

class UpdateDatabase
  Mongoid.load!('mongoid.yml', :development)

  class << self
    def perform(url)
      download_file(url)
      digest = Digest::SHA2.new(256).hexdigest('csv/dollars.csv')
      return if file_not_changed?(digest)
      CsvHash.create(digest: digest)
      clean_attrs = setup_attributes(process_csv_attributes)
      update_database(clean_attrs)
    end

    def download_file(url)
      IO.copy_stream(open(url), 'csv/dollars.csv')
    end

    def file_not_changed?(digest)
      last = CsvHash.last
      !last.nil? && last.digest == digest
    end

    def process_csv_attributes
      file = File.open('csv/dollars.csv', 'r')
      count = 0
      attributes = []
      while line = file.gets
        count += 1
        next if count < 6
        date, value = line.split(',')
        attributes << { date: Date.parse(date), value: value.strip.to_f }
      end
      attributes
    end

    def setup_attributes(attributes)
      return attributes.reverse if Dollar.count.zero?
      last = Dollar.last
      return {} if attributes.first[:date] == last.date
      attributes.select { |dollar| dollar[:date] > last.date }.reverse
    end

    def update_database(attrs)
      Dollar.create(attrs) unless attrs.empty?
    end
  end
end
