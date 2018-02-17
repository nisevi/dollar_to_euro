# frozen_string_literal: true

require 'dollar_to_euro/worker'

desc 'Task in charge of calling the functionality for updating the database.'
task :update_database do
  UpdateDatabase.perform(ECB_URL)
end