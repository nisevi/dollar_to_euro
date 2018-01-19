require 'sidekiq'
require 'open-uri'
require 'mongoid'
require 'digest/sha2'
require 'date'
require_relative 'dollar'
require_relative 'csv_hash'

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { db: 1 }
end

class UpdateDatabase
  include Sidekiq::Worker
  Mongoid.load!('mongoid.yml', :development)

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
      # skip first 5 lines
      count += 1
      next if count < 6
      date, value = line.split(',')
      attributes << { date: Date.parse(date), value: value.strip.to_f }
    end
    attributes
  end

  def setup_attributes(attributes)
    # if it is the first time the database is being loaded
    return attributes.reverse if Dollar.count.zero?
    # if the database is already up to date
    return {} if attributes.first[:date] == Dollar.last.date
    # we nee to load some registers to update the database
    attributes.select { |dollar| dollar[:date] > Dollar.last.date }.reverse
  end

  def update_database(attrs)
    Dollar.create(attrs) unless attrs.empty?
  end
end
