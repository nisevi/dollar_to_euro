require 'spec_helper'

describe 'Check if file exists and requires all necessary files.' do
  it 'should be a file' do
    expect(File).to exist('lib/dollar_to_euro.rb')
  end

  it 'should require all necessary files' do
    directory = Dir['lib/dollar_to_euro/*']
    files = directory.map! { |path| path[/[\w-]+?(?=\.)/] }
    file = File.open('lib/dollar_to_euro.rb')
    file.each do |line|
      expect(files).to include(line[/(?<=\/)[^']+/])
    end
  end
end