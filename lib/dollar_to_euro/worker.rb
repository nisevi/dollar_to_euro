require 'sidekiq'
require 'open-uri'
require 'csv'
require 'mongoid'
require 'dotenv'
require_relative 'dollar'

Sidekiq.configure_client do |config|
  config.redis = {db: 1}
end

Sidekiq.configure_server do |config|
  config.redis = {db: 1}
end

class UpdateDatabase
  include Sidekiq::Worker
  Dotenv.load!('.env')
  Mongoid.load!('mongoid.yml')

  def perform(url)
    # dollar = Dollar.new(date: Date.today.to_s, value: 1.123)
  end
end
