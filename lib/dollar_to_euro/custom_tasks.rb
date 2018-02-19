# frozen_string_literal: true

require 'rake'

module DollarToEuro
  class CustomTasks
    include Rake::DSL if defined? Rake::DSL

    def load_tasks
      load 'dollar_to_euro/tasks/update_dollar_to_euro_database.rake'
    end
  end
end

DollarToEuro::CustomTasks.new.load_tasks