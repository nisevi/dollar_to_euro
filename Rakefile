# frozen_string_literal: true
def dump_load_path
  puts $LOAD_PATH.join("\n")
  found = nil
  $LOAD_PATH.each do |path|
    if File.exist?(File.join(path, 'rspec'))
      puts "Found rspec in #{path}"
      found = found_core?(path)
    end
  end
  found_is_nil?(found)
end

def found_core?(path)
  if File.exist?(File.join(path, 'rspec', 'core'))
    puts 'Found core'
    found_rake_task?(path)
  else
    puts '!!! no core'
    nil
  end
end

def found_rake_task?(path)
  if File.exist?(File.join(path, 'rspec', 'core', 'rake_task'))
    puts 'Found rake_task'
    path
  else
    puts '!! no rake_task'
    nil
  end
end

def found_is_nil?(found)
  if found.nil?
    puts "Didn't find rspec/core/rake_task anywhere"
  else
    puts "Found in #{path}"
  end
end

require 'bundler'
require 'rake/clean'

begin
require 'rspec/core/rake_task'
rescue LoadError
dump_load_path
raise
end

require 'cucumber'
require 'cucumber/rake/task'
gem 'rdoc' # we need the installed RDoc gem, not the system one
require 'rdoc/task'

include Rake::DSL

Bundler::GemHelper.install_tasks

RSpec::Core::RakeTask.new do |t|
  # Put spec opts in a file named .rspec in root
end

CUKE_RESULTS = 'results.html'
CLEAN << CUKE_RESULTS
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format html -o #{CUKE_RESULTS} --format pretty --no-source -x"
  t.fork = false
end

Rake::RDocTask.new do |rd|
  rd.main = 'README.rdoc'
  rd.rdoc_files.include('README.rdoc', 'lib/**/*.rb', 'bin/**/*')
end

task default: %i[spec features]
