require 'sidekiq'
require 'open-uri'
require 'csv'
require 'byebug'

Sidekiq.configure_client do |config|
  config.redis = {db: 1}
end

Sidekiq.configure_server do |config|
  config.redis = {db: 1}
end

class UpdateDatabase
  include Sidekiq::Worker

  def perform(url)
    # code for updating the database here
  end
end
