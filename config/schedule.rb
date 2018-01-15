# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# For loading the cron jobs run 'whenever -i'

# Learn more: http://github.com/javan/whenever

require_relative '../lib/dollar_to_euro/ecb_url'
require_relative '../lib/dollar_to_euro/worker'

job_type :custom_job, 'cd :path && bundle exec bin/dollar_to_euro --update'

every 1.day, :at => '4:30 am' do
  url = "#{DollarToEuro::ECB_URL}&start=04-01-1999&end=#{Date.today.strftime("%d-%m-%Y")}&type=csv"
  custom_job "UpdateDatabase.perform_async('#{url}')"
end
