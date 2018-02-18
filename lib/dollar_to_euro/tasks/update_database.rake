# frozen_string_literal: true

require 'dollar_to_euro'
require 'dollar_to_euro/worker'

desc 'Task in charge of calling the functionality for updating the database.'
task :update_database do
  url = "#{DollarToEuro::ECB_URL}&start=04-01-1999&end=#{Date.today.strftime("%d-%m-%Y")}&type=csv"
  UpdateDatabase.perform(url)
end