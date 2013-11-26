# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "settings"
  gem.homepage = "http://github.com/ben-biddington/settings"
  gem.license = "MIT"
  gem.summary = %Q{Settings}
  gem.description = %Q{Settings}
  gem.email = "ben.biddington@gmail.com"
  gem.authors = ["Ben Biddington"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require "rake/testtask"

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib'
  test.pattern = 'spec/**/_spec.rb'
  test.verbose = true
end

task :default => :test
